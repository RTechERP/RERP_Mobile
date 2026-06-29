// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_timesheet_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ApproveTimesheetStateCWProxy {
  ApproveTimesheetState status(BaseStateStatus status);

  ApproveTimesheetState message(String? message);

  ApproveTimesheetState items(List<ApproveTimesheetItem>? items);

  ApproveTimesheetState seniorItems(List<UserTeamItem>? seniorItems);

  ApproveTimesheetState selectionMode(bool selectionMode);

  ApproveTimesheetState selectedIds(Set<int> selectedIds);

  ApproveTimesheetState filteredTTypes(Set<int> filteredTTypes);

  ApproveTimesheetState seniorId(int? seniorId);

  ApproveTimesheetState isSeniorApproving(bool isSeniorApproving);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApproveTimesheetState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApproveTimesheetState(...).copyWith(id: 12, name: "My name")
  /// ````
  ApproveTimesheetState call({
    BaseStateStatus? status,
    String? message,
    List<ApproveTimesheetItem>? items,
    List<UserTeamItem>? seniorItems,
    bool? selectionMode,
    Set<int>? selectedIds,
    Set<int>? filteredTTypes,
    int? seniorId,
    bool? isSeniorApproving,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfApproveTimesheetState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfApproveTimesheetState.copyWith.fieldName(...)`
class _$ApproveTimesheetStateCWProxyImpl
    implements _$ApproveTimesheetStateCWProxy {
  const _$ApproveTimesheetStateCWProxyImpl(this._value);

  final ApproveTimesheetState _value;

  @override
  ApproveTimesheetState status(BaseStateStatus status) => this(status: status);

  @override
  ApproveTimesheetState message(String? message) => this(message: message);

  @override
  ApproveTimesheetState items(List<ApproveTimesheetItem>? items) =>
      this(items: items);

  @override
  ApproveTimesheetState seniorItems(List<UserTeamItem>? seniorItems) =>
      this(seniorItems: seniorItems);

  @override
  ApproveTimesheetState selectionMode(bool selectionMode) =>
      this(selectionMode: selectionMode);

  @override
  ApproveTimesheetState selectedIds(Set<int> selectedIds) =>
      this(selectedIds: selectedIds);

  @override
  ApproveTimesheetState filteredTTypes(Set<int> filteredTTypes) =>
      this(filteredTTypes: filteredTTypes);

  @override
  ApproveTimesheetState seniorId(int? seniorId) => this(seniorId: seniorId);

  @override
  ApproveTimesheetState isSeniorApproving(bool isSeniorApproving) =>
      this(isSeniorApproving: isSeniorApproving);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApproveTimesheetState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApproveTimesheetState(...).copyWith(id: 12, name: "My name")
  /// ````
  ApproveTimesheetState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? seniorItems = const $CopyWithPlaceholder(),
    Object? selectionMode = const $CopyWithPlaceholder(),
    Object? selectedIds = const $CopyWithPlaceholder(),
    Object? filteredTTypes = const $CopyWithPlaceholder(),
    Object? seniorId = const $CopyWithPlaceholder(),
    Object? isSeniorApproving = const $CopyWithPlaceholder(),
  }) {
    return ApproveTimesheetState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<ApproveTimesheetItem>?,
      seniorItems: seniorItems == const $CopyWithPlaceholder()
          ? _value.seniorItems
          // ignore: cast_nullable_to_non_nullable
          : seniorItems as List<UserTeamItem>?,
      selectionMode:
          selectionMode == const $CopyWithPlaceholder() || selectionMode == null
              ? _value.selectionMode
              // ignore: cast_nullable_to_non_nullable
              : selectionMode as bool,
      selectedIds:
          selectedIds == const $CopyWithPlaceholder() || selectedIds == null
              ? _value.selectedIds
              // ignore: cast_nullable_to_non_nullable
              : selectedIds as Set<int>,
      filteredTTypes: filteredTTypes == const $CopyWithPlaceholder() ||
              filteredTTypes == null
          ? _value.filteredTTypes
          // ignore: cast_nullable_to_non_nullable
          : filteredTTypes as Set<int>,
      seniorId: seniorId == const $CopyWithPlaceholder()
          ? _value.seniorId
          // ignore: cast_nullable_to_non_nullable
          : seniorId as int?,
      isSeniorApproving: isSeniorApproving == const $CopyWithPlaceholder() ||
              isSeniorApproving == null
          ? _value.isSeniorApproving
          // ignore: cast_nullable_to_non_nullable
          : isSeniorApproving as bool,
    );
  }
}

extension $ApproveTimesheetStateCopyWith on ApproveTimesheetState {
  /// Returns a callable class that can be used as follows: `instanceOfApproveTimesheetState.copyWith(...)` or like so:`instanceOfApproveTimesheetState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ApproveTimesheetStateCWProxy get copyWith =>
      _$ApproveTimesheetStateCWProxyImpl(this);
}
