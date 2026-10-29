// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_marketing_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LeadMarketingStateCWProxy {
  LeadMarketingState status(BaseStateStatus status);

  LeadMarketingState message(String? message);

  LeadMarketingState leads(List<LeadMarketingItem> leads);

  LeadMarketingState roleContext(LeadRoleContext? roleContext);

  LeadMarketingState dateStart(DateTime? dateStart);

  LeadMarketingState dateEnd(DateTime? dateEnd);

  LeadMarketingState keyword(String keyword);

  LeadMarketingState viewMode(int viewMode);

  LeadMarketingState leadType(int leadType);

  LeadMarketingState includeOpen(bool includeOpen);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeadMarketingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeadMarketingState(...).copyWith(id: 12, name: "My name")
  /// ````
  LeadMarketingState call({
    BaseStateStatus? status,
    String? message,
    List<LeadMarketingItem>? leads,
    LeadRoleContext? roleContext,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    int? viewMode,
    int? leadType,
    bool? includeOpen,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLeadMarketingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLeadMarketingState.copyWith.fieldName(...)`
class _$LeadMarketingStateCWProxyImpl implements _$LeadMarketingStateCWProxy {
  const _$LeadMarketingStateCWProxyImpl(this._value);

  final LeadMarketingState _value;

  @override
  LeadMarketingState status(BaseStateStatus status) => this(status: status);

  @override
  LeadMarketingState message(String? message) => this(message: message);

  @override
  LeadMarketingState leads(List<LeadMarketingItem> leads) => this(leads: leads);

  @override
  LeadMarketingState roleContext(LeadRoleContext? roleContext) =>
      this(roleContext: roleContext);

  @override
  LeadMarketingState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  LeadMarketingState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  LeadMarketingState keyword(String keyword) => this(keyword: keyword);

  @override
  LeadMarketingState viewMode(int viewMode) => this(viewMode: viewMode);

  @override
  LeadMarketingState leadType(int leadType) => this(leadType: leadType);

  @override
  LeadMarketingState includeOpen(bool includeOpen) =>
      this(includeOpen: includeOpen);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeadMarketingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeadMarketingState(...).copyWith(id: 12, name: "My name")
  /// ````
  LeadMarketingState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? leads = const $CopyWithPlaceholder(),
    Object? roleContext = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? viewMode = const $CopyWithPlaceholder(),
    Object? leadType = const $CopyWithPlaceholder(),
    Object? includeOpen = const $CopyWithPlaceholder(),
  }) {
    return LeadMarketingState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      leads: leads == const $CopyWithPlaceholder() || leads == null
          ? _value.leads
          // ignore: cast_nullable_to_non_nullable
          : leads as List<LeadMarketingItem>,
      roleContext: roleContext == const $CopyWithPlaceholder()
          ? _value.roleContext
          // ignore: cast_nullable_to_non_nullable
          : roleContext as LeadRoleContext?,
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
      viewMode: viewMode == const $CopyWithPlaceholder() || viewMode == null
          ? _value.viewMode
          // ignore: cast_nullable_to_non_nullable
          : viewMode as int,
      leadType: leadType == const $CopyWithPlaceholder() || leadType == null
          ? _value.leadType
          // ignore: cast_nullable_to_non_nullable
          : leadType as int,
      includeOpen:
          includeOpen == const $CopyWithPlaceholder() || includeOpen == null
              ? _value.includeOpen
              // ignore: cast_nullable_to_non_nullable
              : includeOpen as bool,
    );
  }
}

extension $LeadMarketingStateCopyWith on LeadMarketingState {
  /// Returns a callable class that can be used as follows: `instanceOfLeadMarketingState.copyWith(...)` or like so:`instanceOfLeadMarketingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LeadMarketingStateCWProxy get copyWith =>
      _$LeadMarketingStateCWProxyImpl(this);
}
