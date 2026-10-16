// Date: 16/10/2026
// Nội dung/Chức năng: State cho rental vehicle bloc.

part of 'rental_vehicle_bloc.dart';

@CopyWith()
class RentalVehicleState extends BaseBlocState {
  /// Danh sách yêu cầu thuê xe tải.
  final List<RentalVehicleItem> rentalVehicles;

  /// Ngày bắt đầu lọc.
  final DateTime? dateStart;

  /// Ngày kết thúc lọc.
  final DateTime? dateEnd;

  /// Từ khoá tìm kiếm hiện tại.
  final String keyword;

  const RentalVehicleState({
    required super.status,
    super.message,
    this.rentalVehicles = const [],
    this.dateStart,
    this.dateEnd,
    this.keyword = '',
  });

  factory RentalVehicleState.init() => const RentalVehicleState(
        status: BaseStateStatus.init,
        rentalVehicles: [],
        dateStart: null,
        dateEnd: null,
        keyword: '',
      );

  @override
  List get props => [
        status,
        message,
        rentalVehicles,
        dateStart,
        dateEnd,
        keyword,
      ];
}
