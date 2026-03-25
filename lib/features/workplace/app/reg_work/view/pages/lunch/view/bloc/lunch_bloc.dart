import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/lunch_model.dart';
import '../../data/repository/lunch_repo.dart';

part 'lunch_event.dart';
part 'lunch_state.dart';
part 'lunch_bloc.g.dart';
part 'lunch_bloc.freezed.dart';

@injectable
class LunchBloc extends BaseBloc<LunchEvent, LunchState> {
  final LogUtils _log;
  final AuthRepo _authRepo;

  final LunchRepo _lunchRepo;
  bool _isSubmittingReport = false;

  LunchBloc(this._lunchRepo, this._authRepo, this._log)
    : super(LunchState.init()) {
    on<LunchEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        submit: (quantity, location, note, dateOrder) => _onSubmit(
          emit,
          quantity: quantity,
          location: location,
          note: note,
          dateOrder: dateOrder,
        ),
        onCancelSubmit: (id) => _onCancelSubmit(
          emit,
          id: id,
        ),
        onEditSubmit: (id, quantity, location, note, dateOrder) =>
            _onEditSubmit(
              emit,
              id: id,
              quantity: quantity,
              location: location,
              note: note,
              dateOrder: dateOrder,
            ),
        clearSubmitState: () async => _onClearSubmitState(emit),
      );
    });
  }

  Future<void> _onInit(Emitter<LunchState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('❌ Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final now = DateTime.now();
        final todayStart = DateTime(now.year, now.month, now.day);
        final tomorrow = todayStart.add(const Duration(days: 1));

        // Khoảng lọc: cả ngày hôm nay và cả ngày hôm sau (đến 23:59:59).
        final startStr = DateFormat('yyyy-MM-dd').format(todayStart);
        final endStr = DateFormat('yyyy-MM-dd').format(
          DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 59, 59),
        );

        final payload = {
          "dateStart": startStr,
          "dateEnd": endStr,
          "employeeId": user!.employeeId,
          "keyWord": '',
          "pageNumber": 1,
          "pageSize": 10,
        };

        _log.logI('Payload: $payload'); // debug thêm

        final res = await _lunchRepo.getLunch(payload: payload);

        await res.fold(
          (l) async {
            _log.logE('❌ API failed: $l');
            emit(state.copyWith(status: BaseStateStatus.failed));
          },
          (r) async {
            _log.logI('✅ API success - total: $r');
            emit(state.copyWith(status: BaseStateStatus.success, lunch: r));
          },
        );
      },
    );
  }

  Future<void> _onSubmit(
    Emitter<LunchState> emit, {
    required int quantity,
    required int location,
    required String note,
    DateTime? dateOrder,
  }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(
        state.copyWith(isSubmitting: true, submitSuccess: false, message: null),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      final safeDate = DateTime(
        (dateOrder ?? DateTime.now()).year,
        (dateOrder ?? DateTime.now()).month,
        (dateOrder ?? DateTime.now()).day,
      );
      final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);
      final userName = user!.loginName;
      final employeeId = user.employeeId;
      final payload = <String, dynamic>{
        "ID": 0,
        "EmployeeID": employeeId,
        "Quantity": quantity,
        "DateOrder": dateStr,
        "Note": note,
        "IsApproved": false,
        "CreatedDate": dateStr,
        "CreatedBy": userName,
        "UpdateDate": dateStr,
        "UpdateBy": userName,
        "DecilineApprove": 0,
        "ReasonDeciline": "",
        "IsDeleted": false,
        "Location": location,
      };

      final saveRes = await _lunchRepo.saveLunch(payload: payload);
      await saveRes.fold(
        (err) async {
          _log.logE('❌ Submit Lunch API failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (_) async {
          _log.logI('✅ Submit Lunch success');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              employeeId: employeeId,
              message: 'Tạo cơm ca thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Submit Lunch exception: $e');
      emit(
        state.copyWith(
          isSubmitting: false,
          submitSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Có lỗi xảy ra khi gửi dữ liệu',
        ),
      );
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End submit Lunch');
    }
  }

  void _onClearSubmitState(Emitter<LunchState> emit) {
    emit(state.copyWith(submitSuccess: false, message: null));
  }

  Future<void> _onEditSubmit(
    Emitter<LunchState> emit, {
    required int id,
    required int quantity,
    required int location,
    required String note,
    DateTime? dateOrder,
  }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(
        state.copyWith(
          isSubmitting: true,
          submitSuccess: false,
          message: null,
          deleteSuccess: false,
          isDeleting: false,
        ),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      final item = state.lunch.where((e) => e.id == id).toList().firstOrNull;

      // Fallback để tránh chặn lưu nếu getCurrentUser lỗi.
      final effectiveEmployeeId =
          user?.employeeId ?? item?.employeeId ?? 0;
      final userName = user?.loginName ?? item?.fullName ?? '';

      final baseDate = dateOrder ?? item?.dateOrder ?? DateTime.now();
      final safeDate = DateTime(baseDate.year, baseDate.month, baseDate.day);
      final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

      final payload = <String, dynamic>{
        "ID": id,
        "EmployeeID": effectiveEmployeeId,
        "Quantity": quantity,
        "DateOrder": dateStr,
        "Note": note,
        "IsApproved": item?.isApproved ?? false,
        "CreatedDate": dateStr,
        "CreatedBy": userName,
        "UpdateDate": dateStr,
        "UpdateBy": userName,
        "DecilineApprove": 0,
        "ReasonDeciline": "",
        "IsDeleted": false,
        "Location": location,
      };

      final saveRes = await _lunchRepo.saveLunch(payload: payload);
      await saveRes.fold(
        (err) async {
          _log.logE('❌ Edit Lunch API failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (_) async {
          final updatedLunch = state.lunch.map((e) {
            if (e.id != id) return e;
            return e.copyWith(
              quantity: quantity,
              note: note,
              dateOrder: safeDate,
              location: location,
            );
          }).toList();

          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              lunch: updatedLunch,
              message: 'Cập nhật cơm ca thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Edit Lunch exception: $e');
      emit(
        state.copyWith(
          isSubmitting: false,
          submitSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Có lỗi xảy ra khi gửi dữ liệu',
        ),
      );
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End edit Lunch');
    }
  }

  Future<void> _onCancelSubmit(
    Emitter<LunchState> emit, {
    required int id,
  }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(
        state.copyWith(
          isDeleting: true,
          deleteSuccess: false,
          status: BaseStateStatus.loading,
          message: null,
        ),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      if (user == null) {
        emit(
          state.copyWith(
            isDeleting: false,
            deleteSuccess: false,
            status: BaseStateStatus.failed,
            message: 'Có lỗi xảy ra khi gửi dữ liệu',
          ),
        );
        return;
      }

      final lunchItem = state.lunch.where((e) => e.id == id).toList();
      final item = lunchItem.isNotEmpty ? lunchItem.first : null;

      final quantity = item?.quantity ?? 0;
      final location = item?.location ?? 1;
      final note = item?.note ?? '';
      final pickedDate = item?.dateOrder ?? DateTime.now();

      final safeDate =
          DateTime(pickedDate.year, pickedDate.month, pickedDate.day);
      final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

      final userName = user.loginName;
      final employeeId = user.employeeId;

      final payload = <String, dynamic>{
        "ID": id,
        "EmployeeID": employeeId,
        "Quantity": quantity,
        "DateOrder": dateStr,
        "Note": note,
        "IsApproved": false,
        "CreatedDate": dateStr,
        "CreatedBy": userName,
        "UpdateDate": dateStr,
        "UpdateBy": userName,
        "DecilineApprove": 0,
        "ReasonDeciline": "",
        "IsDeleted": true,
        "Location": location,
      };

      final saveRes = await _lunchRepo.saveLunch(payload: payload);
      await saveRes.fold(
        (err) async {
          _log.logE('❌ Cancel Lunch API failed: $err');
          emit(
            state.copyWith(
              isDeleting: false,
              deleteSuccess: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (_) async {
          final updatedLunch = state.lunch.where((e) => e.id != id).toList();
          emit(
            state.copyWith(
              isDeleting: false,
              deleteSuccess: true,
              status: BaseStateStatus.success,
              lunch: updatedLunch,
              message: null,
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Cancel Lunch exception: $e');
      emit(
        state.copyWith(
          isDeleting: false,
          deleteSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Có lỗi xảy ra khi gửi dữ liệu',
        ),
      );
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End cancel Lunch');
    }
  }
}
