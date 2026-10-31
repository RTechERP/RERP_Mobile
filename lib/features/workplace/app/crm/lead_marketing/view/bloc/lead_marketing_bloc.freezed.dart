// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_marketing_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LeadMarketingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadMarketingEventCopyWith<$Res> {
  factory $LeadMarketingEventCopyWith(
          LeadMarketingEvent value, $Res Function(LeadMarketingEvent) then) =
      _$LeadMarketingEventCopyWithImpl<$Res, LeadMarketingEvent>;
}

/// @nodoc
class _$LeadMarketingEventCopyWithImpl<$Res, $Val extends LeadMarketingEvent>
    implements $LeadMarketingEventCopyWith<$Res> {
  _$LeadMarketingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'LeadMarketingEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements LeadMarketingEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$ChangeDateRangeImplCopyWith<$Res> {
  factory _$$ChangeDateRangeImplCopyWith(_$ChangeDateRangeImpl value,
          $Res Function(_$ChangeDateRangeImpl) then) =
      __$$ChangeDateRangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateStart, DateTime dateEnd});
}

/// @nodoc
class __$$ChangeDateRangeImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
    implements _$$ChangeDateRangeImplCopyWith<$Res> {
  __$$ChangeDateRangeImplCopyWithImpl(
      _$ChangeDateRangeImpl _value, $Res Function(_$ChangeDateRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = null,
    Object? dateEnd = null,
  }) {
    return _then(_$ChangeDateRangeImpl(
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ChangeDateRangeImpl implements _ChangeDateRange {
  const _$ChangeDateRangeImpl({required this.dateStart, required this.dateEnd});

  @override
  final DateTime dateStart;
  @override
  final DateTime dateEnd;

  @override
  String toString() {
    return 'LeadMarketingEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDateRangeImpl &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateStart, dateEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDateRangeImplCopyWith<_$ChangeDateRangeImpl> get copyWith =>
      __$$ChangeDateRangeImplCopyWithImpl<_$ChangeDateRangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(dateStart, dateEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements LeadMarketingEvent {
  const factory _ChangeDateRange(
      {required final DateTime dateStart,
      required final DateTime dateEnd}) = _$ChangeDateRangeImpl;

  DateTime get dateStart;
  DateTime get dateEnd;
  @JsonKey(ignore: true)
  _$$ChangeDateRangeImplCopyWith<_$ChangeDateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeKeywordImplCopyWith<$Res> {
  factory _$$ChangeKeywordImplCopyWith(
          _$ChangeKeywordImpl value, $Res Function(_$ChangeKeywordImpl) then) =
      __$$ChangeKeywordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$ChangeKeywordImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$ChangeKeywordImpl>
    implements _$$ChangeKeywordImplCopyWith<$Res> {
  __$$ChangeKeywordImplCopyWithImpl(
      _$ChangeKeywordImpl _value, $Res Function(_$ChangeKeywordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$ChangeKeywordImpl(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeKeywordImpl implements _ChangeKeyword {
  const _$ChangeKeywordImpl({required this.keyword});

  @override
  final String keyword;

  @override
  String toString() {
    return 'LeadMarketingEvent.changeKeyword(keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeKeywordImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeKeywordImplCopyWith<_$ChangeKeywordImpl> get copyWith =>
      __$$ChangeKeywordImplCopyWithImpl<_$ChangeKeywordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return changeKeyword(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return changeKeyword?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (changeKeyword != null) {
      return changeKeyword(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return changeKeyword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return changeKeyword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (changeKeyword != null) {
      return changeKeyword(this);
    }
    return orElse();
  }
}

abstract class _ChangeKeyword implements LeadMarketingEvent {
  const factory _ChangeKeyword({required final String keyword}) =
      _$ChangeKeywordImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$ChangeKeywordImplCopyWith<_$ChangeKeywordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'LeadMarketingEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements LeadMarketingEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$ApplyFilterImplCopyWith<$Res> {
  factory _$$ApplyFilterImplCopyWith(
          _$ApplyFilterImpl value, $Res Function(_$ApplyFilterImpl) then) =
      __$$ApplyFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int leadSourceId,
      int marketingEmployeeId,
      int saleEmployeeId,
      bool includeOpen,
      LeadStage? stage});
}

/// @nodoc
class __$$ApplyFilterImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$ApplyFilterImpl>
    implements _$$ApplyFilterImplCopyWith<$Res> {
  __$$ApplyFilterImplCopyWithImpl(
      _$ApplyFilterImpl _value, $Res Function(_$ApplyFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leadSourceId = null,
    Object? marketingEmployeeId = null,
    Object? saleEmployeeId = null,
    Object? includeOpen = null,
    Object? stage = freezed,
  }) {
    return _then(_$ApplyFilterImpl(
      leadSourceId: null == leadSourceId
          ? _value.leadSourceId
          : leadSourceId // ignore: cast_nullable_to_non_nullable
              as int,
      marketingEmployeeId: null == marketingEmployeeId
          ? _value.marketingEmployeeId
          : marketingEmployeeId // ignore: cast_nullable_to_non_nullable
              as int,
      saleEmployeeId: null == saleEmployeeId
          ? _value.saleEmployeeId
          : saleEmployeeId // ignore: cast_nullable_to_non_nullable
              as int,
      includeOpen: null == includeOpen
          ? _value.includeOpen
          : includeOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      stage: freezed == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as LeadStage?,
    ));
  }
}

/// @nodoc

class _$ApplyFilterImpl implements _ApplyFilter {
  const _$ApplyFilterImpl(
      {required this.leadSourceId,
      required this.marketingEmployeeId,
      required this.saleEmployeeId,
      required this.includeOpen,
      required this.stage});

  @override
  final int leadSourceId;
  @override
  final int marketingEmployeeId;
  @override
  final int saleEmployeeId;
  @override
  final bool includeOpen;
  @override
  final LeadStage? stage;

  @override
  String toString() {
    return 'LeadMarketingEvent.applyFilter(leadSourceId: $leadSourceId, marketingEmployeeId: $marketingEmployeeId, saleEmployeeId: $saleEmployeeId, includeOpen: $includeOpen, stage: $stage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyFilterImpl &&
            (identical(other.leadSourceId, leadSourceId) ||
                other.leadSourceId == leadSourceId) &&
            (identical(other.marketingEmployeeId, marketingEmployeeId) ||
                other.marketingEmployeeId == marketingEmployeeId) &&
            (identical(other.saleEmployeeId, saleEmployeeId) ||
                other.saleEmployeeId == saleEmployeeId) &&
            (identical(other.includeOpen, includeOpen) ||
                other.includeOpen == includeOpen) &&
            (identical(other.stage, stage) || other.stage == stage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, leadSourceId,
      marketingEmployeeId, saleEmployeeId, includeOpen, stage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyFilterImplCopyWith<_$ApplyFilterImpl> get copyWith =>
      __$$ApplyFilterImplCopyWithImpl<_$ApplyFilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return applyFilter(
        leadSourceId, marketingEmployeeId, saleEmployeeId, includeOpen, stage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return applyFilter?.call(
        leadSourceId, marketingEmployeeId, saleEmployeeId, includeOpen, stage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (applyFilter != null) {
      return applyFilter(leadSourceId, marketingEmployeeId, saleEmployeeId,
          includeOpen, stage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return applyFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return applyFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (applyFilter != null) {
      return applyFilter(this);
    }
    return orElse();
  }
}

abstract class _ApplyFilter implements LeadMarketingEvent {
  const factory _ApplyFilter(
      {required final int leadSourceId,
      required final int marketingEmployeeId,
      required final int saleEmployeeId,
      required final bool includeOpen,
      required final LeadStage? stage}) = _$ApplyFilterImpl;

  int get leadSourceId;
  int get marketingEmployeeId;
  int get saleEmployeeId;
  bool get includeOpen;
  LeadStage? get stage;
  @JsonKey(ignore: true)
  _$$ApplyFilterImplCopyWith<_$ApplyFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearFilterImplCopyWith<$Res> {
  factory _$$ClearFilterImplCopyWith(
          _$ClearFilterImpl value, $Res Function(_$ClearFilterImpl) then) =
      __$$ClearFilterImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearFilterImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$ClearFilterImpl>
    implements _$$ClearFilterImplCopyWith<$Res> {
  __$$ClearFilterImplCopyWithImpl(
      _$ClearFilterImpl _value, $Res Function(_$ClearFilterImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearFilterImpl implements _ClearFilter {
  const _$ClearFilterImpl();

  @override
  String toString() {
    return 'LeadMarketingEvent.clearFilter()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearFilterImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return clearFilter();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return clearFilter?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearFilter != null) {
      return clearFilter();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return clearFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return clearFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearFilter != null) {
      return clearFilter(this);
    }
    return orElse();
  }
}

abstract class _ClearFilter implements LeadMarketingEvent {
  const factory _ClearFilter() = _$ClearFilterImpl;
}

/// @nodoc
abstract class _$$LoadDetailImplCopyWith<$Res> {
  factory _$$LoadDetailImplCopyWith(
          _$LoadDetailImpl value, $Res Function(_$LoadDetailImpl) then) =
      __$$LoadDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$LoadDetailImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$LoadDetailImpl>
    implements _$$LoadDetailImplCopyWith<$Res> {
  __$$LoadDetailImplCopyWithImpl(
      _$LoadDetailImpl _value, $Res Function(_$LoadDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LoadDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadDetailImpl implements _LoadDetail {
  const _$LoadDetailImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'LeadMarketingEvent.loadDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadDetailImplCopyWith<_$LoadDetailImpl> get copyWith =>
      __$$LoadDetailImplCopyWithImpl<_$LoadDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return loadDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return loadDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadDetail != null) {
      return loadDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return loadDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return loadDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadDetail != null) {
      return loadDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadDetail implements LeadMarketingEvent {
  const factory _LoadDetail({required final int id}) = _$LoadDetailImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$LoadDetailImplCopyWith<_$LoadDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFilesImplCopyWith<$Res> {
  factory _$$LoadFilesImplCopyWith(
          _$LoadFilesImpl value, $Res Function(_$LoadFilesImpl) then) =
      __$$LoadFilesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int customerContactId});
}

/// @nodoc
class __$$LoadFilesImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$LoadFilesImpl>
    implements _$$LoadFilesImplCopyWith<$Res> {
  __$$LoadFilesImplCopyWithImpl(
      _$LoadFilesImpl _value, $Res Function(_$LoadFilesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerContactId = null,
  }) {
    return _then(_$LoadFilesImpl(
      customerContactId: null == customerContactId
          ? _value.customerContactId
          : customerContactId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadFilesImpl implements _LoadFiles {
  const _$LoadFilesImpl({required this.customerContactId});

  @override
  final int customerContactId;

  @override
  String toString() {
    return 'LeadMarketingEvent.loadFiles(customerContactId: $customerContactId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFilesImpl &&
            (identical(other.customerContactId, customerContactId) ||
                other.customerContactId == customerContactId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerContactId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFilesImplCopyWith<_$LoadFilesImpl> get copyWith =>
      __$$LoadFilesImplCopyWithImpl<_$LoadFilesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return loadFiles(customerContactId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return loadFiles?.call(customerContactId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadFiles != null) {
      return loadFiles(customerContactId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return loadFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return loadFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadFiles != null) {
      return loadFiles(this);
    }
    return orElse();
  }
}

abstract class _LoadFiles implements LeadMarketingEvent {
  const factory _LoadFiles({required final int customerContactId}) =
      _$LoadFilesImpl;

  int get customerContactId;
  @JsonKey(ignore: true)
  _$$LoadFilesImplCopyWith<_$LoadFilesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFilesPoImplCopyWith<$Res> {
  factory _$$LoadFilesPoImplCopyWith(
          _$LoadFilesPoImpl value, $Res Function(_$LoadFilesPoImpl) then) =
      __$$LoadFilesPoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int customerContactId});
}

/// @nodoc
class __$$LoadFilesPoImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$LoadFilesPoImpl>
    implements _$$LoadFilesPoImplCopyWith<$Res> {
  __$$LoadFilesPoImplCopyWithImpl(
      _$LoadFilesPoImpl _value, $Res Function(_$LoadFilesPoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerContactId = null,
  }) {
    return _then(_$LoadFilesPoImpl(
      customerContactId: null == customerContactId
          ? _value.customerContactId
          : customerContactId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadFilesPoImpl implements _LoadFilesPo {
  const _$LoadFilesPoImpl({required this.customerContactId});

  @override
  final int customerContactId;

  @override
  String toString() {
    return 'LeadMarketingEvent.loadFilesPo(customerContactId: $customerContactId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFilesPoImpl &&
            (identical(other.customerContactId, customerContactId) ||
                other.customerContactId == customerContactId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerContactId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFilesPoImplCopyWith<_$LoadFilesPoImpl> get copyWith =>
      __$$LoadFilesPoImplCopyWithImpl<_$LoadFilesPoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return loadFilesPo(customerContactId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return loadFilesPo?.call(customerContactId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadFilesPo != null) {
      return loadFilesPo(customerContactId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return loadFilesPo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return loadFilesPo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadFilesPo != null) {
      return loadFilesPo(this);
    }
    return orElse();
  }
}

abstract class _LoadFilesPo implements LeadMarketingEvent {
  const factory _LoadFilesPo({required final int customerContactId}) =
      _$LoadFilesPoImpl;

  int get customerContactId;
  @JsonKey(ignore: true)
  _$$LoadFilesPoImplCopyWith<_$LoadFilesPoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveFilesImplCopyWith<$Res> {
  factory _$$SaveFilesImplCopyWith(
          _$SaveFilesImpl value, $Res Function(_$SaveFilesImpl) then) =
      __$$SaveFilesImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int customerContactId,
      int fileType,
      List<PlatformFile> files,
      String note});
}

/// @nodoc
class __$$SaveFilesImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$SaveFilesImpl>
    implements _$$SaveFilesImplCopyWith<$Res> {
  __$$SaveFilesImplCopyWithImpl(
      _$SaveFilesImpl _value, $Res Function(_$SaveFilesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerContactId = null,
    Object? fileType = null,
    Object? files = null,
    Object? note = null,
  }) {
    return _then(_$SaveFilesImpl(
      customerContactId: null == customerContactId
          ? _value.customerContactId
          : customerContactId // ignore: cast_nullable_to_non_nullable
              as int,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as int,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveFilesImpl implements _SaveFiles {
  const _$SaveFilesImpl(
      {required this.customerContactId,
      required this.fileType,
      required final List<PlatformFile> files,
      this.note = ''})
      : _files = files;

  @override
  final int customerContactId;
  @override
  final int fileType;
  final List<PlatformFile> _files;
  @override
  List<PlatformFile> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  @JsonKey()
  final String note;

  @override
  String toString() {
    return 'LeadMarketingEvent.saveFiles(customerContactId: $customerContactId, fileType: $fileType, files: $files, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveFilesImpl &&
            (identical(other.customerContactId, customerContactId) ||
                other.customerContactId == customerContactId) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerContactId, fileType,
      const DeepCollectionEquality().hash(_files), note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveFilesImplCopyWith<_$SaveFilesImpl> get copyWith =>
      __$$SaveFilesImplCopyWithImpl<_$SaveFilesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return saveFiles(customerContactId, fileType, files, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return saveFiles?.call(customerContactId, fileType, files, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (saveFiles != null) {
      return saveFiles(customerContactId, fileType, files, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return saveFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return saveFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (saveFiles != null) {
      return saveFiles(this);
    }
    return orElse();
  }
}

abstract class _SaveFiles implements LeadMarketingEvent {
  const factory _SaveFiles(
      {required final int customerContactId,
      required final int fileType,
      required final List<PlatformFile> files,
      final String note}) = _$SaveFilesImpl;

  int get customerContactId;
  int get fileType;
  List<PlatformFile> get files;
  String get note;
  @JsonKey(ignore: true)
  _$$SaveFilesImplCopyWith<_$SaveFilesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteFileImplCopyWith<$Res> {
  factory _$$DeleteFileImplCopyWith(
          _$DeleteFileImpl value, $Res Function(_$DeleteFileImpl) then) =
      __$$DeleteFileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int fileId, int fileType});
}

/// @nodoc
class __$$DeleteFileImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$DeleteFileImpl>
    implements _$$DeleteFileImplCopyWith<$Res> {
  __$$DeleteFileImplCopyWithImpl(
      _$DeleteFileImpl _value, $Res Function(_$DeleteFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = null,
    Object? fileType = null,
  }) {
    return _then(_$DeleteFileImpl(
      fileId: null == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as int,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteFileImpl implements _DeleteFile {
  const _$DeleteFileImpl({required this.fileId, this.fileType = 1});

  @override
  final int fileId;
  @override
  @JsonKey()
  final int fileType;

  @override
  String toString() {
    return 'LeadMarketingEvent.deleteFile(fileId: $fileId, fileType: $fileType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteFileImpl &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileId, fileType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteFileImplCopyWith<_$DeleteFileImpl> get copyWith =>
      __$$DeleteFileImplCopyWithImpl<_$DeleteFileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return deleteFile(fileId, fileType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return deleteFile?.call(fileId, fileType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (deleteFile != null) {
      return deleteFile(fileId, fileType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return deleteFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return deleteFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (deleteFile != null) {
      return deleteFile(this);
    }
    return orElse();
  }
}

abstract class _DeleteFile implements LeadMarketingEvent {
  const factory _DeleteFile({required final int fileId, final int fileType}) =
      _$DeleteFileImpl;

  int get fileId;
  int get fileType;
  @JsonKey(ignore: true)
  _$$DeleteFileImplCopyWith<_$DeleteFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearFileActionStateImplCopyWith<$Res> {
  factory _$$ClearFileActionStateImplCopyWith(_$ClearFileActionStateImpl value,
          $Res Function(_$ClearFileActionStateImpl) then) =
      __$$ClearFileActionStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearFileActionStateImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$ClearFileActionStateImpl>
    implements _$$ClearFileActionStateImplCopyWith<$Res> {
  __$$ClearFileActionStateImplCopyWithImpl(_$ClearFileActionStateImpl _value,
      $Res Function(_$ClearFileActionStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearFileActionStateImpl implements _ClearFileActionState {
  const _$ClearFileActionStateImpl();

  @override
  String toString() {
    return 'LeadMarketingEvent.clearFileActionState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearFileActionStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return clearFileActionState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return clearFileActionState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearFileActionState != null) {
      return clearFileActionState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return clearFileActionState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return clearFileActionState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearFileActionState != null) {
      return clearFileActionState(this);
    }
    return orElse();
  }
}

abstract class _ClearFileActionState implements LeadMarketingEvent {
  const factory _ClearFileActionState() = _$ClearFileActionStateImpl;
}

/// @nodoc
abstract class _$$LoadFormOptionsImplCopyWith<$Res> {
  factory _$$LoadFormOptionsImplCopyWith(_$LoadFormOptionsImpl value,
          $Res Function(_$LoadFormOptionsImpl) then) =
      __$$LoadFormOptionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFormOptionsImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$LoadFormOptionsImpl>
    implements _$$LoadFormOptionsImplCopyWith<$Res> {
  __$$LoadFormOptionsImplCopyWithImpl(
      _$LoadFormOptionsImpl _value, $Res Function(_$LoadFormOptionsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadFormOptionsImpl implements _LoadFormOptions {
  const _$LoadFormOptionsImpl();

  @override
  String toString() {
    return 'LeadMarketingEvent.loadFormOptions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFormOptionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return loadFormOptions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return loadFormOptions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadFormOptions != null) {
      return loadFormOptions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return loadFormOptions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return loadFormOptions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadFormOptions != null) {
      return loadFormOptions(this);
    }
    return orElse();
  }
}

abstract class _LoadFormOptions implements LeadMarketingEvent {
  const factory _LoadFormOptions() = _$LoadFormOptionsImpl;
}

/// @nodoc
abstract class _$$LoadCustomerDetailImplCopyWith<$Res> {
  factory _$$LoadCustomerDetailImplCopyWith(_$LoadCustomerDetailImpl value,
          $Res Function(_$LoadCustomerDetailImpl) then) =
      __$$LoadCustomerDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$LoadCustomerDetailImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$LoadCustomerDetailImpl>
    implements _$$LoadCustomerDetailImplCopyWith<$Res> {
  __$$LoadCustomerDetailImplCopyWithImpl(_$LoadCustomerDetailImpl _value,
      $Res Function(_$LoadCustomerDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LoadCustomerDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadCustomerDetailImpl implements _LoadCustomerDetail {
  const _$LoadCustomerDetailImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'LeadMarketingEvent.loadCustomerDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadCustomerDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadCustomerDetailImplCopyWith<_$LoadCustomerDetailImpl> get copyWith =>
      __$$LoadCustomerDetailImplCopyWithImpl<_$LoadCustomerDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return loadCustomerDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return loadCustomerDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadCustomerDetail != null) {
      return loadCustomerDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return loadCustomerDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return loadCustomerDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadCustomerDetail != null) {
      return loadCustomerDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadCustomerDetail implements LeadMarketingEvent {
  const factory _LoadCustomerDetail({required final int id}) =
      _$LoadCustomerDetailImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$LoadCustomerDetailImplCopyWith<_$LoadCustomerDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitLeadImplCopyWith<$Res> {
  factory _$$SubmitLeadImplCopyWith(
          _$SubmitLeadImpl value, $Res Function(_$SubmitLeadImpl) then) =
      __$$SubmitLeadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> payload});
}

/// @nodoc
class __$$SubmitLeadImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$SubmitLeadImpl>
    implements _$$SubmitLeadImplCopyWith<$Res> {
  __$$SubmitLeadImplCopyWithImpl(
      _$SubmitLeadImpl _value, $Res Function(_$SubmitLeadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payload = null,
  }) {
    return _then(_$SubmitLeadImpl(
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$SubmitLeadImpl implements _SubmitLead {
  const _$SubmitLeadImpl({required final Map<String, dynamic> payload})
      : _payload = payload;

  final Map<String, dynamic> _payload;
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  String toString() {
    return 'LeadMarketingEvent.submitLead(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitLeadImpl &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_payload));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitLeadImplCopyWith<_$SubmitLeadImpl> get copyWith =>
      __$$SubmitLeadImplCopyWithImpl<_$SubmitLeadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return submitLead(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return submitLead?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (submitLead != null) {
      return submitLead(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return submitLead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return submitLead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (submitLead != null) {
      return submitLead(this);
    }
    return orElse();
  }
}

abstract class _SubmitLead implements LeadMarketingEvent {
  const factory _SubmitLead({required final Map<String, dynamic> payload}) =
      _$SubmitLeadImpl;

  Map<String, dynamic> get payload;
  @JsonKey(ignore: true)
  _$$SubmitLeadImplCopyWith<_$SubmitLeadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmDuplicateSaveImplCopyWith<$Res> {
  factory _$$ConfirmDuplicateSaveImplCopyWith(_$ConfirmDuplicateSaveImpl value,
          $Res Function(_$ConfirmDuplicateSaveImpl) then) =
      __$$ConfirmDuplicateSaveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> payload});
}

/// @nodoc
class __$$ConfirmDuplicateSaveImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$ConfirmDuplicateSaveImpl>
    implements _$$ConfirmDuplicateSaveImplCopyWith<$Res> {
  __$$ConfirmDuplicateSaveImplCopyWithImpl(_$ConfirmDuplicateSaveImpl _value,
      $Res Function(_$ConfirmDuplicateSaveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payload = null,
  }) {
    return _then(_$ConfirmDuplicateSaveImpl(
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$ConfirmDuplicateSaveImpl implements _ConfirmDuplicateSave {
  const _$ConfirmDuplicateSaveImpl(
      {required final Map<String, dynamic> payload})
      : _payload = payload;

  final Map<String, dynamic> _payload;
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  String toString() {
    return 'LeadMarketingEvent.confirmDuplicateSave(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmDuplicateSaveImpl &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_payload));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmDuplicateSaveImplCopyWith<_$ConfirmDuplicateSaveImpl>
      get copyWith =>
          __$$ConfirmDuplicateSaveImplCopyWithImpl<_$ConfirmDuplicateSaveImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return confirmDuplicateSave(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return confirmDuplicateSave?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (confirmDuplicateSave != null) {
      return confirmDuplicateSave(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return confirmDuplicateSave(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return confirmDuplicateSave?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (confirmDuplicateSave != null) {
      return confirmDuplicateSave(this);
    }
    return orElse();
  }
}

abstract class _ConfirmDuplicateSave implements LeadMarketingEvent {
  const factory _ConfirmDuplicateSave(
          {required final Map<String, dynamic> payload}) =
      _$ConfirmDuplicateSaveImpl;

  Map<String, dynamic> get payload;
  @JsonKey(ignore: true)
  _$$ConfirmDuplicateSaveImplCopyWith<_$ConfirmDuplicateSaveImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelDuplicateSaveImplCopyWith<$Res> {
  factory _$$CancelDuplicateSaveImplCopyWith(_$CancelDuplicateSaveImpl value,
          $Res Function(_$CancelDuplicateSaveImpl) then) =
      __$$CancelDuplicateSaveImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelDuplicateSaveImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$CancelDuplicateSaveImpl>
    implements _$$CancelDuplicateSaveImplCopyWith<$Res> {
  __$$CancelDuplicateSaveImplCopyWithImpl(_$CancelDuplicateSaveImpl _value,
      $Res Function(_$CancelDuplicateSaveImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CancelDuplicateSaveImpl implements _CancelDuplicateSave {
  const _$CancelDuplicateSaveImpl();

  @override
  String toString() {
    return 'LeadMarketingEvent.cancelDuplicateSave()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelDuplicateSaveImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return cancelDuplicateSave();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return cancelDuplicateSave?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (cancelDuplicateSave != null) {
      return cancelDuplicateSave();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return cancelDuplicateSave(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return cancelDuplicateSave?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (cancelDuplicateSave != null) {
      return cancelDuplicateSave(this);
    }
    return orElse();
  }
}

abstract class _CancelDuplicateSave implements LeadMarketingEvent {
  const factory _CancelDuplicateSave() = _$CancelDuplicateSaveImpl;
}

/// @nodoc
abstract class _$$ClearSubmitStateImplCopyWith<$Res> {
  factory _$$ClearSubmitStateImplCopyWith(_$ClearSubmitStateImpl value,
          $Res Function(_$ClearSubmitStateImpl) then) =
      __$$ClearSubmitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSubmitStateImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$ClearSubmitStateImpl>
    implements _$$ClearSubmitStateImplCopyWith<$Res> {
  __$$ClearSubmitStateImplCopyWithImpl(_$ClearSubmitStateImpl _value,
      $Res Function(_$ClearSubmitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSubmitStateImpl implements _ClearSubmitState {
  const _$ClearSubmitStateImpl();

  @override
  String toString() {
    return 'LeadMarketingEvent.clearSubmitState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSubmitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return clearSubmitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return clearSubmitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearSubmitState != null) {
      return clearSubmitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return clearSubmitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return clearSubmitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearSubmitState != null) {
      return clearSubmitState(this);
    }
    return orElse();
  }
}

abstract class _ClearSubmitState implements LeadMarketingEvent {
  const factory _ClearSubmitState() = _$ClearSubmitStateImpl;
}

/// @nodoc
abstract class _$$DeleteLeadImplCopyWith<$Res> {
  factory _$$DeleteLeadImplCopyWith(
          _$DeleteLeadImpl value, $Res Function(_$DeleteLeadImpl) then) =
      __$$DeleteLeadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteLeadImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$DeleteLeadImpl>
    implements _$$DeleteLeadImplCopyWith<$Res> {
  __$$DeleteLeadImplCopyWithImpl(
      _$DeleteLeadImpl _value, $Res Function(_$DeleteLeadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteLeadImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteLeadImpl implements _DeleteLead {
  const _$DeleteLeadImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'LeadMarketingEvent.deleteLead(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteLeadImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteLeadImplCopyWith<_$DeleteLeadImpl> get copyWith =>
      __$$DeleteLeadImplCopyWithImpl<_$DeleteLeadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return deleteLead(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return deleteLead?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (deleteLead != null) {
      return deleteLead(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return deleteLead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return deleteLead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (deleteLead != null) {
      return deleteLead(this);
    }
    return orElse();
  }
}

abstract class _DeleteLead implements LeadMarketingEvent {
  const factory _DeleteLead({required final int id}) = _$DeleteLeadImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteLeadImplCopyWith<_$DeleteLeadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearDeleteStateImplCopyWith<$Res> {
  factory _$$ClearDeleteStateImplCopyWith(_$ClearDeleteStateImpl value,
          $Res Function(_$ClearDeleteStateImpl) then) =
      __$$ClearDeleteStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearDeleteStateImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$ClearDeleteStateImpl>
    implements _$$ClearDeleteStateImplCopyWith<$Res> {
  __$$ClearDeleteStateImplCopyWithImpl(_$ClearDeleteStateImpl _value,
      $Res Function(_$ClearDeleteStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearDeleteStateImpl implements _ClearDeleteState {
  const _$ClearDeleteStateImpl();

  @override
  String toString() {
    return 'LeadMarketingEvent.clearDeleteState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearDeleteStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return clearDeleteState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return clearDeleteState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearDeleteState != null) {
      return clearDeleteState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return clearDeleteState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return clearDeleteState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearDeleteState != null) {
      return clearDeleteState(this);
    }
    return orElse();
  }
}

abstract class _ClearDeleteState implements LeadMarketingEvent {
  const factory _ClearDeleteState() = _$ClearDeleteStateImpl;
}

/// @nodoc
abstract class _$$LoadActivityTypesImplCopyWith<$Res> {
  factory _$$LoadActivityTypesImplCopyWith(_$LoadActivityTypesImpl value,
          $Res Function(_$LoadActivityTypesImpl) then) =
      __$$LoadActivityTypesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadActivityTypesImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$LoadActivityTypesImpl>
    implements _$$LoadActivityTypesImplCopyWith<$Res> {
  __$$LoadActivityTypesImplCopyWithImpl(_$LoadActivityTypesImpl _value,
      $Res Function(_$LoadActivityTypesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadActivityTypesImpl implements _LoadActivityTypes {
  const _$LoadActivityTypesImpl();

  @override
  String toString() {
    return 'LeadMarketingEvent.loadActivityTypes()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadActivityTypesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return loadActivityTypes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return loadActivityTypes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadActivityTypes != null) {
      return loadActivityTypes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return loadActivityTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return loadActivityTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadActivityTypes != null) {
      return loadActivityTypes(this);
    }
    return orElse();
  }
}

abstract class _LoadActivityTypes implements LeadMarketingEvent {
  const factory _LoadActivityTypes() = _$LoadActivityTypesImpl;
}

/// @nodoc
abstract class _$$SaveActivityImplCopyWith<$Res> {
  factory _$$SaveActivityImplCopyWith(
          _$SaveActivityImpl value, $Res Function(_$SaveActivityImpl) then) =
      __$$SaveActivityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> payload});
}

/// @nodoc
class __$$SaveActivityImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$SaveActivityImpl>
    implements _$$SaveActivityImplCopyWith<$Res> {
  __$$SaveActivityImplCopyWithImpl(
      _$SaveActivityImpl _value, $Res Function(_$SaveActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payload = null,
  }) {
    return _then(_$SaveActivityImpl(
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$SaveActivityImpl implements _SaveActivity {
  const _$SaveActivityImpl({required final Map<String, dynamic> payload})
      : _payload = payload;

  final Map<String, dynamic> _payload;
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  String toString() {
    return 'LeadMarketingEvent.saveActivity(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveActivityImpl &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_payload));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveActivityImplCopyWith<_$SaveActivityImpl> get copyWith =>
      __$$SaveActivityImplCopyWithImpl<_$SaveActivityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return saveActivity(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return saveActivity?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (saveActivity != null) {
      return saveActivity(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return saveActivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return saveActivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (saveActivity != null) {
      return saveActivity(this);
    }
    return orElse();
  }
}

abstract class _SaveActivity implements LeadMarketingEvent {
  const factory _SaveActivity({required final Map<String, dynamic> payload}) =
      _$SaveActivityImpl;

  Map<String, dynamic> get payload;
  @JsonKey(ignore: true)
  _$$SaveActivityImplCopyWith<_$SaveActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearActivityStateImplCopyWith<$Res> {
  factory _$$ClearActivityStateImplCopyWith(_$ClearActivityStateImpl value,
          $Res Function(_$ClearActivityStateImpl) then) =
      __$$ClearActivityStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearActivityStateImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$ClearActivityStateImpl>
    implements _$$ClearActivityStateImplCopyWith<$Res> {
  __$$ClearActivityStateImplCopyWithImpl(_$ClearActivityStateImpl _value,
      $Res Function(_$ClearActivityStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearActivityStateImpl implements _ClearActivityState {
  const _$ClearActivityStateImpl();

  @override
  String toString() {
    return 'LeadMarketingEvent.clearActivityState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearActivityStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return clearActivityState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return clearActivityState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearActivityState != null) {
      return clearActivityState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return clearActivityState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return clearActivityState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearActivityState != null) {
      return clearActivityState(this);
    }
    return orElse();
  }
}

abstract class _ClearActivityState implements LeadMarketingEvent {
  const factory _ClearActivityState() = _$ClearActivityStateImpl;
}

/// @nodoc
abstract class _$$DisqualifyLeadImplCopyWith<$Res> {
  factory _$$DisqualifyLeadImplCopyWith(_$DisqualifyLeadImpl value,
          $Res Function(_$DisqualifyLeadImpl) then) =
      __$$DisqualifyLeadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, String note});
}

/// @nodoc
class __$$DisqualifyLeadImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$DisqualifyLeadImpl>
    implements _$$DisqualifyLeadImplCopyWith<$Res> {
  __$$DisqualifyLeadImplCopyWithImpl(
      _$DisqualifyLeadImpl _value, $Res Function(_$DisqualifyLeadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? note = null,
  }) {
    return _then(_$DisqualifyLeadImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DisqualifyLeadImpl implements _DisqualifyLead {
  const _$DisqualifyLeadImpl({required this.id, required this.note});

  @override
  final int id;
  @override
  final String note;

  @override
  String toString() {
    return 'LeadMarketingEvent.disqualifyLead(id: $id, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisqualifyLeadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisqualifyLeadImplCopyWith<_$DisqualifyLeadImpl> get copyWith =>
      __$$DisqualifyLeadImplCopyWithImpl<_$DisqualifyLeadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return disqualifyLead(id, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return disqualifyLead?.call(id, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (disqualifyLead != null) {
      return disqualifyLead(id, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return disqualifyLead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return disqualifyLead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (disqualifyLead != null) {
      return disqualifyLead(this);
    }
    return orElse();
  }
}

abstract class _DisqualifyLead implements LeadMarketingEvent {
  const factory _DisqualifyLead(
      {required final int id,
      required final String note}) = _$DisqualifyLeadImpl;

  int get id;
  String get note;
  @JsonKey(ignore: true)
  _$$DisqualifyLeadImplCopyWith<_$DisqualifyLeadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReopenLeadImplCopyWith<$Res> {
  factory _$$ReopenLeadImplCopyWith(
          _$ReopenLeadImpl value, $Res Function(_$ReopenLeadImpl) then) =
      __$$ReopenLeadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, String note});
}

/// @nodoc
class __$$ReopenLeadImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$ReopenLeadImpl>
    implements _$$ReopenLeadImplCopyWith<$Res> {
  __$$ReopenLeadImplCopyWithImpl(
      _$ReopenLeadImpl _value, $Res Function(_$ReopenLeadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? note = null,
  }) {
    return _then(_$ReopenLeadImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReopenLeadImpl implements _ReopenLead {
  const _$ReopenLeadImpl({required this.id, required this.note});

  @override
  final int id;
  @override
  final String note;

  @override
  String toString() {
    return 'LeadMarketingEvent.reopenLead(id: $id, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReopenLeadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReopenLeadImplCopyWith<_$ReopenLeadImpl> get copyWith =>
      __$$ReopenLeadImplCopyWithImpl<_$ReopenLeadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return reopenLead(id, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return reopenLead?.call(id, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (reopenLead != null) {
      return reopenLead(id, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return reopenLead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return reopenLead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (reopenLead != null) {
      return reopenLead(this);
    }
    return orElse();
  }
}

abstract class _ReopenLead implements LeadMarketingEvent {
  const factory _ReopenLead(
      {required final int id, required final String note}) = _$ReopenLeadImpl;

  int get id;
  String get note;
  @JsonKey(ignore: true)
  _$$ReopenLeadImplCopyWith<_$ReopenLeadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearStageActionStateImplCopyWith<$Res> {
  factory _$$ClearStageActionStateImplCopyWith(
          _$ClearStageActionStateImpl value,
          $Res Function(_$ClearStageActionStateImpl) then) =
      __$$ClearStageActionStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearStageActionStateImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$ClearStageActionStateImpl>
    implements _$$ClearStageActionStateImplCopyWith<$Res> {
  __$$ClearStageActionStateImplCopyWithImpl(_$ClearStageActionStateImpl _value,
      $Res Function(_$ClearStageActionStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearStageActionStateImpl implements _ClearStageActionState {
  const _$ClearStageActionStateImpl();

  @override
  String toString() {
    return 'LeadMarketingEvent.clearStageActionState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearStageActionStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return clearStageActionState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return clearStageActionState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearStageActionState != null) {
      return clearStageActionState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return clearStageActionState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return clearStageActionState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearStageActionState != null) {
      return clearStageActionState(this);
    }
    return orElse();
  }
}

abstract class _ClearStageActionState implements LeadMarketingEvent {
  const factory _ClearStageActionState() = _$ClearStageActionStateImpl;
}

/// @nodoc
abstract class _$$LoadHandoverOptionsImplCopyWith<$Res> {
  factory _$$LoadHandoverOptionsImplCopyWith(_$LoadHandoverOptionsImpl value,
          $Res Function(_$LoadHandoverOptionsImpl) then) =
      __$$LoadHandoverOptionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadHandoverOptionsImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$LoadHandoverOptionsImpl>
    implements _$$LoadHandoverOptionsImplCopyWith<$Res> {
  __$$LoadHandoverOptionsImplCopyWithImpl(_$LoadHandoverOptionsImpl _value,
      $Res Function(_$LoadHandoverOptionsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadHandoverOptionsImpl implements _LoadHandoverOptions {
  const _$LoadHandoverOptionsImpl();

  @override
  String toString() {
    return 'LeadMarketingEvent.loadHandoverOptions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadHandoverOptionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return loadHandoverOptions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return loadHandoverOptions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadHandoverOptions != null) {
      return loadHandoverOptions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return loadHandoverOptions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return loadHandoverOptions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadHandoverOptions != null) {
      return loadHandoverOptions(this);
    }
    return orElse();
  }
}

abstract class _LoadHandoverOptions implements LeadMarketingEvent {
  const factory _LoadHandoverOptions() = _$LoadHandoverOptionsImpl;
}

/// @nodoc
abstract class _$$LoadAdminSaleIdImplCopyWith<$Res> {
  factory _$$LoadAdminSaleIdImplCopyWith(_$LoadAdminSaleIdImpl value,
          $Res Function(_$LoadAdminSaleIdImpl) then) =
      __$$LoadAdminSaleIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int leaderSaleId});
}

/// @nodoc
class __$$LoadAdminSaleIdImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$LoadAdminSaleIdImpl>
    implements _$$LoadAdminSaleIdImplCopyWith<$Res> {
  __$$LoadAdminSaleIdImplCopyWithImpl(
      _$LoadAdminSaleIdImpl _value, $Res Function(_$LoadAdminSaleIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaderSaleId = null,
  }) {
    return _then(_$LoadAdminSaleIdImpl(
      leaderSaleId: null == leaderSaleId
          ? _value.leaderSaleId
          : leaderSaleId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadAdminSaleIdImpl implements _LoadAdminSaleId {
  const _$LoadAdminSaleIdImpl({required this.leaderSaleId});

  @override
  final int leaderSaleId;

  @override
  String toString() {
    return 'LeadMarketingEvent.loadAdminSaleId(leaderSaleId: $leaderSaleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAdminSaleIdImpl &&
            (identical(other.leaderSaleId, leaderSaleId) ||
                other.leaderSaleId == leaderSaleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, leaderSaleId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAdminSaleIdImplCopyWith<_$LoadAdminSaleIdImpl> get copyWith =>
      __$$LoadAdminSaleIdImplCopyWithImpl<_$LoadAdminSaleIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return loadAdminSaleId(leaderSaleId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return loadAdminSaleId?.call(leaderSaleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadAdminSaleId != null) {
      return loadAdminSaleId(leaderSaleId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return loadAdminSaleId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return loadAdminSaleId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (loadAdminSaleId != null) {
      return loadAdminSaleId(this);
    }
    return orElse();
  }
}

abstract class _LoadAdminSaleId implements LeadMarketingEvent {
  const factory _LoadAdminSaleId({required final int leaderSaleId}) =
      _$LoadAdminSaleIdImpl;

  int get leaderSaleId;
  @JsonKey(ignore: true)
  _$$LoadAdminSaleIdImplCopyWith<_$LoadAdminSaleIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HandoverLeadImplCopyWith<$Res> {
  factory _$$HandoverLeadImplCopyWith(
          _$HandoverLeadImpl value, $Res Function(_$HandoverLeadImpl) then) =
      __$$HandoverLeadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, int leaderEmployeeId, int adminSaleId, String note});
}

/// @nodoc
class __$$HandoverLeadImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$HandoverLeadImpl>
    implements _$$HandoverLeadImplCopyWith<$Res> {
  __$$HandoverLeadImplCopyWithImpl(
      _$HandoverLeadImpl _value, $Res Function(_$HandoverLeadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? leaderEmployeeId = null,
    Object? adminSaleId = null,
    Object? note = null,
  }) {
    return _then(_$HandoverLeadImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      leaderEmployeeId: null == leaderEmployeeId
          ? _value.leaderEmployeeId
          : leaderEmployeeId // ignore: cast_nullable_to_non_nullable
              as int,
      adminSaleId: null == adminSaleId
          ? _value.adminSaleId
          : adminSaleId // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HandoverLeadImpl implements _HandoverLead {
  const _$HandoverLeadImpl(
      {required this.id,
      required this.leaderEmployeeId,
      required this.adminSaleId,
      required this.note});

  @override
  final int id;
  @override
  final int leaderEmployeeId;
  @override
  final int adminSaleId;
  @override
  final String note;

  @override
  String toString() {
    return 'LeadMarketingEvent.handoverLead(id: $id, leaderEmployeeId: $leaderEmployeeId, adminSaleId: $adminSaleId, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HandoverLeadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.leaderEmployeeId, leaderEmployeeId) ||
                other.leaderEmployeeId == leaderEmployeeId) &&
            (identical(other.adminSaleId, adminSaleId) ||
                other.adminSaleId == adminSaleId) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, leaderEmployeeId, adminSaleId, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HandoverLeadImplCopyWith<_$HandoverLeadImpl> get copyWith =>
      __$$HandoverLeadImplCopyWithImpl<_$HandoverLeadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return handoverLead(id, leaderEmployeeId, adminSaleId, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return handoverLead?.call(id, leaderEmployeeId, adminSaleId, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (handoverLead != null) {
      return handoverLead(id, leaderEmployeeId, adminSaleId, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return handoverLead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return handoverLead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (handoverLead != null) {
      return handoverLead(this);
    }
    return orElse();
  }
}

abstract class _HandoverLead implements LeadMarketingEvent {
  const factory _HandoverLead(
      {required final int id,
      required final int leaderEmployeeId,
      required final int adminSaleId,
      required final String note}) = _$HandoverLeadImpl;

  int get id;
  int get leaderEmployeeId;
  int get adminSaleId;
  String get note;
  @JsonKey(ignore: true)
  _$$HandoverLeadImplCopyWith<_$HandoverLeadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearHandoverStateImplCopyWith<$Res> {
  factory _$$ClearHandoverStateImplCopyWith(_$ClearHandoverStateImpl value,
          $Res Function(_$ClearHandoverStateImpl) then) =
      __$$ClearHandoverStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearHandoverStateImplCopyWithImpl<$Res>
    extends _$LeadMarketingEventCopyWithImpl<$Res, _$ClearHandoverStateImpl>
    implements _$$ClearHandoverStateImplCopyWith<$Res> {
  __$$ClearHandoverStateImplCopyWithImpl(_$ClearHandoverStateImpl _value,
      $Res Function(_$ClearHandoverStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearHandoverStateImpl implements _ClearHandoverState {
  const _$ClearHandoverStateImpl();

  @override
  String toString() {
    return 'LeadMarketingEvent.clearHandoverState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearHandoverStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String keyword) changeKeyword,
    required TResult Function() refresh,
    required TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)
        applyFilter,
    required TResult Function() clearFilter,
    required TResult Function(int id) loadDetail,
    required TResult Function(int customerContactId) loadFiles,
    required TResult Function(int customerContactId) loadFilesPo,
    required TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)
        saveFiles,
    required TResult Function(int fileId, int fileType) deleteFile,
    required TResult Function() clearFileActionState,
    required TResult Function() loadFormOptions,
    required TResult Function(int id) loadCustomerDetail,
    required TResult Function(Map<String, dynamic> payload) submitLead,
    required TResult Function(Map<String, dynamic> payload)
        confirmDuplicateSave,
    required TResult Function() cancelDuplicateSave,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteLead,
    required TResult Function() clearDeleteState,
    required TResult Function() loadActivityTypes,
    required TResult Function(Map<String, dynamic> payload) saveActivity,
    required TResult Function() clearActivityState,
    required TResult Function(int id, String note) disqualifyLead,
    required TResult Function(int id, String note) reopenLead,
    required TResult Function() clearStageActionState,
    required TResult Function() loadHandoverOptions,
    required TResult Function(int leaderSaleId) loadAdminSaleId,
    required TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)
        handoverLead,
    required TResult Function() clearHandoverState,
  }) {
    return clearHandoverState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String keyword)? changeKeyword,
    TResult? Function()? refresh,
    TResult? Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult? Function()? clearFilter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int customerContactId)? loadFiles,
    TResult? Function(int customerContactId)? loadFilesPo,
    TResult? Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult? Function(int fileId, int fileType)? deleteFile,
    TResult? Function()? clearFileActionState,
    TResult? Function()? loadFormOptions,
    TResult? Function(int id)? loadCustomerDetail,
    TResult? Function(Map<String, dynamic> payload)? submitLead,
    TResult? Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult? Function()? cancelDuplicateSave,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteLead,
    TResult? Function()? clearDeleteState,
    TResult? Function()? loadActivityTypes,
    TResult? Function(Map<String, dynamic> payload)? saveActivity,
    TResult? Function()? clearActivityState,
    TResult? Function(int id, String note)? disqualifyLead,
    TResult? Function(int id, String note)? reopenLead,
    TResult? Function()? clearStageActionState,
    TResult? Function()? loadHandoverOptions,
    TResult? Function(int leaderSaleId)? loadAdminSaleId,
    TResult? Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult? Function()? clearHandoverState,
  }) {
    return clearHandoverState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String keyword)? changeKeyword,
    TResult Function()? refresh,
    TResult Function(int leadSourceId, int marketingEmployeeId,
            int saleEmployeeId, bool includeOpen, LeadStage? stage)?
        applyFilter,
    TResult Function()? clearFilter,
    TResult Function(int id)? loadDetail,
    TResult Function(int customerContactId)? loadFiles,
    TResult Function(int customerContactId)? loadFilesPo,
    TResult Function(int customerContactId, int fileType,
            List<PlatformFile> files, String note)?
        saveFiles,
    TResult Function(int fileId, int fileType)? deleteFile,
    TResult Function()? clearFileActionState,
    TResult Function()? loadFormOptions,
    TResult Function(int id)? loadCustomerDetail,
    TResult Function(Map<String, dynamic> payload)? submitLead,
    TResult Function(Map<String, dynamic> payload)? confirmDuplicateSave,
    TResult Function()? cancelDuplicateSave,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteLead,
    TResult Function()? clearDeleteState,
    TResult Function()? loadActivityTypes,
    TResult Function(Map<String, dynamic> payload)? saveActivity,
    TResult Function()? clearActivityState,
    TResult Function(int id, String note)? disqualifyLead,
    TResult Function(int id, String note)? reopenLead,
    TResult Function()? clearStageActionState,
    TResult Function()? loadHandoverOptions,
    TResult Function(int leaderSaleId)? loadAdminSaleId,
    TResult Function(
            int id, int leaderEmployeeId, int adminSaleId, String note)?
        handoverLead,
    TResult Function()? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearHandoverState != null) {
      return clearHandoverState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeKeyword value) changeKeyword,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilter value) applyFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadFiles value) loadFiles,
    required TResult Function(_LoadFilesPo value) loadFilesPo,
    required TResult Function(_SaveFiles value) saveFiles,
    required TResult Function(_DeleteFile value) deleteFile,
    required TResult Function(_ClearFileActionState value) clearFileActionState,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_LoadCustomerDetail value) loadCustomerDetail,
    required TResult Function(_SubmitLead value) submitLead,
    required TResult Function(_ConfirmDuplicateSave value) confirmDuplicateSave,
    required TResult Function(_CancelDuplicateSave value) cancelDuplicateSave,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteLead value) deleteLead,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
    required TResult Function(_LoadActivityTypes value) loadActivityTypes,
    required TResult Function(_SaveActivity value) saveActivity,
    required TResult Function(_ClearActivityState value) clearActivityState,
    required TResult Function(_DisqualifyLead value) disqualifyLead,
    required TResult Function(_ReopenLead value) reopenLead,
    required TResult Function(_ClearStageActionState value)
        clearStageActionState,
    required TResult Function(_LoadHandoverOptions value) loadHandoverOptions,
    required TResult Function(_LoadAdminSaleId value) loadAdminSaleId,
    required TResult Function(_HandoverLead value) handoverLead,
    required TResult Function(_ClearHandoverState value) clearHandoverState,
  }) {
    return clearHandoverState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeKeyword value)? changeKeyword,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilter value)? applyFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadFiles value)? loadFiles,
    TResult? Function(_LoadFilesPo value)? loadFilesPo,
    TResult? Function(_SaveFiles value)? saveFiles,
    TResult? Function(_DeleteFile value)? deleteFile,
    TResult? Function(_ClearFileActionState value)? clearFileActionState,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult? Function(_SubmitLead value)? submitLead,
    TResult? Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult? Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteLead value)? deleteLead,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
    TResult? Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult? Function(_SaveActivity value)? saveActivity,
    TResult? Function(_ClearActivityState value)? clearActivityState,
    TResult? Function(_DisqualifyLead value)? disqualifyLead,
    TResult? Function(_ReopenLead value)? reopenLead,
    TResult? Function(_ClearStageActionState value)? clearStageActionState,
    TResult? Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult? Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult? Function(_HandoverLead value)? handoverLead,
    TResult? Function(_ClearHandoverState value)? clearHandoverState,
  }) {
    return clearHandoverState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeKeyword value)? changeKeyword,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilter value)? applyFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadFiles value)? loadFiles,
    TResult Function(_LoadFilesPo value)? loadFilesPo,
    TResult Function(_SaveFiles value)? saveFiles,
    TResult Function(_DeleteFile value)? deleteFile,
    TResult Function(_ClearFileActionState value)? clearFileActionState,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_LoadCustomerDetail value)? loadCustomerDetail,
    TResult Function(_SubmitLead value)? submitLead,
    TResult Function(_ConfirmDuplicateSave value)? confirmDuplicateSave,
    TResult Function(_CancelDuplicateSave value)? cancelDuplicateSave,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteLead value)? deleteLead,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    TResult Function(_LoadActivityTypes value)? loadActivityTypes,
    TResult Function(_SaveActivity value)? saveActivity,
    TResult Function(_ClearActivityState value)? clearActivityState,
    TResult Function(_DisqualifyLead value)? disqualifyLead,
    TResult Function(_ReopenLead value)? reopenLead,
    TResult Function(_ClearStageActionState value)? clearStageActionState,
    TResult Function(_LoadHandoverOptions value)? loadHandoverOptions,
    TResult Function(_LoadAdminSaleId value)? loadAdminSaleId,
    TResult Function(_HandoverLead value)? handoverLead,
    TResult Function(_ClearHandoverState value)? clearHandoverState,
    required TResult orElse(),
  }) {
    if (clearHandoverState != null) {
      return clearHandoverState(this);
    }
    return orElse();
  }
}

abstract class _ClearHandoverState implements LeadMarketingEvent {
  const factory _ClearHandoverState() = _$ClearHandoverStateImpl;
}
