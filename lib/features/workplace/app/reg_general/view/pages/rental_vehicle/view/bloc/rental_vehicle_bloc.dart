// Date: 16/10/2026
// Nội dung/Chức năng: BLoC quản lý danh sách yêu cầu thuê xe tải.

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/common/logger/index.dart';
import 'package:rtc_erp/features/auth/data/repository/auth_repo.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/rental_vehicle/data/datasource/models/rental_vehicle_model.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/rental_vehicle/data/repository/rental_vehicle_repo.dart';

part 'rental_vehicle_event.dart';
part 'rental_vehicle_state.dart';
part 'rental_vehicle_bloc.g.dart';
part 'rental_vehicle_bloc.freezed.dart';

@injectable
class RentalVehicleBloc
    extends BaseBloc<RentalVehicleEvent, RentalVehicleState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final RentalVehicleRepo _rentalVehicleRepo;

  RentalVehicleBloc(this._rentalVehicleRepo, this._authRepo, this._log)
      : super(RentalVehicleState.init()) {
    on<RentalVehicleEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(dateStart, dateEnd, emit),
        search: (keyword) => _onSearch(keyword, emit),
      );
    });
  }

  /// Tính khoảng tháng hiện tại (00:00 ngày 1 → 23:59:59 ngày cuối tháng).
  (DateTime, DateTime) _monthBounds(DateTime now) {
    final start = DateTime(now.year, now.month, 1);
    final end = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
    return (start, end);
  }

  Future<void> _onInit(Emitter<RentalVehicleState> emit) async {
    final now = DateTime.now();
    final (start, end) = _monthBounds(now);

    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        dateStart: start,
        dateEnd: end,
      ),
    );

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('❌ Get current user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final payload = _buildPayload(
          keyword: state.keyword,
          dateStart: start,
          dateEnd: end,
          employeeRequestId: 0,
          employeeId: 0,
          departmentId: 0,
        );

        _log.logI('📋 rental vehicle init payload: $payload');

        final res = await _rentalVehicleRepo.searchRentalVehicle(
          payload: payload,
        );

        await res.fold(
          (l) async {
            _log.logE('❌ searchRentalVehicle failed: $l');
            emit(state.copyWith(status: BaseStateStatus.failed));
          },
          (r) async {
            _log.logI('✅ searchRentalVehicle success: ${r.length} items');
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                rentalVehicles: r,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onChangeDateRange(
    DateTime dateStart,
    DateTime dateEnd,
    Emitter<RentalVehicleState> emit,
  ) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        dateStart: dateStart,
        dateEnd: dateEnd,
      ),
    );

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('❌ Get current user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final payload = _buildPayload(
          keyword: state.keyword,
          dateStart: dateStart,
          dateEnd: dateEnd,
          employeeRequestId: 0,
          employeeId: user?.employeeId ?? 0,
          departmentId: user?.departmentId ?? 0,
        );

        _log.logI('📋 rental vehicle changeDateRange payload: $payload');

        final res = await _rentalVehicleRepo.searchRentalVehicle(
          payload: payload,
        );

        await res.fold(
          (l) async {
            _log.logE('❌ changeDateRange search failed: $l');
            emit(state.copyWith(status: BaseStateStatus.failed));
          },
          (r) async {
            _log.logI('✅ changeDateRange success: ${r.length} items');
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                rentalVehicles: r,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onSearch(
    String keyword,
    Emitter<RentalVehicleState> emit,
  ) async {
    final dateStart = state.dateStart ?? DateTime.now();
    final dateEnd = state.dateEnd ?? DateTime.now();

    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        keyword: keyword,
      ),
    );

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('❌ Get current user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final payload = _buildPayload(
          keyword: keyword,
          dateStart: dateStart,
          dateEnd: dateEnd,
          employeeRequestId: 0,
          employeeId: user?.employeeId ?? 0,
          departmentId: user?.departmentId ?? 0,
        );

        _log.logI('📋 rental vehicle search payload: $payload');

        final res = await _rentalVehicleRepo.searchRentalVehicle(
          payload: payload,
        );

        await res.fold(
          (l) async {
            _log.logE('❌ search failed: $l');
            emit(state.copyWith(status: BaseStateStatus.failed));
          },
          (r) async {
            _log.logI('✅ search success: ${r.length} items');
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                rentalVehicles: r,
              ),
            );
          },
        );
      },
    );
  }

  /// Build payload đúng schema API /VehicleRentalRequest/search.
  Map<String, dynamic> _buildPayload({
    required String keyword,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int employeeRequestId,
    required int employeeId,
    required int departmentId,
  }) {
    return {
      'Keyword': keyword,
      'StartDate': dateStart.toIso8601String(),
      'EndDate': dateEnd.toIso8601String(),
      'EmployeeRequestID': employeeRequestId,
      'EmployeeID': employeeId,
      'DepartmentID': departmentId,
    };
  }
}
