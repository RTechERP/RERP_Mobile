// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tech_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TechEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechEventCopyWith<$Res> {
  factory $TechEventCopyWith(TechEvent value, $Res Function(TechEvent) then) =
      _$TechEventCopyWithImpl<$Res, TechEvent>;
}

/// @nodoc
class _$TechEventCopyWithImpl<$Res, $Val extends TechEvent>
    implements $TechEventCopyWith<$Res> {
  _$TechEventCopyWithImpl(this._value, this._then);

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
    extends _$TechEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'TechEvent.init()';
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
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements TechEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$AddEmptyProjectImplCopyWith<$Res> {
  factory _$$AddEmptyProjectImplCopyWith(_$AddEmptyProjectImpl value,
          $Res Function(_$AddEmptyProjectImpl) then) =
      __$$AddEmptyProjectImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddEmptyProjectImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$AddEmptyProjectImpl>
    implements _$$AddEmptyProjectImplCopyWith<$Res> {
  __$$AddEmptyProjectImplCopyWithImpl(
      _$AddEmptyProjectImpl _value, $Res Function(_$AddEmptyProjectImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddEmptyProjectImpl implements _AddEmptyProject {
  const _$AddEmptyProjectImpl();

  @override
  String toString() {
    return 'TechEvent.addEmptyProject()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddEmptyProjectImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return addEmptyProject();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return addEmptyProject?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    required TResult orElse(),
  }) {
    if (addEmptyProject != null) {
      return addEmptyProject();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return addEmptyProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return addEmptyProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (addEmptyProject != null) {
      return addEmptyProject(this);
    }
    return orElse();
  }
}

abstract class _AddEmptyProject implements TechEvent {
  const factory _AddEmptyProject() = _$AddEmptyProjectImpl;
}

/// @nodoc
abstract class _$$BindProjectFromApiImplCopyWith<$Res> {
  factory _$$BindProjectFromApiImplCopyWith(_$BindProjectFromApiImpl value,
          $Res Function(_$BindProjectFromApiImpl) then) =
      __$$BindProjectFromApiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tempId, ProjectResponse apiProject});

  $ProjectResponseCopyWith<$Res> get apiProject;
}

/// @nodoc
class __$$BindProjectFromApiImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$BindProjectFromApiImpl>
    implements _$$BindProjectFromApiImplCopyWith<$Res> {
  __$$BindProjectFromApiImplCopyWithImpl(_$BindProjectFromApiImpl _value,
      $Res Function(_$BindProjectFromApiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tempId = null,
    Object? apiProject = null,
  }) {
    return _then(_$BindProjectFromApiImpl(
      tempId: null == tempId
          ? _value.tempId
          : tempId // ignore: cast_nullable_to_non_nullable
              as String,
      apiProject: null == apiProject
          ? _value.apiProject
          : apiProject // ignore: cast_nullable_to_non_nullable
              as ProjectResponse,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectResponseCopyWith<$Res> get apiProject {
    return $ProjectResponseCopyWith<$Res>(_value.apiProject, (value) {
      return _then(_value.copyWith(apiProject: value));
    });
  }
}

/// @nodoc

class _$BindProjectFromApiImpl implements _BindProjectFromApi {
  const _$BindProjectFromApiImpl(
      {required this.tempId, required this.apiProject});

  @override
  final String tempId;
  @override
  final ProjectResponse apiProject;

  @override
  String toString() {
    return 'TechEvent.bindProjectFromApi(tempId: $tempId, apiProject: $apiProject)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BindProjectFromApiImpl &&
            (identical(other.tempId, tempId) || other.tempId == tempId) &&
            (identical(other.apiProject, apiProject) ||
                other.apiProject == apiProject));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tempId, apiProject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BindProjectFromApiImplCopyWith<_$BindProjectFromApiImpl> get copyWith =>
      __$$BindProjectFromApiImplCopyWithImpl<_$BindProjectFromApiImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return bindProjectFromApi(tempId, apiProject);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return bindProjectFromApi?.call(tempId, apiProject);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    required TResult orElse(),
  }) {
    if (bindProjectFromApi != null) {
      return bindProjectFromApi(tempId, apiProject);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return bindProjectFromApi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return bindProjectFromApi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (bindProjectFromApi != null) {
      return bindProjectFromApi(this);
    }
    return orElse();
  }
}

abstract class _BindProjectFromApi implements TechEvent {
  const factory _BindProjectFromApi(
      {required final String tempId,
      required final ProjectResponse apiProject}) = _$BindProjectFromApiImpl;

  String get tempId;
  ProjectResponse get apiProject;
  @JsonKey(ignore: true)
  _$$BindProjectFromApiImplCopyWith<_$BindProjectFromApiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveProjectImplCopyWith<$Res> {
  factory _$$RemoveProjectImplCopyWith(
          _$RemoveProjectImpl value, $Res Function(_$RemoveProjectImpl) then) =
      __$$RemoveProjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tempId});
}

/// @nodoc
class __$$RemoveProjectImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$RemoveProjectImpl>
    implements _$$RemoveProjectImplCopyWith<$Res> {
  __$$RemoveProjectImplCopyWithImpl(
      _$RemoveProjectImpl _value, $Res Function(_$RemoveProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tempId = null,
  }) {
    return _then(_$RemoveProjectImpl(
      tempId: null == tempId
          ? _value.tempId
          : tempId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveProjectImpl implements _RemoveProject {
  const _$RemoveProjectImpl({required this.tempId});

  @override
  final String tempId;

  @override
  String toString() {
    return 'TechEvent.removeProject(tempId: $tempId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveProjectImpl &&
            (identical(other.tempId, tempId) || other.tempId == tempId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tempId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveProjectImplCopyWith<_$RemoveProjectImpl> get copyWith =>
      __$$RemoveProjectImplCopyWithImpl<_$RemoveProjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return removeProject(tempId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return removeProject?.call(tempId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    required TResult orElse(),
  }) {
    if (removeProject != null) {
      return removeProject(tempId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return removeProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return removeProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (removeProject != null) {
      return removeProject(this);
    }
    return orElse();
  }
}

abstract class _RemoveProject implements TechEvent {
  const factory _RemoveProject({required final String tempId}) =
      _$RemoveProjectImpl;

  String get tempId;
  @JsonKey(ignore: true)
  _$$RemoveProjectImplCopyWith<_$RemoveProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectProjectImplCopyWith<$Res> {
  factory _$$SelectProjectImplCopyWith(
          _$SelectProjectImpl value, $Res Function(_$SelectProjectImpl) then) =
      __$$SelectProjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tempId});
}

/// @nodoc
class __$$SelectProjectImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$SelectProjectImpl>
    implements _$$SelectProjectImplCopyWith<$Res> {
  __$$SelectProjectImplCopyWithImpl(
      _$SelectProjectImpl _value, $Res Function(_$SelectProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tempId = null,
  }) {
    return _then(_$SelectProjectImpl(
      tempId: null == tempId
          ? _value.tempId
          : tempId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectProjectImpl implements _SelectProject {
  const _$SelectProjectImpl({required this.tempId});

  @override
  final String tempId;

  @override
  String toString() {
    return 'TechEvent.selectProject(tempId: $tempId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectProjectImpl &&
            (identical(other.tempId, tempId) || other.tempId == tempId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tempId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectProjectImplCopyWith<_$SelectProjectImpl> get copyWith =>
      __$$SelectProjectImplCopyWithImpl<_$SelectProjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return selectProject(tempId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return selectProject?.call(tempId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    required TResult orElse(),
  }) {
    if (selectProject != null) {
      return selectProject(tempId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return selectProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return selectProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (selectProject != null) {
      return selectProject(this);
    }
    return orElse();
  }
}

abstract class _SelectProject implements TechEvent {
  const factory _SelectProject({required final String tempId}) =
      _$SelectProjectImpl;

  String get tempId;
  @JsonKey(ignore: true)
  _$$SelectProjectImplCopyWith<_$SelectProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProjectNameImplCopyWith<$Res> {
  factory _$$UpdateProjectNameImplCopyWith(_$UpdateProjectNameImpl value,
          $Res Function(_$UpdateProjectNameImpl) then) =
      __$$UpdateProjectNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tempId, String newName});
}

/// @nodoc
class __$$UpdateProjectNameImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$UpdateProjectNameImpl>
    implements _$$UpdateProjectNameImplCopyWith<$Res> {
  __$$UpdateProjectNameImplCopyWithImpl(_$UpdateProjectNameImpl _value,
      $Res Function(_$UpdateProjectNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tempId = null,
    Object? newName = null,
  }) {
    return _then(_$UpdateProjectNameImpl(
      tempId: null == tempId
          ? _value.tempId
          : tempId // ignore: cast_nullable_to_non_nullable
              as String,
      newName: null == newName
          ? _value.newName
          : newName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateProjectNameImpl implements _UpdateProjectName {
  const _$UpdateProjectNameImpl({required this.tempId, required this.newName});

  @override
  final String tempId;
  @override
  final String newName;

  @override
  String toString() {
    return 'TechEvent.updateProjectName(tempId: $tempId, newName: $newName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProjectNameImpl &&
            (identical(other.tempId, tempId) || other.tempId == tempId) &&
            (identical(other.newName, newName) || other.newName == newName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tempId, newName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProjectNameImplCopyWith<_$UpdateProjectNameImpl> get copyWith =>
      __$$UpdateProjectNameImplCopyWithImpl<_$UpdateProjectNameImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return updateProjectName(tempId, newName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return updateProjectName?.call(tempId, newName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    required TResult orElse(),
  }) {
    if (updateProjectName != null) {
      return updateProjectName(tempId, newName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return updateProjectName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return updateProjectName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (updateProjectName != null) {
      return updateProjectName(this);
    }
    return orElse();
  }
}

abstract class _UpdateProjectName implements TechEvent {
  const factory _UpdateProjectName(
      {required final String tempId,
      required final String newName}) = _$UpdateProjectNameImpl;

  String get tempId;
  String get newName;
  @JsonKey(ignore: true)
  _$$UpdateProjectNameImplCopyWith<_$UpdateProjectNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddWorkImplCopyWith<$Res> {
  factory _$$AddWorkImplCopyWith(
          _$AddWorkImpl value, $Res Function(_$AddWorkImpl) then) =
      __$$AddWorkImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddWorkImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$AddWorkImpl>
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
    return 'TechEvent.addWork()';
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
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return addWork();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return addWork?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return addWork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return addWork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (addWork != null) {
      return addWork(this);
    }
    return orElse();
  }
}

abstract class _AddWork implements TechEvent {
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
    extends _$TechEventCopyWithImpl<$Res, _$RemoveWorkImpl>
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
    return 'TechEvent.removeWork(index: $index)';
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
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return removeWork(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return removeWork?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return removeWork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return removeWork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (removeWork != null) {
      return removeWork(this);
    }
    return orElse();
  }
}

abstract class _RemoveWork implements TechEvent {
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
    extends _$TechEventCopyWithImpl<$Res, _$ExpandWorkImpl>
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
    return 'TechEvent.expandWork(index: $index)';
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
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return expandWork(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return expandWork?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return expandWork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return expandWork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (expandWork != null) {
      return expandWork(this);
    }
    return orElse();
  }
}

abstract class _ExpandWork implements TechEvent {
  const factory _ExpandWork({required final int index}) = _$ExpandWorkImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$ExpandWorkImplCopyWith<_$ExpandWorkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateWorkImplCopyWith<$Res> {
  factory _$$UpdateWorkImplCopyWith(
          _$UpdateWorkImpl value, $Res Function(_$UpdateWorkImpl) then) =
      __$$UpdateWorkImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int index,
      double? totalHours,
      double? totalHourOT,
      double? percentComplete,
      String? content,
      String? results,
      String? mission,
      int? projectItemId,
      String? code,
      String? backlog,
      String? problem,
      String? problemSolve,
      String? note,
      String? location});
}

/// @nodoc
class __$$UpdateWorkImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$UpdateWorkImpl>
    implements _$$UpdateWorkImplCopyWith<$Res> {
  __$$UpdateWorkImplCopyWithImpl(
      _$UpdateWorkImpl _value, $Res Function(_$UpdateWorkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? totalHours = freezed,
    Object? totalHourOT = freezed,
    Object? percentComplete = freezed,
    Object? content = freezed,
    Object? results = freezed,
    Object? mission = freezed,
    Object? projectItemId = freezed,
    Object? code = freezed,
    Object? backlog = freezed,
    Object? problem = freezed,
    Object? problemSolve = freezed,
    Object? note = freezed,
    Object? location = freezed,
  }) {
    return _then(_$UpdateWorkImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      totalHours: freezed == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double?,
      totalHourOT: freezed == totalHourOT
          ? _value.totalHourOT
          : totalHourOT // ignore: cast_nullable_to_non_nullable
              as double?,
      percentComplete: freezed == percentComplete
          ? _value.percentComplete
          : percentComplete // ignore: cast_nullable_to_non_nullable
              as double?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String?,
      mission: freezed == mission
          ? _value.mission
          : mission // ignore: cast_nullable_to_non_nullable
              as String?,
      projectItemId: freezed == projectItemId
          ? _value.projectItemId
          : projectItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      backlog: freezed == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String?,
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String?,
      problemSolve: freezed == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateWorkImpl implements _UpdateWork {
  const _$UpdateWorkImpl(
      {required this.index,
      this.totalHours,
      this.totalHourOT,
      this.percentComplete,
      this.content,
      this.results,
      this.mission,
      this.projectItemId,
      this.code,
      this.backlog,
      this.problem,
      this.problemSolve,
      this.note,
      this.location});

  @override
  final int index;
  @override
  final double? totalHours;
  @override
  final double? totalHourOT;
  @override
  final double? percentComplete;
  @override
  final String? content;
  @override
  final String? results;
  @override
  final String? mission;
  @override
  final int? projectItemId;
  @override
  final String? code;
  @override
  final String? backlog;
  @override
  final String? problem;
  @override
  final String? problemSolve;
  @override
  final String? note;
  @override
  final String? location;

  @override
  String toString() {
    return 'TechEvent.updateWork(index: $index, totalHours: $totalHours, totalHourOT: $totalHourOT, percentComplete: $percentComplete, content: $content, results: $results, mission: $mission, projectItemId: $projectItemId, code: $code, backlog: $backlog, problem: $problem, problemSolve: $problemSolve, note: $note, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateWorkImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours) &&
            (identical(other.totalHourOT, totalHourOT) ||
                other.totalHourOT == totalHourOT) &&
            (identical(other.percentComplete, percentComplete) ||
                other.percentComplete == percentComplete) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.mission, mission) || other.mission == mission) &&
            (identical(other.projectItemId, projectItemId) ||
                other.projectItemId == projectItemId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.backlog, backlog) || other.backlog == backlog) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.problemSolve, problemSolve) ||
                other.problemSolve == problemSolve) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      index,
      totalHours,
      totalHourOT,
      percentComplete,
      content,
      results,
      mission,
      projectItemId,
      code,
      backlog,
      problem,
      problemSolve,
      note,
      location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateWorkImplCopyWith<_$UpdateWorkImpl> get copyWith =>
      __$$UpdateWorkImplCopyWithImpl<_$UpdateWorkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return updateWork(
        index,
        totalHours,
        totalHourOT,
        percentComplete,
        content,
        results,
        mission,
        projectItemId,
        code,
        backlog,
        problem,
        problemSolve,
        note,
        location);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return updateWork?.call(
        index,
        totalHours,
        totalHourOT,
        percentComplete,
        content,
        results,
        mission,
        projectItemId,
        code,
        backlog,
        problem,
        problemSolve,
        note,
        location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    required TResult orElse(),
  }) {
    if (updateWork != null) {
      return updateWork(
          index,
          totalHours,
          totalHourOT,
          percentComplete,
          content,
          results,
          mission,
          projectItemId,
          code,
          backlog,
          problem,
          problemSolve,
          note,
          location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return updateWork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return updateWork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (updateWork != null) {
      return updateWork(this);
    }
    return orElse();
  }
}

abstract class _UpdateWork implements TechEvent {
  const factory _UpdateWork(
      {required final int index,
      final double? totalHours,
      final double? totalHourOT,
      final double? percentComplete,
      final String? content,
      final String? results,
      final String? mission,
      final int? projectItemId,
      final String? code,
      final String? backlog,
      final String? problem,
      final String? problemSolve,
      final String? note,
      final String? location}) = _$UpdateWorkImpl;

  int get index;
  double? get totalHours;
  double? get totalHourOT;
  double? get percentComplete;
  String? get content;
  String? get results;
  String? get mission;
  int? get projectItemId;
  String? get code;
  String? get backlog;
  String? get problem;
  String? get problemSolve;
  String? get note;
  String? get location;
  @JsonKey(ignore: true)
  _$$UpdateWorkImplCopyWith<_$UpdateWorkImpl> get copyWith =>
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
    extends _$TechEventCopyWithImpl<$Res, _$UpdateDateImpl>
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
    return 'TechEvent.updateDate(picked: $picked)';
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
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return updateDate(picked);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return updateDate?.call(picked);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return updateDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return updateDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (updateDate != null) {
      return updateDate(this);
    }
    return orElse();
  }
}

abstract class _UpdateDate implements TechEvent {
  const factory _UpdateDate(final DateTime? picked) = _$UpdateDateImpl;

  DateTime? get picked;
  @JsonKey(ignore: true)
  _$$UpdateDateImplCopyWith<_$UpdateDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateLocationImplCopyWith<$Res> {
  factory _$$UpdateLocationImplCopyWith(_$UpdateLocationImpl value,
          $Res Function(_$UpdateLocationImpl) then) =
      __$$UpdateLocationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String type, String? value});
}

/// @nodoc
class __$$UpdateLocationImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$UpdateLocationImpl>
    implements _$$UpdateLocationImplCopyWith<$Res> {
  __$$UpdateLocationImplCopyWithImpl(
      _$UpdateLocationImpl _value, $Res Function(_$UpdateLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = freezed,
  }) {
    return _then(_$UpdateLocationImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateLocationImpl implements _UpdateLocation {
  const _$UpdateLocationImpl({required this.type, this.value});

  @override
  final String type;
  @override
  final String? value;

  @override
  String toString() {
    return 'TechEvent.updateLocation(type: $type, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateLocationImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateLocationImplCopyWith<_$UpdateLocationImpl> get copyWith =>
      __$$UpdateLocationImplCopyWithImpl<_$UpdateLocationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return updateLocation(type, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return updateLocation?.call(type, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    required TResult orElse(),
  }) {
    if (updateLocation != null) {
      return updateLocation(type, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return updateLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return updateLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (updateLocation != null) {
      return updateLocation(this);
    }
    return orElse();
  }
}

abstract class _UpdateLocation implements TechEvent {
  const factory _UpdateLocation(
      {required final String type, final String? value}) = _$UpdateLocationImpl;

  String get type;
  String? get value;
  @JsonKey(ignore: true)
  _$$UpdateLocationImplCopyWith<_$UpdateLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePlanNextDayImplCopyWith<$Res> {
  factory _$$UpdatePlanNextDayImplCopyWith(_$UpdatePlanNextDayImpl value,
          $Res Function(_$UpdatePlanNextDayImpl) then) =
      __$$UpdatePlanNextDayImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UpdatePlanNextDayImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$UpdatePlanNextDayImpl>
    implements _$$UpdatePlanNextDayImplCopyWith<$Res> {
  __$$UpdatePlanNextDayImplCopyWithImpl(_$UpdatePlanNextDayImpl _value,
      $Res Function(_$UpdatePlanNextDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UpdatePlanNextDayImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatePlanNextDayImpl implements _UpdatePlanNextDay {
  const _$UpdatePlanNextDayImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'TechEvent.updatePlanNextDay(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePlanNextDayImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePlanNextDayImplCopyWith<_$UpdatePlanNextDayImpl> get copyWith =>
      __$$UpdatePlanNextDayImplCopyWithImpl<_$UpdatePlanNextDayImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return updatePlanNextDay(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return updatePlanNextDay?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    required TResult orElse(),
  }) {
    if (updatePlanNextDay != null) {
      return updatePlanNextDay(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return updatePlanNextDay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return updatePlanNextDay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (updatePlanNextDay != null) {
      return updatePlanNextDay(this);
    }
    return orElse();
  }
}

abstract class _UpdatePlanNextDay implements TechEvent {
  const factory _UpdatePlanNextDay(final String value) =
      _$UpdatePlanNextDayImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$UpdatePlanNextDayImplCopyWith<_$UpdatePlanNextDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateExtraInfoImplCopyWith<$Res> {
  factory _$$UpdateExtraInfoImplCopyWith(_$UpdateExtraInfoImpl value,
          $Res Function(_$UpdateExtraInfoImpl) then) =
      __$$UpdateExtraInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? problem, String? problemSolve, String? backlog, String? note});
}

/// @nodoc
class __$$UpdateExtraInfoImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$UpdateExtraInfoImpl>
    implements _$$UpdateExtraInfoImplCopyWith<$Res> {
  __$$UpdateExtraInfoImplCopyWithImpl(
      _$UpdateExtraInfoImpl _value, $Res Function(_$UpdateExtraInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problem = freezed,
    Object? problemSolve = freezed,
    Object? backlog = freezed,
    Object? note = freezed,
  }) {
    return _then(_$UpdateExtraInfoImpl(
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String?,
      problemSolve: freezed == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String?,
      backlog: freezed == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateExtraInfoImpl implements _UpdateExtraInfo {
  const _$UpdateExtraInfoImpl(
      {this.problem, this.problemSolve, this.backlog, this.note});

  @override
  final String? problem;
  @override
  final String? problemSolve;
  @override
  final String? backlog;
  @override
  final String? note;

  @override
  String toString() {
    return 'TechEvent.updateExtraInfo(problem: $problem, problemSolve: $problemSolve, backlog: $backlog, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateExtraInfoImpl &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.problemSolve, problemSolve) ||
                other.problemSolve == problemSolve) &&
            (identical(other.backlog, backlog) || other.backlog == backlog) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, problem, problemSolve, backlog, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateExtraInfoImplCopyWith<_$UpdateExtraInfoImpl> get copyWith =>
      __$$UpdateExtraInfoImplCopyWithImpl<_$UpdateExtraInfoImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return updateExtraInfo(problem, problemSolve, backlog, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return updateExtraInfo?.call(problem, problemSolve, backlog, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    required TResult orElse(),
  }) {
    if (updateExtraInfo != null) {
      return updateExtraInfo(problem, problemSolve, backlog, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return updateExtraInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return updateExtraInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (updateExtraInfo != null) {
      return updateExtraInfo(this);
    }
    return orElse();
  }
}

abstract class _UpdateExtraInfo implements TechEvent {
  const factory _UpdateExtraInfo(
      {final String? problem,
      final String? problemSolve,
      final String? backlog,
      final String? note}) = _$UpdateExtraInfoImpl;

  String? get problem;
  String? get problemSolve;
  String? get backlog;
  String? get note;
  @JsonKey(ignore: true)
  _$$UpdateExtraInfoImplCopyWith<_$UpdateExtraInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$TechEventCopyWithImpl<$Res, _$SubmitReportWithDateImpl>
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
    return 'TechEvent.submitReport(pickedDate: $pickedDate)';
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
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return submitReport(pickedDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return submitReport?.call(pickedDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return submitReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return submitReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (submitReport != null) {
      return submitReport(this);
    }
    return orElse();
  }
}

abstract class _SubmitReportWithDate implements TechEvent {
  const factory _SubmitReportWithDate(final DateTime pickedDate) =
      _$SubmitReportWithDateImpl;

  DateTime get pickedDate;
  @JsonKey(ignore: true)
  _$$SubmitReportWithDateImplCopyWith<_$SubmitReportWithDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendMailReportImplCopyWith<$Res> {
  factory _$$SendMailReportImplCopyWith(_$SendMailReportImpl value,
          $Res Function(_$SendMailReportImpl) then) =
      __$$SendMailReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime pickedDate, BuildContext context});
}

/// @nodoc
class __$$SendMailReportImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$SendMailReportImpl>
    implements _$$SendMailReportImplCopyWith<$Res> {
  __$$SendMailReportImplCopyWithImpl(
      _$SendMailReportImpl _value, $Res Function(_$SendMailReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedDate = null,
    Object? context = null,
  }) {
    return _then(_$SendMailReportImpl(
      pickedDate: null == pickedDate
          ? _value.pickedDate
          : pickedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$SendMailReportImpl implements _SendMailReport {
  const _$SendMailReportImpl({required this.pickedDate, required this.context});

  @override
  final DateTime pickedDate;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'TechEvent.sendMailReport(pickedDate: $pickedDate, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMailReportImpl &&
            (identical(other.pickedDate, pickedDate) ||
                other.pickedDate == pickedDate) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pickedDate, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMailReportImplCopyWith<_$SendMailReportImpl> get copyWith =>
      __$$SendMailReportImplCopyWithImpl<_$SendMailReportImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return sendMailReport(pickedDate, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return sendMailReport?.call(pickedDate, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
    required TResult orElse(),
  }) {
    if (sendMailReport != null) {
      return sendMailReport(pickedDate, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return sendMailReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return sendMailReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (sendMailReport != null) {
      return sendMailReport(this);
    }
    return orElse();
  }
}

abstract class _SendMailReport implements TechEvent {
  const factory _SendMailReport(
      {required final DateTime pickedDate,
      required final BuildContext context}) = _$SendMailReportImpl;

  DateTime get pickedDate;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$SendMailReportImplCopyWith<_$SendMailReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetSubmitFlagsImplCopyWith<$Res> {
  factory _$$ResetSubmitFlagsImplCopyWith(_$ResetSubmitFlagsImpl value,
          $Res Function(_$ResetSubmitFlagsImpl) then) =
      __$$ResetSubmitFlagsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetSubmitFlagsImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$ResetSubmitFlagsImpl>
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
    return 'TechEvent.resetSubmitFlags()';
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
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return resetSubmitFlags();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return resetSubmitFlags?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return resetSubmitFlags(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return resetSubmitFlags?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (resetSubmitFlags != null) {
      return resetSubmitFlags(this);
    }
    return orElse();
  }
}

abstract class _ResetSubmitFlags implements TechEvent {
  const factory _ResetSubmitFlags() = _$ResetSubmitFlagsImpl;
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
    extends _$TechEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
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
    return 'TechEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
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
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements TechEvent {
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
abstract class _$$SelectReportImplCopyWith<$Res> {
  factory _$$SelectReportImplCopyWith(
          _$SelectReportImpl value, $Res Function(_$SelectReportImpl) then) =
      __$$SelectReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int dailyID});
}

/// @nodoc
class __$$SelectReportImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$SelectReportImpl>
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
    return 'TechEvent.selectReport(dailyID: $dailyID)';
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
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return selectReport(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return selectReport?.call(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return selectReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return selectReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (selectReport != null) {
      return selectReport(this);
    }
    return orElse();
  }
}

abstract class _SelectReport implements TechEvent {
  const factory _SelectReport({required final int dailyID}) =
      _$SelectReportImpl;

  int get dailyID;
  @JsonKey(ignore: true)
  _$$SelectReportImplCopyWith<_$SelectReportImpl> get copyWith =>
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
    extends _$TechEventCopyWithImpl<$Res, _$LoadDetailDataImpl>
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
    return 'TechEvent.loadDetailData(dailyID: $dailyID)';
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
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return loadDetailData(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return loadDetailData?.call(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return loadDetailData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return loadDetailData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (loadDetailData != null) {
      return loadDetailData(this);
    }
    return orElse();
  }
}

abstract class _LoadDetailData implements TechEvent {
  const factory _LoadDetailData({required final int dailyID}) =
      _$LoadDetailDataImpl;

  int get dailyID;
  @JsonKey(ignore: true)
  _$$LoadDetailDataImplCopyWith<_$LoadDetailDataImpl> get copyWith =>
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
    extends _$TechEventCopyWithImpl<$Res, _$SubmitEditReportWithDateImpl>
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
    return 'TechEvent.submitEditReport(pickedDate: $pickedDate, dailyID: $dailyID)';
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
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return submitEditReport(pickedDate, dailyID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return submitEditReport?.call(pickedDate, dailyID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return submitEditReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return submitEditReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (submitEditReport != null) {
      return submitEditReport(this);
    }
    return orElse();
  }
}

abstract class _SubmitEditReportWithDate implements TechEvent {
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
abstract class _$$DeleteReportImplCopyWith<$Res> {
  factory _$$DeleteReportImplCopyWith(
          _$DeleteReportImpl value, $Res Function(_$DeleteReportImpl) then) =
      __$$DeleteReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int dailyID});
}

/// @nodoc
class __$$DeleteReportImplCopyWithImpl<$Res>
    extends _$TechEventCopyWithImpl<$Res, _$DeleteReportImpl>
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
    return 'TechEvent.deleteReport(dailyID: $dailyID)';
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
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return deleteReport(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return deleteReport?.call(dailyID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return deleteReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return deleteReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (deleteReport != null) {
      return deleteReport(this);
    }
    return orElse();
  }
}

abstract class _DeleteReport implements TechEvent {
  const factory _DeleteReport(final int dailyID) = _$DeleteReportImpl;

  int get dailyID;
  @JsonKey(ignore: true)
  _$$DeleteReportImplCopyWith<_$DeleteReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$TechEventCopyWithImpl<$Res, _$CopyReportImpl>
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
    return 'TechEvent.copyReport(dateStart: $dateStart, dateEnd: $dateEnd, keyword: $keyword, teamId: $teamId, userId: $userId, departmentId: $departmentId)';
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
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return copyReport(
        dateStart, dateEnd, keyword, teamId, userId, departmentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return copyReport?.call(
        dateStart, dateEnd, keyword, teamId, userId, departmentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return copyReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return copyReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (copyReport != null) {
      return copyReport(this);
    }
    return orElse();
  }
}

abstract class _CopyReport implements TechEvent {
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
    extends _$TechEventCopyWithImpl<$Res, _$ResetCopyImpl>
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
    return 'TechEvent.resetCopyReport()';
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
    required TResult Function() init,
    required TResult Function() addEmptyProject,
    required TResult Function(String tempId, ProjectResponse apiProject)
        bindProjectFromApi,
    required TResult Function(String tempId) removeProject,
    required TResult Function(String tempId) selectProject,
    required TResult Function(String tempId, String newName) updateProjectName,
    required TResult Function() addWork,
    required TResult Function(int index) removeWork,
    required TResult Function(int index) expandWork,
    required TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)
        updateWork,
    required TResult Function(DateTime? picked) updateDate,
    required TResult Function(String type, String? value) updateLocation,
    required TResult Function(String value) updatePlanNextDay,
    required TResult Function(String? problem, String? problemSolve,
            String? backlog, String? note)
        updateExtraInfo,
    required TResult Function(DateTime pickedDate) submitReport,
    required TResult Function(DateTime pickedDate, BuildContext context)
        sendMailReport,
    required TResult Function() resetSubmitFlags,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int dailyID) selectReport,
    required TResult Function(int dailyID) loadDetailData,
    required TResult Function(DateTime pickedDate, int dailyID)
        submitEditReport,
    required TResult Function(int dailyID) deleteReport,
    required TResult Function(DateTime dateStart, DateTime dateEnd,
            String keyword, int teamId, int userId, int departmentId)
        copyReport,
    required TResult Function() resetCopyReport,
  }) {
    return resetCopyReport();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmptyProject,
    TResult? Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult? Function(String tempId)? removeProject,
    TResult? Function(String tempId)? selectProject,
    TResult? Function(String tempId, String newName)? updateProjectName,
    TResult? Function()? addWork,
    TResult? Function(int index)? removeWork,
    TResult? Function(int index)? expandWork,
    TResult? Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult? Function(DateTime? picked)? updateDate,
    TResult? Function(String type, String? value)? updateLocation,
    TResult? Function(String value)? updatePlanNextDay,
    TResult? Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult? Function(DateTime pickedDate)? submitReport,
    TResult? Function(DateTime pickedDate, BuildContext context)?
        sendMailReport,
    TResult? Function()? resetSubmitFlags,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int dailyID)? selectReport,
    TResult? Function(int dailyID)? loadDetailData,
    TResult? Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult? Function(int dailyID)? deleteReport,
    TResult? Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult? Function()? resetCopyReport,
  }) {
    return resetCopyReport?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmptyProject,
    TResult Function(String tempId, ProjectResponse apiProject)?
        bindProjectFromApi,
    TResult Function(String tempId)? removeProject,
    TResult Function(String tempId)? selectProject,
    TResult Function(String tempId, String newName)? updateProjectName,
    TResult Function()? addWork,
    TResult Function(int index)? removeWork,
    TResult Function(int index)? expandWork,
    TResult Function(
            int index,
            double? totalHours,
            double? totalHourOT,
            double? percentComplete,
            String? content,
            String? results,
            String? mission,
            int? projectItemId,
            String? code,
            String? backlog,
            String? problem,
            String? problemSolve,
            String? note,
            String? location)?
        updateWork,
    TResult Function(DateTime? picked)? updateDate,
    TResult Function(String type, String? value)? updateLocation,
    TResult Function(String value)? updatePlanNextDay,
    TResult Function(String? problem, String? problemSolve, String? backlog,
            String? note)?
        updateExtraInfo,
    TResult Function(DateTime pickedDate)? submitReport,
    TResult Function(DateTime pickedDate, BuildContext context)? sendMailReport,
    TResult Function()? resetSubmitFlags,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int dailyID)? selectReport,
    TResult Function(int dailyID)? loadDetailData,
    TResult Function(DateTime pickedDate, int dailyID)? submitEditReport,
    TResult Function(int dailyID)? deleteReport,
    TResult Function(DateTime dateStart, DateTime dateEnd, String keyword,
            int teamId, int userId, int departmentId)?
        copyReport,
    TResult Function()? resetCopyReport,
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
    required TResult Function(_Init value) init,
    required TResult Function(_AddEmptyProject value) addEmptyProject,
    required TResult Function(_BindProjectFromApi value) bindProjectFromApi,
    required TResult Function(_RemoveProject value) removeProject,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_UpdateProjectName value) updateProjectName,
    required TResult Function(_AddWork value) addWork,
    required TResult Function(_RemoveWork value) removeWork,
    required TResult Function(_ExpandWork value) expandWork,
    required TResult Function(_UpdateWork value) updateWork,
    required TResult Function(_UpdateDate value) updateDate,
    required TResult Function(_UpdateLocation value) updateLocation,
    required TResult Function(_UpdatePlanNextDay value) updatePlanNextDay,
    required TResult Function(_UpdateExtraInfo value) updateExtraInfo,
    required TResult Function(_SubmitReportWithDate value) submitReport,
    required TResult Function(_SendMailReport value) sendMailReport,
    required TResult Function(_ResetSubmitFlags value) resetSubmitFlags,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_SelectReport value) selectReport,
    required TResult Function(_LoadDetailData value) loadDetailData,
    required TResult Function(_SubmitEditReportWithDate value) submitEditReport,
    required TResult Function(_DeleteReport value) deleteReport,
    required TResult Function(_CopyReport value) copyReport,
    required TResult Function(_ResetCopy value) resetCopyReport,
  }) {
    return resetCopyReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_AddEmptyProject value)? addEmptyProject,
    TResult? Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult? Function(_RemoveProject value)? removeProject,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_UpdateProjectName value)? updateProjectName,
    TResult? Function(_AddWork value)? addWork,
    TResult? Function(_RemoveWork value)? removeWork,
    TResult? Function(_ExpandWork value)? expandWork,
    TResult? Function(_UpdateWork value)? updateWork,
    TResult? Function(_UpdateDate value)? updateDate,
    TResult? Function(_UpdateLocation value)? updateLocation,
    TResult? Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult? Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult? Function(_SubmitReportWithDate value)? submitReport,
    TResult? Function(_SendMailReport value)? sendMailReport,
    TResult? Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_SelectReport value)? selectReport,
    TResult? Function(_LoadDetailData value)? loadDetailData,
    TResult? Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult? Function(_DeleteReport value)? deleteReport,
    TResult? Function(_CopyReport value)? copyReport,
    TResult? Function(_ResetCopy value)? resetCopyReport,
  }) {
    return resetCopyReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_AddEmptyProject value)? addEmptyProject,
    TResult Function(_BindProjectFromApi value)? bindProjectFromApi,
    TResult Function(_RemoveProject value)? removeProject,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_UpdateProjectName value)? updateProjectName,
    TResult Function(_AddWork value)? addWork,
    TResult Function(_RemoveWork value)? removeWork,
    TResult Function(_ExpandWork value)? expandWork,
    TResult Function(_UpdateWork value)? updateWork,
    TResult Function(_UpdateDate value)? updateDate,
    TResult Function(_UpdateLocation value)? updateLocation,
    TResult Function(_UpdatePlanNextDay value)? updatePlanNextDay,
    TResult Function(_UpdateExtraInfo value)? updateExtraInfo,
    TResult Function(_SubmitReportWithDate value)? submitReport,
    TResult Function(_SendMailReport value)? sendMailReport,
    TResult Function(_ResetSubmitFlags value)? resetSubmitFlags,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_SelectReport value)? selectReport,
    TResult Function(_LoadDetailData value)? loadDetailData,
    TResult Function(_SubmitEditReportWithDate value)? submitEditReport,
    TResult Function(_DeleteReport value)? deleteReport,
    TResult Function(_CopyReport value)? copyReport,
    TResult Function(_ResetCopy value)? resetCopyReport,
    required TResult orElse(),
  }) {
    if (resetCopyReport != null) {
      return resetCopyReport(this);
    }
    return orElse();
  }
}

abstract class _ResetCopy implements TechEvent {
  const factory _ResetCopy() = _$ResetCopyImpl;
}
