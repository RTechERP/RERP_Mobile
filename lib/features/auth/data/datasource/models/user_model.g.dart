// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      employeeId: (json['EmployeeID'] as num).toInt(),
      id: (json['ID'] as num).toInt(),
      departmentId: (json['DepartmentID'] as num).toInt(),
      code: json['Code'] as String,
      fullName: json['FullName'] as String,
      loginName: json['LoginName'] as String,
      isAdmin: json['IsAdmin'] as bool,
      isAdminSale: (json['IsAdminSale'] as num).toInt(),
      mainViewId: (json['MainViewID'] as num).toInt(),
      departmentName: json['DepartmentName'] as String,
      headofDepartment: json['HeadofDepartment'] as String,
      avatar: json['AnhCBNV'] as String,
      statusEmployee: json['StatusEmployee'] as String,
      statusUser: json['StatusUser'] as String,
      positionName: json['PositionName'] as String,
      userGroupId: (json['UserGroupID'] as num).toInt(),
      positionId: (json['PositionID'] as num).toInt(),
      gioiTinh: (json['GioiTinh'] as num).toInt(),
      positionCode: json['PositionCode'] as String,
      departmentCode: json['DepartmentCode'] as String,
      isBusinessCost: json['IsBusinessCost'] as bool,
      isLeader: (json['IsLeader'] as num).toInt(),
      teamOfUser: (json['TeamOfUser'] as num).toInt(),
      permissions: json['Permissions'] as String,
      name: json['Name'] as String,
      passwordHash: json['PasswordHash'] as String,
      leaderId: (json['LeaderID'] as num).toInt(),
      taxCompanyId: (json['TaxCompanyID'] as num).toInt(),
      imagePath: json['ImagePath'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'EmployeeID': instance.employeeId,
      'ID': instance.id,
      'DepartmentID': instance.departmentId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'LoginName': instance.loginName,
      'IsAdmin': instance.isAdmin,
      'IsAdminSale': instance.isAdminSale,
      'MainViewID': instance.mainViewId,
      'DepartmentName': instance.departmentName,
      'HeadofDepartment': instance.headofDepartment,
      'AnhCBNV': instance.avatar,
      'StatusEmployee': instance.statusEmployee,
      'StatusUser': instance.statusUser,
      'PositionName': instance.positionName,
      'UserGroupID': instance.userGroupId,
      'PositionID': instance.positionId,
      'GioiTinh': instance.gioiTinh,
      'PositionCode': instance.positionCode,
      'DepartmentCode': instance.departmentCode,
      'IsBusinessCost': instance.isBusinessCost,
      'IsLeader': instance.isLeader,
      'TeamOfUser': instance.teamOfUser,
      'Permissions': instance.permissions,
      'Name': instance.name,
      'PasswordHash': instance.passwordHash,
      'LeaderID': instance.leaderId,
      'TaxCompanyID': instance.taxCompanyId,
      'ImagePath': instance.imagePath,
    };

_$UploadAvatarResponseImpl _$$UploadAvatarResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadAvatarResponseImpl(
      savedFileName: json['SavedFileName'] as String? ?? '',
    );

Map<String, dynamic> _$$UploadAvatarResponseImplToJson(
        _$UploadAvatarResponseImpl instance) =>
    <String, dynamic>{
      'SavedFileName': instance.savedFileName,
    };
