// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_vehicle_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RentalVehicleStateCWProxy {
  RentalVehicleState status(BaseStateStatus status);

  RentalVehicleState message(String? message);

  RentalVehicleState rentalVehicles(List<RentalVehicleItem> rentalVehicles);

  RentalVehicleState dateStart(DateTime? dateStart);

  RentalVehicleState dateEnd(DateTime? dateEnd);

  RentalVehicleState keyword(String keyword);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RentalVehicleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RentalVehicleState(...).copyWith(id: 12, name: "My name")
  /// ````
  RentalVehicleState call({
    BaseStateStatus? status,
    String? message,
    List<RentalVehicleItem>? rentalVehicles,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRentalVehicleState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRentalVehicleState.copyWith.fieldName(...)`
class _$RentalVehicleStateCWProxyImpl implements _$RentalVehicleStateCWProxy {
  const _$RentalVehicleStateCWProxyImpl(this._value);

  final RentalVehicleState _value;

  @override
  RentalVehicleState status(BaseStateStatus status) => this(status: status);

  @override
  RentalVehicleState message(String? message) => this(message: message);

  @override
  RentalVehicleState rentalVehicles(List<RentalVehicleItem> rentalVehicles) =>
      this(rentalVehicles: rentalVehicles);

  @override
  RentalVehicleState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  RentalVehicleState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  RentalVehicleState keyword(String keyword) => this(keyword: keyword);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RentalVehicleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RentalVehicleState(...).copyWith(id: 12, name: "My name")
  /// ````
  RentalVehicleState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? rentalVehicles = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
  }) {
    return RentalVehicleState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      rentalVehicles: rentalVehicles == const $CopyWithPlaceholder() ||
              rentalVehicles == null
          ? _value.rentalVehicles
          // ignore: cast_nullable_to_non_nullable
          : rentalVehicles as List<RentalVehicleItem>,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      keyword: keyword == const $CopyWithPlaceholder() || keyword == null
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String,
    );
  }
}

extension $RentalVehicleStateCopyWith on RentalVehicleState {
  /// Returns a callable class that can be used as follows: `instanceOfRentalVehicleState.copyWith(...)` or like so:`instanceOfRentalVehicleState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RentalVehicleStateCWProxy get copyWith =>
      _$RentalVehicleStateCWProxyImpl(this);
}
