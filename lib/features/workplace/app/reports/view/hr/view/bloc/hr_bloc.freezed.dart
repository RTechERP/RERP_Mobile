// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hr_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HrEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HrEventCopyWith<$Res> {
  factory $HrEventCopyWith(HrEvent value, $Res Function(HrEvent) then) =
      _$HrEventCopyWithImpl<$Res, HrEvent>;
}

/// @nodoc
class _$HrEventCopyWithImpl<$Res, $Val extends HrEvent>
    implements $HrEventCopyWith<$Res> {
  _$HrEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitAdImplCopyWith<$Res> {
  factory _$$InitAdImplCopyWith(
          _$InitAdImpl value, $Res Function(_$InitAdImpl) then) =
      __$$InitAdImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitAdImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$InitAdImpl>
    implements _$$InitAdImplCopyWith<$Res> {
  __$$InitAdImplCopyWithImpl(
      _$InitAdImpl _value, $Res Function(_$InitAdImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitAdImpl implements _InitAd {
  const _$InitAdImpl();

  @override
  String toString() {
    return 'HrEvent.initAd()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitAdImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return initAd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return initAd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (initAd != null) {
      return initAd();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return initAd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return initAd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (initAd != null) {
      return initAd(this);
    }
    return orElse();
  }
}

abstract class _InitAd implements HrEvent {
  const factory _InitAd() = _$InitAdImpl;
}

/// @nodoc
abstract class _$$InitLxcpImplCopyWith<$Res> {
  factory _$$InitLxcpImplCopyWith(
          _$InitLxcpImpl value, $Res Function(_$InitLxcpImpl) then) =
      __$$InitLxcpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitLxcpImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$InitLxcpImpl>
    implements _$$InitLxcpImplCopyWith<$Res> {
  __$$InitLxcpImplCopyWithImpl(
      _$InitLxcpImpl _value, $Res Function(_$InitLxcpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitLxcpImpl implements _InitLxcp {
  const _$InitLxcpImpl();

  @override
  String toString() {
    return 'HrEvent.initLxcp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitLxcpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return initLxcp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return initLxcp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (initLxcp != null) {
      return initLxcp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return initLxcp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return initLxcp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (initLxcp != null) {
      return initLxcp(this);
    }
    return orElse();
  }
}

abstract class _InitLxcp implements HrEvent {
  const factory _InitLxcp() = _$InitLxcpImpl;
}

/// @nodoc
abstract class _$$SubmitReportWithDateImplCopyWith<$Res> {
  factory _$$SubmitReportWithDateImplCopyWith(_$SubmitReportWithDateImpl value,
          $Res Function(_$SubmitReportWithDateImpl) then) =
      __$$SubmitReportWithDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime pickedDate});
}

/// @nodoc
class __$$SubmitReportWithDateImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$SubmitReportWithDateImpl>
    implements _$$SubmitReportWithDateImplCopyWith<$Res> {
  __$$SubmitReportWithDateImplCopyWithImpl(_$SubmitReportWithDateImpl _value,
      $Res Function(_$SubmitReportWithDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedDate = null,
  }) {
    return _then(_$SubmitReportWithDateImpl(
      null == pickedDate
          ? _value.pickedDate
          : pickedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SubmitReportWithDateImpl implements _SubmitReportWithDate {
  const _$SubmitReportWithDateImpl(this.pickedDate);

  @override
  final DateTime pickedDate;

  @override
  String toString() {
    return 'HrEvent.submitReport(pickedDate: $pickedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitReportWithDateImpl &&
            (identical(other.pickedDate, pickedDate) ||
                other.pickedDate == pickedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pickedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitReportWithDateImplCopyWith<_$SubmitReportWithDateImpl>
      get copyWith =>
          __$$SubmitReportWithDateImplCopyWithImpl<_$SubmitReportWithDateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return submitReport(pickedDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return submitReport?.call(pickedDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (submitReport != null) {
      return submitReport(pickedDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return submitReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return submitReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (submitReport != null) {
      return submitReport(this);
    }
    return orElse();
  }
}

abstract class _SubmitReportWithDate implements HrEvent {
  const factory _SubmitReportWithDate(final DateTime pickedDate) =
      _$SubmitReportWithDateImpl;

  DateTime get pickedDate;
  @JsonKey(ignore: true)
  _$$SubmitReportWithDateImplCopyWith<_$SubmitReportWithDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitReportLCXPWithDateImplCopyWith<$Res> {
  factory _$$SubmitReportLCXPWithDateImplCopyWith(
          _$SubmitReportLCXPWithDateImpl value,
          $Res Function(_$SubmitReportLCXPWithDateImpl) then) =
      __$$SubmitReportLCXPWithDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime pickedDate});
}

/// @nodoc
class __$$SubmitReportLCXPWithDateImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$SubmitReportLCXPWithDateImpl>
    implements _$$SubmitReportLCXPWithDateImplCopyWith<$Res> {
  __$$SubmitReportLCXPWithDateImplCopyWithImpl(
      _$SubmitReportLCXPWithDateImpl _value,
      $Res Function(_$SubmitReportLCXPWithDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedDate = null,
  }) {
    return _then(_$SubmitReportLCXPWithDateImpl(
      null == pickedDate
          ? _value.pickedDate
          : pickedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SubmitReportLCXPWithDateImpl implements _SubmitReportLCXPWithDate {
  const _$SubmitReportLCXPWithDateImpl(this.pickedDate);

  @override
  final DateTime pickedDate;

  @override
  String toString() {
    return 'HrEvent.submitReportLCXP(pickedDate: $pickedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitReportLCXPWithDateImpl &&
            (identical(other.pickedDate, pickedDate) ||
                other.pickedDate == pickedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pickedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitReportLCXPWithDateImplCopyWith<_$SubmitReportLCXPWithDateImpl>
      get copyWith => __$$SubmitReportLCXPWithDateImplCopyWithImpl<
          _$SubmitReportLCXPWithDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return submitReportLCXP(pickedDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return submitReportLCXP?.call(pickedDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (submitReportLCXP != null) {
      return submitReportLCXP(pickedDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return submitReportLCXP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return submitReportLCXP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (submitReportLCXP != null) {
      return submitReportLCXP(this);
    }
    return orElse();
  }
}

abstract class _SubmitReportLCXPWithDate implements HrEvent {
  const factory _SubmitReportLCXPWithDate(final DateTime pickedDate) =
      _$SubmitReportLCXPWithDateImpl;

  DateTime get pickedDate;
  @JsonKey(ignore: true)
  _$$SubmitReportLCXPWithDateImplCopyWith<_$SubmitReportLCXPWithDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteReportLCXPWithDateImplCopyWith<$Res> {
  factory _$$DeleteReportLCXPWithDateImplCopyWith(
          _$DeleteReportLCXPWithDateImpl value,
          $Res Function(_$DeleteReportLCXPWithDateImpl) then) =
      __$$DeleteReportLCXPWithDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, bool isDeleted});
}

/// @nodoc
class __$$DeleteReportLCXPWithDateImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$DeleteReportLCXPWithDateImpl>
    implements _$$DeleteReportLCXPWithDateImplCopyWith<$Res> {
  __$$DeleteReportLCXPWithDateImplCopyWithImpl(
      _$DeleteReportLCXPWithDateImpl _value,
      $Res Function(_$DeleteReportLCXPWithDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isDeleted = null,
  }) {
    return _then(_$DeleteReportLCXPWithDateImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DeleteReportLCXPWithDateImpl implements _DeleteReportLCXPWithDate {
  const _$DeleteReportLCXPWithDateImpl(this.id, this.isDeleted);

  @override
  final int id;
  @override
  final bool isDeleted;

  @override
  String toString() {
    return 'HrEvent.deleteReportLCXP(id: $id, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteReportLCXPWithDateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteReportLCXPWithDateImplCopyWith<_$DeleteReportLCXPWithDateImpl>
      get copyWith => __$$DeleteReportLCXPWithDateImplCopyWithImpl<
          _$DeleteReportLCXPWithDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return deleteReportLCXP(id, isDeleted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return deleteReportLCXP?.call(id, isDeleted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (deleteReportLCXP != null) {
      return deleteReportLCXP(id, isDeleted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return deleteReportLCXP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return deleteReportLCXP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (deleteReportLCXP != null) {
      return deleteReportLCXP(this);
    }
    return orElse();
  }
}

abstract class _DeleteReportLCXPWithDate implements HrEvent {
  const factory _DeleteReportLCXPWithDate(final int id, final bool isDeleted) =
      _$DeleteReportLCXPWithDateImpl;

  int get id;
  bool get isDeleted;
  @JsonKey(ignore: true)
  _$$DeleteReportLCXPWithDateImplCopyWith<_$DeleteReportLCXPWithDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetSubmitFlagsImplCopyWith<$Res> {
  factory _$$ResetSubmitFlagsImplCopyWith(_$ResetSubmitFlagsImpl value,
          $Res Function(_$ResetSubmitFlagsImpl) then) =
      __$$ResetSubmitFlagsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetSubmitFlagsImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$ResetSubmitFlagsImpl>
    implements _$$ResetSubmitFlagsImplCopyWith<$Res> {
  __$$ResetSubmitFlagsImplCopyWithImpl(_$ResetSubmitFlagsImpl _value,
      $Res Function(_$ResetSubmitFlagsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetSubmitFlagsImpl implements _ResetSubmitFlags {
  const _$ResetSubmitFlagsImpl();

  @override
  String toString() {
    return 'HrEvent.resetSubmitFlags()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetSubmitFlagsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return resetSubmitFlags();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return resetSubmitFlags?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (resetSubmitFlags != null) {
      return resetSubmitFlags();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return resetSubmitFlags(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return resetSubmitFlags?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (resetSubmitFlags != null) {
      return resetSubmitFlags(this);
    }
    return orElse();
  }
}

abstract class _ResetSubmitFlags implements HrEvent {
  const factory _ResetSubmitFlags() = _$ResetSubmitFlagsImpl;
}

/// @nodoc
abstract class _$$UpdateWorkImplCopyWith<$Res> {
  factory _$$UpdateWorkImplCopyWith(
          _$UpdateWorkImpl value, $Res Function(_$UpdateWorkImpl) then) =
      __$$UpdateWorkImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? content,
      String? results,
      String? note,
      String? backlog,
      String? planNextDay});
}

/// @nodoc
class __$$UpdateWorkImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$UpdateWorkImpl>
    implements _$$UpdateWorkImplCopyWith<$Res> {
  __$$UpdateWorkImplCopyWithImpl(
      _$UpdateWorkImpl _value, $Res Function(_$UpdateWorkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? results = freezed,
    Object? note = freezed,
    Object? backlog = freezed,
    Object? planNextDay = freezed,
  }) {
    return _then(_$UpdateWorkImpl(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      backlog: freezed == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String?,
      planNextDay: freezed == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateWorkImpl implements _UpdateWork {
  const _$UpdateWorkImpl(
      {this.content, this.results, this.note, this.backlog, this.planNextDay});

  @override
  final String? content;
  @override
  final String? results;
  @override
  final String? note;
  @override
  final String? backlog;
  @override
  final String? planNextDay;

  @override
  String toString() {
    return 'HrEvent.updateWork(content: $content, results: $results, note: $note, backlog: $backlog, planNextDay: $planNextDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateWorkImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.backlog, backlog) || other.backlog == backlog) &&
            (identical(other.planNextDay, planNextDay) ||
                other.planNextDay == planNextDay));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, content, results, note, backlog, planNextDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateWorkImplCopyWith<_$UpdateWorkImpl> get copyWith =>
      __$$UpdateWorkImplCopyWithImpl<_$UpdateWorkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return updateWork(content, results, note, backlog, planNextDay);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return updateWork?.call(content, results, note, backlog, planNextDay);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (updateWork != null) {
      return updateWork(content, results, note, backlog, planNextDay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return updateWork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return updateWork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (updateWork != null) {
      return updateWork(this);
    }
    return orElse();
  }
}

abstract class _UpdateWork implements HrEvent {
  const factory _UpdateWork(
      {final String? content,
      final String? results,
      final String? note,
      final String? backlog,
      final String? planNextDay}) = _$UpdateWorkImpl;

  String? get content;
  String? get results;
  String? get note;
  String? get backlog;
  String? get planNextDay;
  @JsonKey(ignore: true)
  _$$UpdateWorkImplCopyWith<_$UpdateWorkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LxcpUpdateWorkImplCopyWith<$Res> {
  factory _$$LxcpUpdateWorkImplCopyWith(_$LxcpUpdateWorkImpl value,
          $Res Function(_$LxcpUpdateWorkImpl) then) =
      __$$LxcpUpdateWorkImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int index,
      int? quantity,
      int? timeActual,
      int? performanceActual,
      int? percentage,
      int? kmNumber,
      int? totalLate,
      int? totalTimeLate,
      String? reasonLate,
      String? statusVehicle,
      String? propose,
      int? filmManagementDetailID});
}

/// @nodoc
class __$$LxcpUpdateWorkImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$LxcpUpdateWorkImpl>
    implements _$$LxcpUpdateWorkImplCopyWith<$Res> {
  __$$LxcpUpdateWorkImplCopyWithImpl(
      _$LxcpUpdateWorkImpl _value, $Res Function(_$LxcpUpdateWorkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? quantity = freezed,
    Object? timeActual = freezed,
    Object? performanceActual = freezed,
    Object? percentage = freezed,
    Object? kmNumber = freezed,
    Object? totalLate = freezed,
    Object? totalTimeLate = freezed,
    Object? reasonLate = freezed,
    Object? statusVehicle = freezed,
    Object? propose = freezed,
    Object? filmManagementDetailID = freezed,
  }) {
    return _then(_$LxcpUpdateWorkImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      timeActual: freezed == timeActual
          ? _value.timeActual
          : timeActual // ignore: cast_nullable_to_non_nullable
              as int?,
      performanceActual: freezed == performanceActual
          ? _value.performanceActual
          : performanceActual // ignore: cast_nullable_to_non_nullable
              as int?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int?,
      kmNumber: freezed == kmNumber
          ? _value.kmNumber
          : kmNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      totalLate: freezed == totalLate
          ? _value.totalLate
          : totalLate // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTimeLate: freezed == totalTimeLate
          ? _value.totalTimeLate
          : totalTimeLate // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonLate: freezed == reasonLate
          ? _value.reasonLate
          : reasonLate // ignore: cast_nullable_to_non_nullable
              as String?,
      statusVehicle: freezed == statusVehicle
          ? _value.statusVehicle
          : statusVehicle // ignore: cast_nullable_to_non_nullable
              as String?,
      propose: freezed == propose
          ? _value.propose
          : propose // ignore: cast_nullable_to_non_nullable
              as String?,
      filmManagementDetailID: freezed == filmManagementDetailID
          ? _value.filmManagementDetailID
          : filmManagementDetailID // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LxcpUpdateWorkImpl implements _LxcpUpdateWork {
  const _$LxcpUpdateWorkImpl(
      {required this.index,
      this.quantity,
      this.timeActual,
      this.performanceActual,
      this.percentage,
      this.kmNumber,
      this.totalLate,
      this.totalTimeLate,
      this.reasonLate,
      this.statusVehicle,
      this.propose,
      this.filmManagementDetailID});

  @override
  final int index;
  @override
  final int? quantity;
  @override
  final int? timeActual;
  @override
  final int? performanceActual;
  @override
  final int? percentage;
  @override
  final int? kmNumber;
  @override
  final int? totalLate;
  @override
  final int? totalTimeLate;
  @override
  final String? reasonLate;
  @override
  final String? statusVehicle;
  @override
  final String? propose;
  @override
  final int? filmManagementDetailID;

  @override
  String toString() {
    return 'HrEvent.lxcpUpdateWork(index: $index, quantity: $quantity, timeActual: $timeActual, performanceActual: $performanceActual, percentage: $percentage, kmNumber: $kmNumber, totalLate: $totalLate, totalTimeLate: $totalTimeLate, reasonLate: $reasonLate, statusVehicle: $statusVehicle, propose: $propose, filmManagementDetailID: $filmManagementDetailID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LxcpUpdateWorkImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.timeActual, timeActual) ||
                other.timeActual == timeActual) &&
            (identical(other.performanceActual, performanceActual) ||
                other.performanceActual == performanceActual) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.kmNumber, kmNumber) ||
                other.kmNumber == kmNumber) &&
            (identical(other.totalLate, totalLate) ||
                other.totalLate == totalLate) &&
            (identical(other.totalTimeLate, totalTimeLate) ||
                other.totalTimeLate == totalTimeLate) &&
            (identical(other.reasonLate, reasonLate) ||
                other.reasonLate == reasonLate) &&
            (identical(other.statusVehicle, statusVehicle) ||
                other.statusVehicle == statusVehicle) &&
            (identical(other.propose, propose) || other.propose == propose) &&
            (identical(other.filmManagementDetailID, filmManagementDetailID) ||
                other.filmManagementDetailID == filmManagementDetailID));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      index,
      quantity,
      timeActual,
      performanceActual,
      percentage,
      kmNumber,
      totalLate,
      totalTimeLate,
      reasonLate,
      statusVehicle,
      propose,
      filmManagementDetailID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LxcpUpdateWorkImplCopyWith<_$LxcpUpdateWorkImpl> get copyWith =>
      __$$LxcpUpdateWorkImplCopyWithImpl<_$LxcpUpdateWorkImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return lxcpUpdateWork(
        index,
        quantity,
        timeActual,
        performanceActual,
        percentage,
        kmNumber,
        totalLate,
        totalTimeLate,
        reasonLate,
        statusVehicle,
        propose,
        filmManagementDetailID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return lxcpUpdateWork?.call(
        index,
        quantity,
        timeActual,
        performanceActual,
        percentage,
        kmNumber,
        totalLate,
        totalTimeLate,
        reasonLate,
        statusVehicle,
        propose,
        filmManagementDetailID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (lxcpUpdateWork != null) {
      return lxcpUpdateWork(
          index,
          quantity,
          timeActual,
          performanceActual,
          percentage,
          kmNumber,
          totalLate,
          totalTimeLate,
          reasonLate,
          statusVehicle,
          propose,
          filmManagementDetailID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return lxcpUpdateWork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return lxcpUpdateWork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (lxcpUpdateWork != null) {
      return lxcpUpdateWork(this);
    }
    return orElse();
  }
}

abstract class _LxcpUpdateWork implements HrEvent {
  const factory _LxcpUpdateWork(
      {required final int index,
      final int? quantity,
      final int? timeActual,
      final int? performanceActual,
      final int? percentage,
      final int? kmNumber,
      final int? totalLate,
      final int? totalTimeLate,
      final String? reasonLate,
      final String? statusVehicle,
      final String? propose,
      final int? filmManagementDetailID}) = _$LxcpUpdateWorkImpl;

  int get index;
  int? get quantity;
  int? get timeActual;
  int? get performanceActual;
  int? get percentage;
  int? get kmNumber;
  int? get totalLate;
  int? get totalTimeLate;
  String? get reasonLate;
  String? get statusVehicle;
  String? get propose;
  int? get filmManagementDetailID;
  @JsonKey(ignore: true)
  _$$LxcpUpdateWorkImplCopyWith<_$LxcpUpdateWorkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateDateImplCopyWith<$Res> {
  factory _$$UpdateDateImplCopyWith(
          _$UpdateDateImpl value, $Res Function(_$UpdateDateImpl) then) =
      __$$UpdateDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? picked});
}

/// @nodoc
class __$$UpdateDateImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$UpdateDateImpl>
    implements _$$UpdateDateImplCopyWith<$Res> {
  __$$UpdateDateImplCopyWithImpl(
      _$UpdateDateImpl _value, $Res Function(_$UpdateDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? picked = freezed,
  }) {
    return _then(_$UpdateDateImpl(
      freezed == picked
          ? _value.picked
          : picked // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$UpdateDateImpl implements _UpdateDate {
  const _$UpdateDateImpl(this.picked);

  @override
  final DateTime? picked;

  @override
  String toString() {
    return 'HrEvent.updateDate(picked: $picked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDateImpl &&
            (identical(other.picked, picked) || other.picked == picked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, picked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDateImplCopyWith<_$UpdateDateImpl> get copyWith =>
      __$$UpdateDateImplCopyWithImpl<_$UpdateDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return updateDate(picked);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return updateDate?.call(picked);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (updateDate != null) {
      return updateDate(picked);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return updateDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return updateDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (updateDate != null) {
      return updateDate(this);
    }
    return orElse();
  }
}

abstract class _UpdateDate implements HrEvent {
  const factory _UpdateDate(final DateTime? picked) = _$UpdateDateImpl;

  DateTime? get picked;
  @JsonKey(ignore: true)
  _$$UpdateDateImplCopyWith<_$UpdateDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteReportImplCopyWith<$Res> {
  factory _$$DeleteReportImplCopyWith(
          _$DeleteReportImpl value, $Res Function(_$DeleteReportImpl) then) =
      __$$DeleteReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int dailyID});
}

/// @nodoc
class __$$DeleteReportImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$DeleteReportImpl>
    implements _$$DeleteReportImplCopyWith<$Res> {
  __$$DeleteReportImplCopyWithImpl(
      _$DeleteReportImpl _value, $Res Function(_$DeleteReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyID = null,
  }) {
    return _then(_$DeleteReportImpl(
      null == dailyID
          ? _value.dailyID
          : dailyID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteReportImpl implements _DeleteReport {
  const _$DeleteReportImpl(this.dailyID);

  @override
  final int dailyID;

  @override
  String toString() {
    return 'HrEvent.deleteReport(dailyID: $dailyID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteReportImpl &&
            (identical(other.dailyID, dailyID) || other.dailyID == dailyID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dailyID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteReportImplCopyWith<_$DeleteReportImpl> get copyWith =>
      __$$DeleteReportImplCopyWithImpl<_$DeleteReportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return deleteReport(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return deleteReport?.call(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (deleteReport != null) {
      return deleteReport(dailyID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return deleteReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return deleteReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (deleteReport != null) {
      return deleteReport(this);
    }
    return orElse();
  }
}

abstract class _DeleteReport implements HrEvent {
  const factory _DeleteReport(final int dailyID) = _$DeleteReportImpl;

  int get dailyID;
  @JsonKey(ignore: true)
  _$$DeleteReportImplCopyWith<_$DeleteReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$HrEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
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
    return 'HrEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
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
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
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
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements HrEvent {
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
abstract class _$$ChangeLXCPDateRangeImplCopyWith<$Res> {
  factory _$$ChangeLXCPDateRangeImplCopyWith(_$ChangeLXCPDateRangeImpl value,
          $Res Function(_$ChangeLXCPDateRangeImpl) then) =
      __$$ChangeLXCPDateRangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateStart, DateTime dateEnd});
}

/// @nodoc
class __$$ChangeLXCPDateRangeImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$ChangeLXCPDateRangeImpl>
    implements _$$ChangeLXCPDateRangeImplCopyWith<$Res> {
  __$$ChangeLXCPDateRangeImplCopyWithImpl(_$ChangeLXCPDateRangeImpl _value,
      $Res Function(_$ChangeLXCPDateRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = null,
    Object? dateEnd = null,
  }) {
    return _then(_$ChangeLXCPDateRangeImpl(
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

class _$ChangeLXCPDateRangeImpl implements _ChangeLXCPDateRange {
  const _$ChangeLXCPDateRangeImpl(
      {required this.dateStart, required this.dateEnd});

  @override
  final DateTime dateStart;
  @override
  final DateTime dateEnd;

  @override
  String toString() {
    return 'HrEvent.changeLXCPDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeLXCPDateRangeImpl &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateStart, dateEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeLXCPDateRangeImplCopyWith<_$ChangeLXCPDateRangeImpl> get copyWith =>
      __$$ChangeLXCPDateRangeImplCopyWithImpl<_$ChangeLXCPDateRangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return changeLXCPDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return changeLXCPDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (changeLXCPDateRange != null) {
      return changeLXCPDateRange(dateStart, dateEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return changeLXCPDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return changeLXCPDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (changeLXCPDateRange != null) {
      return changeLXCPDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeLXCPDateRange implements HrEvent {
  const factory _ChangeLXCPDateRange(
      {required final DateTime dateStart,
      required final DateTime dateEnd}) = _$ChangeLXCPDateRangeImpl;

  DateTime get dateStart;
  DateTime get dateEnd;
  @JsonKey(ignore: true)
  _$$ChangeLXCPDateRangeImplCopyWith<_$ChangeLXCPDateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadDetailDataImplCopyWith<$Res> {
  factory _$$LoadDetailDataImplCopyWith(_$LoadDetailDataImpl value,
          $Res Function(_$LoadDetailDataImpl) then) =
      __$$LoadDetailDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int dailyID});
}

/// @nodoc
class __$$LoadDetailDataImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$LoadDetailDataImpl>
    implements _$$LoadDetailDataImplCopyWith<$Res> {
  __$$LoadDetailDataImplCopyWithImpl(
      _$LoadDetailDataImpl _value, $Res Function(_$LoadDetailDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyID = null,
  }) {
    return _then(_$LoadDetailDataImpl(
      dailyID: null == dailyID
          ? _value.dailyID
          : dailyID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadDetailDataImpl implements _LoadDetailData {
  const _$LoadDetailDataImpl({required this.dailyID});

  @override
  final int dailyID;

  @override
  String toString() {
    return 'HrEvent.loadDetailData(dailyID: $dailyID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadDetailDataImpl &&
            (identical(other.dailyID, dailyID) || other.dailyID == dailyID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dailyID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadDetailDataImplCopyWith<_$LoadDetailDataImpl> get copyWith =>
      __$$LoadDetailDataImplCopyWithImpl<_$LoadDetailDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return loadDetailData(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return loadDetailData?.call(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (loadDetailData != null) {
      return loadDetailData(dailyID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return loadDetailData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return loadDetailData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (loadDetailData != null) {
      return loadDetailData(this);
    }
    return orElse();
  }
}

abstract class _LoadDetailData implements HrEvent {
  const factory _LoadDetailData({required final int dailyID}) =
      _$LoadDetailDataImpl;

  int get dailyID;
  @JsonKey(ignore: true)
  _$$LoadDetailDataImplCopyWith<_$LoadDetailDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectReportImplCopyWith<$Res> {
  factory _$$SelectReportImplCopyWith(
          _$SelectReportImpl value, $Res Function(_$SelectReportImpl) then) =
      __$$SelectReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int dailyID});
}

/// @nodoc
class __$$SelectReportImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$SelectReportImpl>
    implements _$$SelectReportImplCopyWith<$Res> {
  __$$SelectReportImplCopyWithImpl(
      _$SelectReportImpl _value, $Res Function(_$SelectReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyID = null,
  }) {
    return _then(_$SelectReportImpl(
      dailyID: null == dailyID
          ? _value.dailyID
          : dailyID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectReportImpl implements _SelectReport {
  const _$SelectReportImpl({required this.dailyID});

  @override
  final int dailyID;

  @override
  String toString() {
    return 'HrEvent.selectReport(dailyID: $dailyID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectReportImpl &&
            (identical(other.dailyID, dailyID) || other.dailyID == dailyID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dailyID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectReportImplCopyWith<_$SelectReportImpl> get copyWith =>
      __$$SelectReportImplCopyWithImpl<_$SelectReportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return selectReport(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return selectReport?.call(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (selectReport != null) {
      return selectReport(dailyID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return selectReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return selectReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (selectReport != null) {
      return selectReport(this);
    }
    return orElse();
  }
}

abstract class _SelectReport implements HrEvent {
  const factory _SelectReport({required final int dailyID}) =
      _$SelectReportImpl;

  int get dailyID;
  @JsonKey(ignore: true)
  _$$SelectReportImplCopyWith<_$SelectReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectLXCPReportImplCopyWith<$Res> {
  factory _$$SelectLXCPReportImplCopyWith(_$SelectLXCPReportImpl value,
          $Res Function(_$SelectLXCPReportImpl) then) =
      __$$SelectLXCPReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int dailyID});
}

/// @nodoc
class __$$SelectLXCPReportImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$SelectLXCPReportImpl>
    implements _$$SelectLXCPReportImplCopyWith<$Res> {
  __$$SelectLXCPReportImplCopyWithImpl(_$SelectLXCPReportImpl _value,
      $Res Function(_$SelectLXCPReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyID = null,
  }) {
    return _then(_$SelectLXCPReportImpl(
      dailyID: null == dailyID
          ? _value.dailyID
          : dailyID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectLXCPReportImpl implements _SelectLXCPReport {
  const _$SelectLXCPReportImpl({required this.dailyID});

  @override
  final int dailyID;

  @override
  String toString() {
    return 'HrEvent.selectLXCPReport(dailyID: $dailyID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectLXCPReportImpl &&
            (identical(other.dailyID, dailyID) || other.dailyID == dailyID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dailyID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectLXCPReportImplCopyWith<_$SelectLXCPReportImpl> get copyWith =>
      __$$SelectLXCPReportImplCopyWithImpl<_$SelectLXCPReportImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return selectLXCPReport(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return selectLXCPReport?.call(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (selectLXCPReport != null) {
      return selectLXCPReport(dailyID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return selectLXCPReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return selectLXCPReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (selectLXCPReport != null) {
      return selectLXCPReport(this);
    }
    return orElse();
  }
}

abstract class _SelectLXCPReport implements HrEvent {
  const factory _SelectLXCPReport({required final int dailyID}) =
      _$SelectLXCPReportImpl;

  int get dailyID;
  @JsonKey(ignore: true)
  _$$SelectLXCPReportImplCopyWith<_$SelectLXCPReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitEditReportWithDateImplCopyWith<$Res> {
  factory _$$SubmitEditReportWithDateImplCopyWith(
          _$SubmitEditReportWithDateImpl value,
          $Res Function(_$SubmitEditReportWithDateImpl) then) =
      __$$SubmitEditReportWithDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime pickedDate, int dailyID});
}

/// @nodoc
class __$$SubmitEditReportWithDateImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$SubmitEditReportWithDateImpl>
    implements _$$SubmitEditReportWithDateImplCopyWith<$Res> {
  __$$SubmitEditReportWithDateImplCopyWithImpl(
      _$SubmitEditReportWithDateImpl _value,
      $Res Function(_$SubmitEditReportWithDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedDate = null,
    Object? dailyID = null,
  }) {
    return _then(_$SubmitEditReportWithDateImpl(
      null == pickedDate
          ? _value.pickedDate
          : pickedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == dailyID
          ? _value.dailyID
          : dailyID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SubmitEditReportWithDateImpl implements _SubmitEditReportWithDate {
  const _$SubmitEditReportWithDateImpl(this.pickedDate, this.dailyID);

  @override
  final DateTime pickedDate;
  @override
  final int dailyID;

  @override
  String toString() {
    return 'HrEvent.submitEditReport(pickedDate: $pickedDate, dailyID: $dailyID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitEditReportWithDateImpl &&
            (identical(other.pickedDate, pickedDate) ||
                other.pickedDate == pickedDate) &&
            (identical(other.dailyID, dailyID) || other.dailyID == dailyID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pickedDate, dailyID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitEditReportWithDateImplCopyWith<_$SubmitEditReportWithDateImpl>
      get copyWith => __$$SubmitEditReportWithDateImplCopyWithImpl<
          _$SubmitEditReportWithDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return submitEditReport(pickedDate, dailyID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return submitEditReport?.call(pickedDate, dailyID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (submitEditReport != null) {
      return submitEditReport(pickedDate, dailyID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return submitEditReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return submitEditReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (submitEditReport != null) {
      return submitEditReport(this);
    }
    return orElse();
  }
}

abstract class _SubmitEditReportWithDate implements HrEvent {
  const factory _SubmitEditReportWithDate(
          final DateTime pickedDate, final int dailyID) =
      _$SubmitEditReportWithDateImpl;

  DateTime get pickedDate;
  int get dailyID;
  @JsonKey(ignore: true)
  _$$SubmitEditReportWithDateImplCopyWith<_$SubmitEditReportWithDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitLXCPEditReportWithDateImplCopyWith<$Res> {
  factory _$$SubmitLXCPEditReportWithDateImplCopyWith(
          _$SubmitLXCPEditReportWithDateImpl value,
          $Res Function(_$SubmitLXCPEditReportWithDateImpl) then) =
      __$$SubmitLXCPEditReportWithDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime pickedDate, int dailyID});
}

/// @nodoc
class __$$SubmitLXCPEditReportWithDateImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$SubmitLXCPEditReportWithDateImpl>
    implements _$$SubmitLXCPEditReportWithDateImplCopyWith<$Res> {
  __$$SubmitLXCPEditReportWithDateImplCopyWithImpl(
      _$SubmitLXCPEditReportWithDateImpl _value,
      $Res Function(_$SubmitLXCPEditReportWithDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedDate = null,
    Object? dailyID = null,
  }) {
    return _then(_$SubmitLXCPEditReportWithDateImpl(
      null == pickedDate
          ? _value.pickedDate
          : pickedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == dailyID
          ? _value.dailyID
          : dailyID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SubmitLXCPEditReportWithDateImpl
    implements _SubmitLXCPEditReportWithDate {
  const _$SubmitLXCPEditReportWithDateImpl(this.pickedDate, this.dailyID);

  @override
  final DateTime pickedDate;
  @override
  final int dailyID;

  @override
  String toString() {
    return 'HrEvent.submitLXCPEditReport(pickedDate: $pickedDate, dailyID: $dailyID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitLXCPEditReportWithDateImpl &&
            (identical(other.pickedDate, pickedDate) ||
                other.pickedDate == pickedDate) &&
            (identical(other.dailyID, dailyID) || other.dailyID == dailyID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pickedDate, dailyID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitLXCPEditReportWithDateImplCopyWith<
          _$SubmitLXCPEditReportWithDateImpl>
      get copyWith => __$$SubmitLXCPEditReportWithDateImplCopyWithImpl<
          _$SubmitLXCPEditReportWithDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return submitLXCPEditReport(pickedDate, dailyID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return submitLXCPEditReport?.call(pickedDate, dailyID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (submitLXCPEditReport != null) {
      return submitLXCPEditReport(pickedDate, dailyID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return submitLXCPEditReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return submitLXCPEditReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (submitLXCPEditReport != null) {
      return submitLXCPEditReport(this);
    }
    return orElse();
  }
}

abstract class _SubmitLXCPEditReportWithDate implements HrEvent {
  const factory _SubmitLXCPEditReportWithDate(
          final DateTime pickedDate, final int dailyID) =
      _$SubmitLXCPEditReportWithDateImpl;

  DateTime get pickedDate;
  int get dailyID;
  @JsonKey(ignore: true)
  _$$SubmitLXCPEditReportWithDateImplCopyWith<
          _$SubmitLXCPEditReportWithDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CopyReportImplCopyWith<$Res> {
  factory _$$CopyReportImplCopyWith(
          _$CopyReportImpl value, $Res Function(_$CopyReportImpl) then) =
      __$$CopyReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DateTime dateStart,
      DateTime dateEnd,
      String keyword,
      int teamId,
      int userId,
      int departmentId});
}

/// @nodoc
class __$$CopyReportImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$CopyReportImpl>
    implements _$$CopyReportImplCopyWith<$Res> {
  __$$CopyReportImplCopyWithImpl(
      _$CopyReportImpl _value, $Res Function(_$CopyReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? keyword = null,
    Object? teamId = null,
    Object? userId = null,
    Object? departmentId = null,
  }) {
    return _then(_$CopyReportImpl(
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CopyReportImpl implements _CopyReport {
  const _$CopyReportImpl(
      {required this.dateStart,
      required this.dateEnd,
      required this.keyword,
      required this.teamId,
      required this.userId,
      required this.departmentId});

  @override
  final DateTime dateStart;
  @override
  final DateTime dateEnd;
  @override
  final String keyword;
  @override
  final int teamId;
  @override
  final int userId;
  @override
  final int departmentId;

  @override
  String toString() {
    return 'HrEvent.copyReport(dateStart: $dateStart, dateEnd: $dateEnd, keyword: $keyword, teamId: $teamId, userId: $userId, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CopyReportImpl &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, dateStart, dateEnd, keyword, teamId, userId, departmentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CopyReportImplCopyWith<_$CopyReportImpl> get copyWith =>
      __$$CopyReportImplCopyWithImpl<_$CopyReportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return copyReport(
        dateStart, dateEnd, keyword, teamId, userId, departmentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return copyReport?.call(
        dateStart, dateEnd, keyword, teamId, userId, departmentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (copyReport != null) {
      return copyReport(
          dateStart, dateEnd, keyword, teamId, userId, departmentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return copyReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return copyReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (copyReport != null) {
      return copyReport(this);
    }
    return orElse();
  }
}

abstract class _CopyReport implements HrEvent {
  const factory _CopyReport(
      {required final DateTime dateStart,
      required final DateTime dateEnd,
      required final String keyword,
      required final int teamId,
      required final int userId,
      required final int departmentId}) = _$CopyReportImpl;

  DateTime get dateStart;
  DateTime get dateEnd;
  String get keyword;
  int get teamId;
  int get userId;
  int get departmentId;
  @JsonKey(ignore: true)
  _$$CopyReportImplCopyWith<_$CopyReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetCopyImplCopyWith<$Res> {
  factory _$$ResetCopyImplCopyWith(
          _$ResetCopyImpl value, $Res Function(_$ResetCopyImpl) then) =
      __$$ResetCopyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCopyImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$ResetCopyImpl>
    implements _$$ResetCopyImplCopyWith<$Res> {
  __$$ResetCopyImplCopyWithImpl(
      _$ResetCopyImpl _value, $Res Function(_$ResetCopyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetCopyImpl implements _ResetCopy {
  const _$ResetCopyImpl();

  @override
  String toString() {
    return 'HrEvent.resetCopyReport()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetCopyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return resetCopyReport();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return resetCopyReport?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (resetCopyReport != null) {
      return resetCopyReport();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return resetCopyReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return resetCopyReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (resetCopyReport != null) {
      return resetCopyReport(this);
    }
    return orElse();
  }
}

abstract class _ResetCopy implements HrEvent {
  const factory _ResetCopy() = _$ResetCopyImpl;
}

/// @nodoc
abstract class _$$AddWorkImplCopyWith<$Res> {
  factory _$$AddWorkImplCopyWith(
          _$AddWorkImpl value, $Res Function(_$AddWorkImpl) then) =
      __$$AddWorkImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddWorkImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$AddWorkImpl>
    implements _$$AddWorkImplCopyWith<$Res> {
  __$$AddWorkImplCopyWithImpl(
      _$AddWorkImpl _value, $Res Function(_$AddWorkImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddWorkImpl implements _AddWork {
  const _$AddWorkImpl();

  @override
  String toString() {
    return 'HrEvent.addWork()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddWorkImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return addWork();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return addWork?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (addWork != null) {
      return addWork();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return addWork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return addWork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (addWork != null) {
      return addWork(this);
    }
    return orElse();
  }
}

abstract class _AddWork implements HrEvent {
  const factory _AddWork() = _$AddWorkImpl;
}

/// @nodoc
abstract class _$$RemoveWorkImplCopyWith<$Res> {
  factory _$$RemoveWorkImplCopyWith(
          _$RemoveWorkImpl value, $Res Function(_$RemoveWorkImpl) then) =
      __$$RemoveWorkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$RemoveWorkImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$RemoveWorkImpl>
    implements _$$RemoveWorkImplCopyWith<$Res> {
  __$$RemoveWorkImplCopyWithImpl(
      _$RemoveWorkImpl _value, $Res Function(_$RemoveWorkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$RemoveWorkImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveWorkImpl implements _RemoveWork {
  const _$RemoveWorkImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'HrEvent.removeWork(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveWorkImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveWorkImplCopyWith<_$RemoveWorkImpl> get copyWith =>
      __$$RemoveWorkImplCopyWithImpl<_$RemoveWorkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return removeWork(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return removeWork?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (removeWork != null) {
      return removeWork(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return removeWork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return removeWork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (removeWork != null) {
      return removeWork(this);
    }
    return orElse();
  }
}

abstract class _RemoveWork implements HrEvent {
  const factory _RemoveWork({required final int index}) = _$RemoveWorkImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$RemoveWorkImplCopyWith<_$RemoveWorkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExpandWorkImplCopyWith<$Res> {
  factory _$$ExpandWorkImplCopyWith(
          _$ExpandWorkImpl value, $Res Function(_$ExpandWorkImpl) then) =
      __$$ExpandWorkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ExpandWorkImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$ExpandWorkImpl>
    implements _$$ExpandWorkImplCopyWith<$Res> {
  __$$ExpandWorkImplCopyWithImpl(
      _$ExpandWorkImpl _value, $Res Function(_$ExpandWorkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$ExpandWorkImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ExpandWorkImpl implements _ExpandWork {
  const _$ExpandWorkImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'HrEvent.expandWork(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpandWorkImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpandWorkImplCopyWith<_$ExpandWorkImpl> get copyWith =>
      __$$ExpandWorkImplCopyWithImpl<_$ExpandWorkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return expandWork(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return expandWork?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (expandWork != null) {
      return expandWork(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return expandWork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return expandWork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (expandWork != null) {
      return expandWork(this);
    }
    return orElse();
  }
}

abstract class _ExpandWork implements HrEvent {
  const factory _ExpandWork({required final int index}) = _$ExpandWorkImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$ExpandWorkImplCopyWith<_$ExpandWorkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetFilmDetailImplCopyWith<$Res> {
  factory _$$GetFilmDetailImplCopyWith(
          _$GetFilmDetailImpl value, $Res Function(_$GetFilmDetailImpl) then) =
      __$$GetFilmDetailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetFilmDetailImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$GetFilmDetailImpl>
    implements _$$GetFilmDetailImplCopyWith<$Res> {
  __$$GetFilmDetailImplCopyWithImpl(
      _$GetFilmDetailImpl _value, $Res Function(_$GetFilmDetailImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetFilmDetailImpl implements _GetFilmDetail {
  const _$GetFilmDetailImpl();

  @override
  String toString() {
    return 'HrEvent.getFilmDetail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetFilmDetailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return getFilmDetail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return getFilmDetail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (getFilmDetail != null) {
      return getFilmDetail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return getFilmDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return getFilmDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (getFilmDetail != null) {
      return getFilmDetail(this);
    }
    return orElse();
  }
}

abstract class _GetFilmDetail implements HrEvent {
  const factory _GetFilmDetail() = _$GetFilmDetailImpl;
}

/// @nodoc
abstract class _$$SelectFilmDetailImplCopyWith<$Res> {
  factory _$$SelectFilmDetailImplCopyWith(_$SelectFilmDetailImpl value,
          $Res Function(_$SelectFilmDetailImpl) then) =
      __$$SelectFilmDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FilmDetailResponse film});

  $FilmDetailResponseCopyWith<$Res> get film;
}

/// @nodoc
class __$$SelectFilmDetailImplCopyWithImpl<$Res>
    extends _$HrEventCopyWithImpl<$Res, _$SelectFilmDetailImpl>
    implements _$$SelectFilmDetailImplCopyWith<$Res> {
  __$$SelectFilmDetailImplCopyWithImpl(_$SelectFilmDetailImpl _value,
      $Res Function(_$SelectFilmDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? film = null,
  }) {
    return _then(_$SelectFilmDetailImpl(
      null == film
          ? _value.film
          : film // ignore: cast_nullable_to_non_nullable
              as FilmDetailResponse,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FilmDetailResponseCopyWith<$Res> get film {
    return $FilmDetailResponseCopyWith<$Res>(_value.film, (value) {
      return _then(_value.copyWith(film: value));
    });
  }
}

/// @nodoc

class _$SelectFilmDetailImpl implements _SelectFilmDetail {
  const _$SelectFilmDetailImpl(this.film);

  @override
  final FilmDetailResponse film;

  @override
  String toString() {
    return 'HrEvent.selectFilmDetail(film: $film)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectFilmDetailImpl &&
            (identical(other.film, film) || other.film == film));
  }

  @override
  int get hashCode => Object.hash(runtimeType, film);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectFilmDetailImplCopyWith<_$SelectFilmDetailImpl> get copyWith =>
      __$$SelectFilmDetailImplCopyWithImpl<_$SelectFilmDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initAd,
    required TResult Function() initLxcp,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate) submitReportLCXP,
    required TResult Function(int id, bool isDeleted) deleteReportLCXP,
    required TResult Function() resetSubmitFlags,
    required TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)
        updateWork,
    required TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)
        lxcpUpdateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeLXCPDateRange,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) selectLXCPReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitLXCPEditReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function() getFilmDetail,
    required TResult Function(FilmDetailResponse film) selectFilmDetail,
  }) {
    return selectFilmDetail(film);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initAd,
    TResult? Function()? initLxcp,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate)? submitReportLCXP,
    TResult? Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult? Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime dateStart, DateTime dateEnd)?
        changeLXCPDateRange,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? selectLXCPReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function()? getFilmDetail,
    TResult? Function(FilmDetailResponse film)? selectFilmDetail,
  }) {
    return selectFilmDetail?.call(film);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initAd,
    TResult Function()? initLxcp,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate)? submitReportLCXP,
    TResult Function(int id, bool isDeleted)? deleteReportLCXP,
    TResult Function()? resetSubmitFlags,
    TResult Function(String? content, String? results, String? note,
            String? backlog, String? planNextDay)?
        updateWork,
    TResult Function(
            int index,
            int? quantity,
            int? timeActual,
            int? performanceActual,
            int? percentage,
            int? kmNumber,
            int? totalLate,
            int? totalTimeLate,
            String? reasonLate,
            String? statusVehicle,
            String? propose,
            int? filmManagementDetailID)?
        lxcpUpdateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeLXCPDateRange,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? selectLXCPReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(DateTime pickedDate, int dailyID)? submitLXCPEditReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function()? getFilmDetail,
    TResult Function(FilmDetailResponse film)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (selectFilmDetail != null) {
      return selectFilmDetail(film);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitAd value) initAd,
    required TResult Function(_InitLxcp value) initLxcp,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SubmitReportLCXPWithDate value) submitReportLCXP,
    required TResult Function(_DeleteReportLCXPWithDate value) deleteReportLCXP,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_LxcpUpdateWork value) lxcpUpdateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeLXCPDateRange value) changeLXCPDateRange,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_SelectLXCPReport value) selectLXCPReport,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_SubmitLXCPEditReportWithDate value)
        submitLXCPEditReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_GetFilmDetail value) getFilmDetail,
    required TResult Function(_SelectFilmDetail value) selectFilmDetail,
  }) {
    return selectFilmDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitAd value)? initAd,
    TResult? Function(_InitLxcp value)? initLxcp,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult? Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_SubmitLXCPEditReportWithDate value)?
        submitLXCPEditReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_GetFilmDetail value)? getFilmDetail,
    TResult? Function(_SelectFilmDetail value)? selectFilmDetail,
  }) {
    return selectFilmDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitAd value)? initAd,
    TResult Function(_InitLxcp value)? initLxcp,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SubmitReportLCXPWithDate value)? submitReportLCXP,
    TResult Function(_DeleteReportLCXPWithDate value)? deleteReportLCXP,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_LxcpUpdateWork value)? lxcpUpdateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeLXCPDateRange value)? changeLXCPDateRange,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_SelectLXCPReport value)? selectLXCPReport,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_SubmitLXCPEditReportWithDate value)? submitLXCPEditReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_GetFilmDetail value)? getFilmDetail,
    TResult Function(_SelectFilmDetail value)? selectFilmDetail,
    required TResult orElse(),
  }) {
    if (selectFilmDetail != null) {
      return selectFilmDetail(this);
    }
    return orElse();
  }
}

abstract class _SelectFilmDetail implements HrEvent {
  const factory _SelectFilmDetail(final FilmDetailResponse film) =
      _$SelectFilmDetailImpl;

  FilmDetailResponse get film;
  @JsonKey(ignore: true)
  _$$SelectFilmDetailImplCopyWith<_$SelectFilmDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
