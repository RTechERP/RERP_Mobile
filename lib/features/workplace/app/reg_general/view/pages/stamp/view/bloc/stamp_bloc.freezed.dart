// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stamp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StampEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StampEventCopyWith<$Res> {
  factory $StampEventCopyWith(
          StampEvent value, $Res Function(StampEvent) then) =
      _$StampEventCopyWithImpl<$Res, StampEvent>;
}

/// @nodoc
class _$StampEventCopyWithImpl<$Res, $Val extends StampEvent>
    implements $StampEventCopyWith<$Res> {
  _$StampEventCopyWithImpl(this._value, this._then);

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
    extends _$StampEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'StampEvent.init()';
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
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
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
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements StampEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$InitAddImplCopyWith<$Res> {
  factory _$$InitAddImplCopyWith(
          _$InitAddImpl value, $Res Function(_$InitAddImpl) then) =
      __$$InitAddImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitAddImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$InitAddImpl>
    implements _$$InitAddImplCopyWith<$Res> {
  __$$InitAddImplCopyWithImpl(
      _$InitAddImpl _value, $Res Function(_$InitAddImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitAddImpl implements _InitAdd {
  const _$InitAddImpl();

  @override
  String toString() {
    return 'StampEvent.initAdd()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitAddImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return initAdd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return initAdd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (initAdd != null) {
      return initAdd();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return initAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return initAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (initAdd != null) {
      return initAdd(this);
    }
    return orElse();
  }
}

abstract class _InitAdd implements StampEvent {
  const factory _InitAdd() = _$InitAddImpl;
}

/// @nodoc
abstract class _$$InitDetailImplCopyWith<$Res> {
  factory _$$InitDetailImplCopyWith(
          _$InitDetailImpl value, $Res Function(_$InitDetailImpl) then) =
      __$$InitDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$InitDetailImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$InitDetailImpl>
    implements _$$InitDetailImplCopyWith<$Res> {
  __$$InitDetailImplCopyWithImpl(
      _$InitDetailImpl _value, $Res Function(_$InitDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$InitDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitDetailImpl implements _InitDetail {
  const _$InitDetailImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'StampEvent.initDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitDetailImplCopyWith<_$InitDetailImpl> get copyWith =>
      __$$InitDetailImplCopyWithImpl<_$InitDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return initDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return initDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (initDetail != null) {
      return initDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return initDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return initDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (initDetail != null) {
      return initDetail(this);
    }
    return orElse();
  }
}

abstract class _InitDetail implements StampEvent {
  const factory _InitDetail({required final int id}) = _$InitDetailImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$InitDetailImplCopyWith<_$InitDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitEditImplCopyWith<$Res> {
  factory _$$InitEditImplCopyWith(
          _$InitEditImpl value, $Res Function(_$InitEditImpl) then) =
      __$$InitEditImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$InitEditImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$InitEditImpl>
    implements _$$InitEditImplCopyWith<$Res> {
  __$$InitEditImplCopyWithImpl(
      _$InitEditImpl _value, $Res Function(_$InitEditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$InitEditImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitEditImpl implements _InitEdit {
  const _$InitEditImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'StampEvent.initEdit(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitEditImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitEditImplCopyWith<_$InitEditImpl> get copyWith =>
      __$$InitEditImplCopyWithImpl<_$InitEditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return initEdit(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return initEdit?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (initEdit != null) {
      return initEdit(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return initEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return initEdit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (initEdit != null) {
      return initEdit(this);
    }
    return orElse();
  }
}

abstract class _InitEdit implements StampEvent {
  const factory _InitEdit({required final int id}) = _$InitEditImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$InitEditImplCopyWith<_$InitEditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HydrateEditPayloadImplCopyWith<$Res> {
  factory _$$HydrateEditPayloadImplCopyWith(_$HydrateEditPayloadImpl value,
          $Res Function(_$HydrateEditPayloadImpl) then) =
      __$$HydrateEditPayloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {StampItem? item,
      StampDetailItem? detail,
      List<AssignerStampItem> employees,
      List<SealItem> sealRegulations,
      List<DocumentStampItem> documentTypes,
      List<CompanyStampItem> taxCompanies});

  $StampItemCopyWith<$Res>? get item;
  $StampDetailItemCopyWith<$Res>? get detail;
}

/// @nodoc
class __$$HydrateEditPayloadImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$HydrateEditPayloadImpl>
    implements _$$HydrateEditPayloadImplCopyWith<$Res> {
  __$$HydrateEditPayloadImplCopyWithImpl(_$HydrateEditPayloadImpl _value,
      $Res Function(_$HydrateEditPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = freezed,
    Object? detail = freezed,
    Object? employees = null,
    Object? sealRegulations = null,
    Object? documentTypes = null,
    Object? taxCompanies = null,
  }) {
    return _then(_$HydrateEditPayloadImpl(
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as StampItem?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as StampDetailItem?,
      employees: null == employees
          ? _value._employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<AssignerStampItem>,
      sealRegulations: null == sealRegulations
          ? _value._sealRegulations
          : sealRegulations // ignore: cast_nullable_to_non_nullable
              as List<SealItem>,
      documentTypes: null == documentTypes
          ? _value._documentTypes
          : documentTypes // ignore: cast_nullable_to_non_nullable
              as List<DocumentStampItem>,
      taxCompanies: null == taxCompanies
          ? _value._taxCompanies
          : taxCompanies // ignore: cast_nullable_to_non_nullable
              as List<CompanyStampItem>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StampItemCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $StampItemCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StampDetailItemCopyWith<$Res>? get detail {
    if (_value.detail == null) {
      return null;
    }

    return $StampDetailItemCopyWith<$Res>(_value.detail!, (value) {
      return _then(_value.copyWith(detail: value));
    });
  }
}

/// @nodoc

class _$HydrateEditPayloadImpl implements _HydrateEditPayload {
  const _$HydrateEditPayloadImpl(
      {this.item,
      this.detail,
      final List<AssignerStampItem> employees = const <AssignerStampItem>[],
      final List<SealItem> sealRegulations = const <SealItem>[],
      final List<DocumentStampItem> documentTypes = const <DocumentStampItem>[],
      final List<CompanyStampItem> taxCompanies = const <CompanyStampItem>[]})
      : _employees = employees,
        _sealRegulations = sealRegulations,
        _documentTypes = documentTypes,
        _taxCompanies = taxCompanies;

  @override
  final StampItem? item;
  @override
  final StampDetailItem? detail;
  final List<AssignerStampItem> _employees;
  @override
  @JsonKey()
  List<AssignerStampItem> get employees {
    if (_employees is EqualUnmodifiableListView) return _employees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_employees);
  }

  final List<SealItem> _sealRegulations;
  @override
  @JsonKey()
  List<SealItem> get sealRegulations {
    if (_sealRegulations is EqualUnmodifiableListView) return _sealRegulations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sealRegulations);
  }

  final List<DocumentStampItem> _documentTypes;
  @override
  @JsonKey()
  List<DocumentStampItem> get documentTypes {
    if (_documentTypes is EqualUnmodifiableListView) return _documentTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documentTypes);
  }

  final List<CompanyStampItem> _taxCompanies;
  @override
  @JsonKey()
  List<CompanyStampItem> get taxCompanies {
    if (_taxCompanies is EqualUnmodifiableListView) return _taxCompanies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taxCompanies);
  }

  @override
  String toString() {
    return 'StampEvent.hydrateEditPayload(item: $item, detail: $detail, employees: $employees, sealRegulations: $sealRegulations, documentTypes: $documentTypes, taxCompanies: $taxCompanies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HydrateEditPayloadImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            const DeepCollectionEquality()
                .equals(other._employees, _employees) &&
            const DeepCollectionEquality()
                .equals(other._sealRegulations, _sealRegulations) &&
            const DeepCollectionEquality()
                .equals(other._documentTypes, _documentTypes) &&
            const DeepCollectionEquality()
                .equals(other._taxCompanies, _taxCompanies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      item,
      detail,
      const DeepCollectionEquality().hash(_employees),
      const DeepCollectionEquality().hash(_sealRegulations),
      const DeepCollectionEquality().hash(_documentTypes),
      const DeepCollectionEquality().hash(_taxCompanies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HydrateEditPayloadImplCopyWith<_$HydrateEditPayloadImpl> get copyWith =>
      __$$HydrateEditPayloadImplCopyWithImpl<_$HydrateEditPayloadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return hydrateEditPayload(
        item, detail, employees, sealRegulations, documentTypes, taxCompanies);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return hydrateEditPayload?.call(
        item, detail, employees, sealRegulations, documentTypes, taxCompanies);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (hydrateEditPayload != null) {
      return hydrateEditPayload(item, detail, employees, sealRegulations,
          documentTypes, taxCompanies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return hydrateEditPayload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return hydrateEditPayload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (hydrateEditPayload != null) {
      return hydrateEditPayload(this);
    }
    return orElse();
  }
}

abstract class _HydrateEditPayload implements StampEvent {
  const factory _HydrateEditPayload(
      {final StampItem? item,
      final StampDetailItem? detail,
      final List<AssignerStampItem> employees,
      final List<SealItem> sealRegulations,
      final List<DocumentStampItem> documentTypes,
      final List<CompanyStampItem> taxCompanies}) = _$HydrateEditPayloadImpl;

  StampItem? get item;
  StampDetailItem? get detail;
  List<AssignerStampItem> get employees;
  List<SealItem> get sealRegulations;
  List<DocumentStampItem> get documentTypes;
  List<CompanyStampItem> get taxCompanies;
  @JsonKey(ignore: true)
  _$$HydrateEditPayloadImplCopyWith<_$HydrateEditPayloadImpl> get copyWith =>
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
    extends _$StampEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
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
    return 'StampEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
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
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
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
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements StampEvent {
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
abstract class _$$LoadFormOptionsImplCopyWith<$Res> {
  factory _$$LoadFormOptionsImplCopyWith(_$LoadFormOptionsImpl value,
          $Res Function(_$LoadFormOptionsImpl) then) =
      __$$LoadFormOptionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFormOptionsImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$LoadFormOptionsImpl>
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
    return 'StampEvent.loadFormOptions()';
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
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return loadFormOptions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return loadFormOptions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
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
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return loadFormOptions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return loadFormOptions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (loadFormOptions != null) {
      return loadFormOptions(this);
    }
    return orElse();
  }
}

abstract class _LoadFormOptions implements StampEvent {
  const factory _LoadFormOptions() = _$LoadFormOptionsImpl;
}

/// @nodoc
abstract class _$$ChangeRegisterDateImplCopyWith<$Res> {
  factory _$$ChangeRegisterDateImplCopyWith(_$ChangeRegisterDateImpl value,
          $Res Function(_$ChangeRegisterDateImpl) then) =
      __$$ChangeRegisterDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime registerDate});
}

/// @nodoc
class __$$ChangeRegisterDateImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$ChangeRegisterDateImpl>
    implements _$$ChangeRegisterDateImplCopyWith<$Res> {
  __$$ChangeRegisterDateImplCopyWithImpl(_$ChangeRegisterDateImpl _value,
      $Res Function(_$ChangeRegisterDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerDate = null,
  }) {
    return _then(_$ChangeRegisterDateImpl(
      null == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ChangeRegisterDateImpl implements _ChangeRegisterDate {
  const _$ChangeRegisterDateImpl(this.registerDate);

  @override
  final DateTime registerDate;

  @override
  String toString() {
    return 'StampEvent.changeRegisterDate(registerDate: $registerDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeRegisterDateImpl &&
            (identical(other.registerDate, registerDate) ||
                other.registerDate == registerDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, registerDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeRegisterDateImplCopyWith<_$ChangeRegisterDateImpl> get copyWith =>
      __$$ChangeRegisterDateImplCopyWithImpl<_$ChangeRegisterDateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return changeRegisterDate(registerDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return changeRegisterDate?.call(registerDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeRegisterDate != null) {
      return changeRegisterDate(registerDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return changeRegisterDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return changeRegisterDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeRegisterDate != null) {
      return changeRegisterDate(this);
    }
    return orElse();
  }
}

abstract class _ChangeRegisterDate implements StampEvent {
  const factory _ChangeRegisterDate(final DateTime registerDate) =
      _$ChangeRegisterDateImpl;

  DateTime get registerDate;
  @JsonKey(ignore: true)
  _$$ChangeRegisterDateImplCopyWith<_$ChangeRegisterDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeUrgentImplCopyWith<$Res> {
  factory _$$ChangeUrgentImplCopyWith(
          _$ChangeUrgentImpl value, $Res Function(_$ChangeUrgentImpl) then) =
      __$$ChangeUrgentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isUrgent});
}

/// @nodoc
class __$$ChangeUrgentImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$ChangeUrgentImpl>
    implements _$$ChangeUrgentImplCopyWith<$Res> {
  __$$ChangeUrgentImplCopyWithImpl(
      _$ChangeUrgentImpl _value, $Res Function(_$ChangeUrgentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUrgent = null,
  }) {
    return _then(_$ChangeUrgentImpl(
      null == isUrgent
          ? _value.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangeUrgentImpl implements _ChangeUrgent {
  const _$ChangeUrgentImpl(this.isUrgent);

  @override
  final bool isUrgent;

  @override
  String toString() {
    return 'StampEvent.changeUrgent(isUrgent: $isUrgent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeUrgentImpl &&
            (identical(other.isUrgent, isUrgent) ||
                other.isUrgent == isUrgent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isUrgent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeUrgentImplCopyWith<_$ChangeUrgentImpl> get copyWith =>
      __$$ChangeUrgentImplCopyWithImpl<_$ChangeUrgentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return changeUrgent(isUrgent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return changeUrgent?.call(isUrgent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeUrgent != null) {
      return changeUrgent(isUrgent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return changeUrgent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return changeUrgent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeUrgent != null) {
      return changeUrgent(this);
    }
    return orElse();
  }
}

abstract class _ChangeUrgent implements StampEvent {
  const factory _ChangeUrgent(final bool isUrgent) = _$ChangeUrgentImpl;

  bool get isUrgent;
  @JsonKey(ignore: true)
  _$$ChangeUrgentImplCopyWith<_$ChangeUrgentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDeadlineImplCopyWith<$Res> {
  factory _$$ChangeDeadlineImplCopyWith(_$ChangeDeadlineImpl value,
          $Res Function(_$ChangeDeadlineImpl) then) =
      __$$ChangeDeadlineImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? deadline});
}

/// @nodoc
class __$$ChangeDeadlineImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$ChangeDeadlineImpl>
    implements _$$ChangeDeadlineImplCopyWith<$Res> {
  __$$ChangeDeadlineImplCopyWithImpl(
      _$ChangeDeadlineImpl _value, $Res Function(_$ChangeDeadlineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deadline = freezed,
  }) {
    return _then(_$ChangeDeadlineImpl(
      freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ChangeDeadlineImpl implements _ChangeDeadline {
  const _$ChangeDeadlineImpl(this.deadline);

  @override
  final DateTime? deadline;

  @override
  String toString() {
    return 'StampEvent.changeDeadline(deadline: $deadline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDeadlineImpl &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deadline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDeadlineImplCopyWith<_$ChangeDeadlineImpl> get copyWith =>
      __$$ChangeDeadlineImplCopyWithImpl<_$ChangeDeadlineImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return changeDeadline(deadline);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return changeDeadline?.call(deadline);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeDeadline != null) {
      return changeDeadline(deadline);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return changeDeadline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return changeDeadline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeDeadline != null) {
      return changeDeadline(this);
    }
    return orElse();
  }
}

abstract class _ChangeDeadline implements StampEvent {
  const factory _ChangeDeadline(final DateTime? deadline) =
      _$ChangeDeadlineImpl;

  DateTime? get deadline;
  @JsonKey(ignore: true)
  _$$ChangeDeadlineImplCopyWith<_$ChangeDeadlineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDocumentTypeImplCopyWith<$Res> {
  factory _$$ChangeDocumentTypeImplCopyWith(_$ChangeDocumentTypeImpl value,
          $Res Function(_$ChangeDocumentTypeImpl) then) =
      __$$ChangeDocumentTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ChangeDocumentTypeImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$ChangeDocumentTypeImpl>
    implements _$$ChangeDocumentTypeImplCopyWith<$Res> {
  __$$ChangeDocumentTypeImplCopyWithImpl(_$ChangeDocumentTypeImpl _value,
      $Res Function(_$ChangeDocumentTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ChangeDocumentTypeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChangeDocumentTypeImpl implements _ChangeDocumentType {
  const _$ChangeDocumentTypeImpl({required this.id, this.name});

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'StampEvent.changeDocumentType(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDocumentTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDocumentTypeImplCopyWith<_$ChangeDocumentTypeImpl> get copyWith =>
      __$$ChangeDocumentTypeImplCopyWithImpl<_$ChangeDocumentTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return changeDocumentType(id, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return changeDocumentType?.call(id, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeDocumentType != null) {
      return changeDocumentType(id, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return changeDocumentType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return changeDocumentType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeDocumentType != null) {
      return changeDocumentType(this);
    }
    return orElse();
  }
}

abstract class _ChangeDocumentType implements StampEvent {
  const factory _ChangeDocumentType(
      {required final int? id, final String? name}) = _$ChangeDocumentTypeImpl;

  int? get id;
  String? get name;
  @JsonKey(ignore: true)
  _$$ChangeDocumentTypeImplCopyWith<_$ChangeDocumentTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDocumentNameImplCopyWith<$Res> {
  factory _$$ChangeDocumentNameImplCopyWith(_$ChangeDocumentNameImpl value,
          $Res Function(_$ChangeDocumentNameImpl) then) =
      __$$ChangeDocumentNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$ChangeDocumentNameImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$ChangeDocumentNameImpl>
    implements _$$ChangeDocumentNameImplCopyWith<$Res> {
  __$$ChangeDocumentNameImplCopyWithImpl(_$ChangeDocumentNameImpl _value,
      $Res Function(_$ChangeDocumentNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$ChangeDocumentNameImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeDocumentNameImpl implements _ChangeDocumentName {
  const _$ChangeDocumentNameImpl(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'StampEvent.changeDocumentName(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDocumentNameImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDocumentNameImplCopyWith<_$ChangeDocumentNameImpl> get copyWith =>
      __$$ChangeDocumentNameImplCopyWithImpl<_$ChangeDocumentNameImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return changeDocumentName(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return changeDocumentName?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeDocumentName != null) {
      return changeDocumentName(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return changeDocumentName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return changeDocumentName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeDocumentName != null) {
      return changeDocumentName(this);
    }
    return orElse();
  }
}

abstract class _ChangeDocumentName implements StampEvent {
  const factory _ChangeDocumentName(final String name) =
      _$ChangeDocumentNameImpl;

  String get name;
  @JsonKey(ignore: true)
  _$$ChangeDocumentNameImplCopyWith<_$ChangeDocumentNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDocumentQuantityImplCopyWith<$Res> {
  factory _$$ChangeDocumentQuantityImplCopyWith(
          _$ChangeDocumentQuantityImpl value,
          $Res Function(_$ChangeDocumentQuantityImpl) then) =
      __$$ChangeDocumentQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int quantity});
}

/// @nodoc
class __$$ChangeDocumentQuantityImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$ChangeDocumentQuantityImpl>
    implements _$$ChangeDocumentQuantityImplCopyWith<$Res> {
  __$$ChangeDocumentQuantityImplCopyWithImpl(
      _$ChangeDocumentQuantityImpl _value,
      $Res Function(_$ChangeDocumentQuantityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
  }) {
    return _then(_$ChangeDocumentQuantityImpl(
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeDocumentQuantityImpl implements _ChangeDocumentQuantity {
  const _$ChangeDocumentQuantityImpl(this.quantity);

  @override
  final int quantity;

  @override
  String toString() {
    return 'StampEvent.changeDocumentQuantity(quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDocumentQuantityImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDocumentQuantityImplCopyWith<_$ChangeDocumentQuantityImpl>
      get copyWith => __$$ChangeDocumentQuantityImplCopyWithImpl<
          _$ChangeDocumentQuantityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return changeDocumentQuantity(quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return changeDocumentQuantity?.call(quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeDocumentQuantity != null) {
      return changeDocumentQuantity(quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return changeDocumentQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return changeDocumentQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeDocumentQuantity != null) {
      return changeDocumentQuantity(this);
    }
    return orElse();
  }
}

abstract class _ChangeDocumentQuantity implements StampEvent {
  const factory _ChangeDocumentQuantity(final int quantity) =
      _$ChangeDocumentQuantityImpl;

  int get quantity;
  @JsonKey(ignore: true)
  _$$ChangeDocumentQuantityImplCopyWith<_$ChangeDocumentQuantityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDocumentTotalPageImplCopyWith<$Res> {
  factory _$$ChangeDocumentTotalPageImplCopyWith(
          _$ChangeDocumentTotalPageImpl value,
          $Res Function(_$ChangeDocumentTotalPageImpl) then) =
      __$$ChangeDocumentTotalPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int totalPage});
}

/// @nodoc
class __$$ChangeDocumentTotalPageImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$ChangeDocumentTotalPageImpl>
    implements _$$ChangeDocumentTotalPageImplCopyWith<$Res> {
  __$$ChangeDocumentTotalPageImplCopyWithImpl(
      _$ChangeDocumentTotalPageImpl _value,
      $Res Function(_$ChangeDocumentTotalPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPage = null,
  }) {
    return _then(_$ChangeDocumentTotalPageImpl(
      null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeDocumentTotalPageImpl implements _ChangeDocumentTotalPage {
  const _$ChangeDocumentTotalPageImpl(this.totalPage);

  @override
  final int totalPage;

  @override
  String toString() {
    return 'StampEvent.changeDocumentTotalPage(totalPage: $totalPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDocumentTotalPageImpl &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDocumentTotalPageImplCopyWith<_$ChangeDocumentTotalPageImpl>
      get copyWith => __$$ChangeDocumentTotalPageImplCopyWithImpl<
          _$ChangeDocumentTotalPageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return changeDocumentTotalPage(totalPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return changeDocumentTotalPage?.call(totalPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeDocumentTotalPage != null) {
      return changeDocumentTotalPage(totalPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return changeDocumentTotalPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return changeDocumentTotalPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeDocumentTotalPage != null) {
      return changeDocumentTotalPage(this);
    }
    return orElse();
  }
}

abstract class _ChangeDocumentTotalPage implements StampEvent {
  const factory _ChangeDocumentTotalPage(final int totalPage) =
      _$ChangeDocumentTotalPageImpl;

  int get totalPage;
  @JsonKey(ignore: true)
  _$$ChangeDocumentTotalPageImplCopyWith<_$ChangeDocumentTotalPageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeApprovedImplCopyWith<$Res> {
  factory _$$ChangeApprovedImplCopyWith(_$ChangeApprovedImpl value,
          $Res Function(_$ChangeApprovedImpl) then) =
      __$$ChangeApprovedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ChangeApprovedImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$ChangeApprovedImpl>
    implements _$$ChangeApprovedImplCopyWith<$Res> {
  __$$ChangeApprovedImplCopyWithImpl(
      _$ChangeApprovedImpl _value, $Res Function(_$ChangeApprovedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ChangeApprovedImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChangeApprovedImpl implements _ChangeApproved {
  const _$ChangeApprovedImpl({required this.id, this.name});

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'StampEvent.changeApproved(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeApprovedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeApprovedImplCopyWith<_$ChangeApprovedImpl> get copyWith =>
      __$$ChangeApprovedImplCopyWithImpl<_$ChangeApprovedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return changeApproved(id, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return changeApproved?.call(id, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeApproved != null) {
      return changeApproved(id, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return changeApproved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return changeApproved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeApproved != null) {
      return changeApproved(this);
    }
    return orElse();
  }
}

abstract class _ChangeApproved implements StampEvent {
  const factory _ChangeApproved({required final int? id, final String? name}) =
      _$ChangeApprovedImpl;

  int? get id;
  String? get name;
  @JsonKey(ignore: true)
  _$$ChangeApprovedImplCopyWith<_$ChangeApprovedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeEmployeeSignImplCopyWith<$Res> {
  factory _$$ChangeEmployeeSignImplCopyWith(_$ChangeEmployeeSignImpl value,
          $Res Function(_$ChangeEmployeeSignImpl) then) =
      __$$ChangeEmployeeSignImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ChangeEmployeeSignImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$ChangeEmployeeSignImpl>
    implements _$$ChangeEmployeeSignImplCopyWith<$Res> {
  __$$ChangeEmployeeSignImplCopyWithImpl(_$ChangeEmployeeSignImpl _value,
      $Res Function(_$ChangeEmployeeSignImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ChangeEmployeeSignImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChangeEmployeeSignImpl implements _ChangeEmployeeSign {
  const _$ChangeEmployeeSignImpl({required this.id, this.name});

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'StampEvent.changeEmployeeSign(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeEmployeeSignImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeEmployeeSignImplCopyWith<_$ChangeEmployeeSignImpl> get copyWith =>
      __$$ChangeEmployeeSignImplCopyWithImpl<_$ChangeEmployeeSignImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return changeEmployeeSign(id, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return changeEmployeeSign?.call(id, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeEmployeeSign != null) {
      return changeEmployeeSign(id, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return changeEmployeeSign(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return changeEmployeeSign?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeEmployeeSign != null) {
      return changeEmployeeSign(this);
    }
    return orElse();
  }
}

abstract class _ChangeEmployeeSign implements StampEvent {
  const factory _ChangeEmployeeSign(
      {required final int? id, final String? name}) = _$ChangeEmployeeSignImpl;

  int? get id;
  String? get name;
  @JsonKey(ignore: true)
  _$$ChangeEmployeeSignImplCopyWith<_$ChangeEmployeeSignImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeSealRegulationImplCopyWith<$Res> {
  factory _$$ChangeSealRegulationImplCopyWith(_$ChangeSealRegulationImpl value,
          $Res Function(_$ChangeSealRegulationImpl) then) =
      __$$ChangeSealRegulationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ChangeSealRegulationImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$ChangeSealRegulationImpl>
    implements _$$ChangeSealRegulationImplCopyWith<$Res> {
  __$$ChangeSealRegulationImplCopyWithImpl(_$ChangeSealRegulationImpl _value,
      $Res Function(_$ChangeSealRegulationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ChangeSealRegulationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChangeSealRegulationImpl implements _ChangeSealRegulation {
  const _$ChangeSealRegulationImpl({required this.id, this.name});

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'StampEvent.changeSealRegulation(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeSealRegulationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeSealRegulationImplCopyWith<_$ChangeSealRegulationImpl>
      get copyWith =>
          __$$ChangeSealRegulationImplCopyWithImpl<_$ChangeSealRegulationImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return changeSealRegulation(id, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return changeSealRegulation?.call(id, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeSealRegulation != null) {
      return changeSealRegulation(id, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return changeSealRegulation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return changeSealRegulation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeSealRegulation != null) {
      return changeSealRegulation(this);
    }
    return orElse();
  }
}

abstract class _ChangeSealRegulation implements StampEvent {
  const factory _ChangeSealRegulation(
      {required final int? id,
      final String? name}) = _$ChangeSealRegulationImpl;

  int? get id;
  String? get name;
  @JsonKey(ignore: true)
  _$$ChangeSealRegulationImplCopyWith<_$ChangeSealRegulationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeTaxCompanyImplCopyWith<$Res> {
  factory _$$ChangeTaxCompanyImplCopyWith(_$ChangeTaxCompanyImpl value,
          $Res Function(_$ChangeTaxCompanyImpl) then) =
      __$$ChangeTaxCompanyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ChangeTaxCompanyImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$ChangeTaxCompanyImpl>
    implements _$$ChangeTaxCompanyImplCopyWith<$Res> {
  __$$ChangeTaxCompanyImplCopyWithImpl(_$ChangeTaxCompanyImpl _value,
      $Res Function(_$ChangeTaxCompanyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ChangeTaxCompanyImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChangeTaxCompanyImpl implements _ChangeTaxCompany {
  const _$ChangeTaxCompanyImpl({required this.id, this.name});

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'StampEvent.changeTaxCompany(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTaxCompanyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTaxCompanyImplCopyWith<_$ChangeTaxCompanyImpl> get copyWith =>
      __$$ChangeTaxCompanyImplCopyWithImpl<_$ChangeTaxCompanyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return changeTaxCompany(id, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return changeTaxCompany?.call(id, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeTaxCompany != null) {
      return changeTaxCompany(id, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return changeTaxCompany(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return changeTaxCompany?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (changeTaxCompany != null) {
      return changeTaxCompany(this);
    }
    return orElse();
  }
}

abstract class _ChangeTaxCompany implements StampEvent {
  const factory _ChangeTaxCompany(
      {required final int? id, final String? name}) = _$ChangeTaxCompanyImpl;

  int? get id;
  String? get name;
  @JsonKey(ignore: true)
  _$$ChangeTaxCompanyImplCopyWith<_$ChangeTaxCompanyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitStampImplCopyWith<$Res> {
  factory _$$SubmitStampImplCopyWith(
          _$SubmitStampImpl value, $Res Function(_$SubmitStampImpl) then) =
      __$$SubmitStampImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitStampImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$SubmitStampImpl>
    implements _$$SubmitStampImplCopyWith<$Res> {
  __$$SubmitStampImplCopyWithImpl(
      _$SubmitStampImpl _value, $Res Function(_$SubmitStampImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubmitStampImpl implements _SubmitStamp {
  const _$SubmitStampImpl();

  @override
  String toString() {
    return 'StampEvent.submitStamp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitStampImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return submitStamp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return submitStamp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (submitStamp != null) {
      return submitStamp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return submitStamp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return submitStamp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (submitStamp != null) {
      return submitStamp(this);
    }
    return orElse();
  }
}

abstract class _SubmitStamp implements StampEvent {
  const factory _SubmitStamp() = _$SubmitStampImpl;
}

/// @nodoc
abstract class _$$ClearSubmitStateImplCopyWith<$Res> {
  factory _$$ClearSubmitStateImplCopyWith(_$ClearSubmitStateImpl value,
          $Res Function(_$ClearSubmitStateImpl) then) =
      __$$ClearSubmitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSubmitStateImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$ClearSubmitStateImpl>
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
    return 'StampEvent.clearSubmitState()';
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
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return clearSubmitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return clearSubmitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
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
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return clearSubmitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return clearSubmitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (clearSubmitState != null) {
      return clearSubmitState(this);
    }
    return orElse();
  }
}

abstract class _ClearSubmitState implements StampEvent {
  const factory _ClearSubmitState() = _$ClearSubmitStateImpl;
}

/// @nodoc
abstract class _$$DeleteStampImplCopyWith<$Res> {
  factory _$$DeleteStampImplCopyWith(
          _$DeleteStampImpl value, $Res Function(_$DeleteStampImpl) then) =
      __$$DeleteStampImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteStampImplCopyWithImpl<$Res>
    extends _$StampEventCopyWithImpl<$Res, _$DeleteStampImpl>
    implements _$$DeleteStampImplCopyWith<$Res> {
  __$$DeleteStampImplCopyWithImpl(
      _$DeleteStampImpl _value, $Res Function(_$DeleteStampImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteStampImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteStampImpl implements _DeleteStamp {
  const _$DeleteStampImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'StampEvent.deleteStamp(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteStampImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteStampImplCopyWith<_$DeleteStampImpl> get copyWith =>
      __$$DeleteStampImplCopyWithImpl<_$DeleteStampImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return deleteStamp(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return deleteStamp?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
    required TResult orElse(),
  }) {
    if (deleteStamp != null) {
      return deleteStamp(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return deleteStamp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return deleteStamp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (deleteStamp != null) {
      return deleteStamp(this);
    }
    return orElse();
  }
}

abstract class _DeleteStamp implements StampEvent {
  const factory _DeleteStamp({required final int id}) = _$DeleteStampImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteStampImplCopyWith<_$DeleteStampImpl> get copyWith =>
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
    extends _$StampEventCopyWithImpl<$Res, _$ClearDeleteStateImpl>
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
    return 'StampEvent.clearDeleteState()';
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
    required TResult Function() initAdd,
    required TResult Function(int id) initDetail,
    required TResult Function(int id) initEdit,
    required TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)
        hydrateEditPayload,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() loadFormOptions,
    required TResult Function(DateTime registerDate) changeRegisterDate,
    required TResult Function(bool isUrgent) changeUrgent,
    required TResult Function(DateTime? deadline) changeDeadline,
    required TResult Function(int? id, String? name) changeDocumentType,
    required TResult Function(String name) changeDocumentName,
    required TResult Function(int quantity) changeDocumentQuantity,
    required TResult Function(int totalPage) changeDocumentTotalPage,
    required TResult Function(int? id, String? name) changeApproved,
    required TResult Function(int? id, String? name) changeEmployeeSign,
    required TResult Function(int? id, String? name) changeSealRegulation,
    required TResult Function(int? id, String? name) changeTaxCompany,
    required TResult Function() submitStamp,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) deleteStamp,
    required TResult Function() clearDeleteState,
  }) {
    return clearDeleteState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initAdd,
    TResult? Function(int id)? initDetail,
    TResult? Function(int id)? initEdit,
    TResult? Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? loadFormOptions,
    TResult? Function(DateTime registerDate)? changeRegisterDate,
    TResult? Function(bool isUrgent)? changeUrgent,
    TResult? Function(DateTime? deadline)? changeDeadline,
    TResult? Function(int? id, String? name)? changeDocumentType,
    TResult? Function(String name)? changeDocumentName,
    TResult? Function(int quantity)? changeDocumentQuantity,
    TResult? Function(int totalPage)? changeDocumentTotalPage,
    TResult? Function(int? id, String? name)? changeApproved,
    TResult? Function(int? id, String? name)? changeEmployeeSign,
    TResult? Function(int? id, String? name)? changeSealRegulation,
    TResult? Function(int? id, String? name)? changeTaxCompany,
    TResult? Function()? submitStamp,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? deleteStamp,
    TResult? Function()? clearDeleteState,
  }) {
    return clearDeleteState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initAdd,
    TResult Function(int id)? initDetail,
    TResult Function(int id)? initEdit,
    TResult Function(
            StampItem? item,
            StampDetailItem? detail,
            List<AssignerStampItem> employees,
            List<SealItem> sealRegulations,
            List<DocumentStampItem> documentTypes,
            List<CompanyStampItem> taxCompanies)?
        hydrateEditPayload,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? loadFormOptions,
    TResult Function(DateTime registerDate)? changeRegisterDate,
    TResult Function(bool isUrgent)? changeUrgent,
    TResult Function(DateTime? deadline)? changeDeadline,
    TResult Function(int? id, String? name)? changeDocumentType,
    TResult Function(String name)? changeDocumentName,
    TResult Function(int quantity)? changeDocumentQuantity,
    TResult Function(int totalPage)? changeDocumentTotalPage,
    TResult Function(int? id, String? name)? changeApproved,
    TResult Function(int? id, String? name)? changeEmployeeSign,
    TResult Function(int? id, String? name)? changeSealRegulation,
    TResult Function(int? id, String? name)? changeTaxCompany,
    TResult Function()? submitStamp,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? deleteStamp,
    TResult Function()? clearDeleteState,
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
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_InitEdit value) initEdit,
    required TResult Function(_HydrateEditPayload value) hydrateEditPayload,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_LoadFormOptions value) loadFormOptions,
    required TResult Function(_ChangeRegisterDate value) changeRegisterDate,
    required TResult Function(_ChangeUrgent value) changeUrgent,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeDocumentType value) changeDocumentType,
    required TResult Function(_ChangeDocumentName value) changeDocumentName,
    required TResult Function(_ChangeDocumentQuantity value)
        changeDocumentQuantity,
    required TResult Function(_ChangeDocumentTotalPage value)
        changeDocumentTotalPage,
    required TResult Function(_ChangeApproved value) changeApproved,
    required TResult Function(_ChangeEmployeeSign value) changeEmployeeSign,
    required TResult Function(_ChangeSealRegulation value) changeSealRegulation,
    required TResult Function(_ChangeTaxCompany value) changeTaxCompany,
    required TResult Function(_SubmitStamp value) submitStamp,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_DeleteStamp value) deleteStamp,
    required TResult Function(_ClearDeleteState value) clearDeleteState,
  }) {
    return clearDeleteState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_InitEdit value)? initEdit,
    TResult? Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_LoadFormOptions value)? loadFormOptions,
    TResult? Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult? Function(_ChangeUrgent value)? changeUrgent,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeDocumentType value)? changeDocumentType,
    TResult? Function(_ChangeDocumentName value)? changeDocumentName,
    TResult? Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult? Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult? Function(_ChangeApproved value)? changeApproved,
    TResult? Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult? Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult? Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult? Function(_SubmitStamp value)? submitStamp,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_DeleteStamp value)? deleteStamp,
    TResult? Function(_ClearDeleteState value)? clearDeleteState,
  }) {
    return clearDeleteState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_InitEdit value)? initEdit,
    TResult Function(_HydrateEditPayload value)? hydrateEditPayload,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_LoadFormOptions value)? loadFormOptions,
    TResult Function(_ChangeRegisterDate value)? changeRegisterDate,
    TResult Function(_ChangeUrgent value)? changeUrgent,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeDocumentType value)? changeDocumentType,
    TResult Function(_ChangeDocumentName value)? changeDocumentName,
    TResult Function(_ChangeDocumentQuantity value)? changeDocumentQuantity,
    TResult Function(_ChangeDocumentTotalPage value)? changeDocumentTotalPage,
    TResult Function(_ChangeApproved value)? changeApproved,
    TResult Function(_ChangeEmployeeSign value)? changeEmployeeSign,
    TResult Function(_ChangeSealRegulation value)? changeSealRegulation,
    TResult Function(_ChangeTaxCompany value)? changeTaxCompany,
    TResult Function(_SubmitStamp value)? submitStamp,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_DeleteStamp value)? deleteStamp,
    TResult Function(_ClearDeleteState value)? clearDeleteState,
    required TResult orElse(),
  }) {
    if (clearDeleteState != null) {
      return clearDeleteState(this);
    }
    return orElse();
  }
}

abstract class _ClearDeleteState implements StampEvent {
  const factory _ClearDeleteState() = _$ClearDeleteStateImpl;
}
