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
}
