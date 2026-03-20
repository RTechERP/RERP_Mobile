import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/datasource/models/booking_vehicle_model.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/repository/booking_vehicle_repo.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';

part 'booking_vehicle_event.dart';
part 'booking_vehicle_state.dart';
part 'booking_vehicle_bloc.g.dart';
part 'booking_vehicle_bloc.freezed.dart';

@injectable
class BookingVehicleBloc
    extends BaseBloc<BookingVehicleEvent, BookingVehicleState> {
  final LogUtils _log;
  final AuthRepo _authRepo;

  final BookingVehicleRepo _bookingVehicleRepo;

  BookingVehicleBloc(this._bookingVehicleRepo, this._authRepo, this._log)
    : super(BookingVehicleState.init()) {
    on<BookingVehicleEvent>((event, emit) async {
      await event.when(init: () => _onInit(emit));
    });
  }


  Future<void> _onInit(Emitter<BookingVehicleState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
          (err) async {
        _log.logE('❌ Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
          (user) async {
        final startStr =
        DateFormat("yyyy-MM-ddTHH:mm:ss").format(DateTime.now());
        final endStr =
        DateFormat("yyyy-MM-ddTHH:mm:ss").format(DateTime.now());

        final payload = {
          "StartDate": startStr,
          "EndDate": endStr,
          "EmployeeId": user!.employeeId,
          "DriverEmployeeId": 0,
          "Category": 0,
          "Status": 0,
          "Keyword": '',
          "IsDeleted": false,
        };

        final res =
        await _bookingVehicleRepo.getBookingVehicle(payload: payload);

        await res.fold(
              (l) async {
            _log.logE('❌ API failed: $l');
            emit(state.copyWith(status: BaseStateStatus.failed));
          },
              (r) async {
            _log.logI('✅ API success - total: $r');
            emit(state.copyWith(
              status: BaseStateStatus.success,
              bookingVehicle: r, // nếu state có field này
            ));
          },
        );
      },
    );
  }
}
