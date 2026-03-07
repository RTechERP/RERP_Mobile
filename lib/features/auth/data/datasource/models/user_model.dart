import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'EmployeeID') required int employeeId,
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'DepartmentID') required int departmentId,
    @JsonKey(name: 'Code') required String code,
    @JsonKey(name: 'FullName') required String fullName,
    @JsonKey(name: 'LoginName') required String loginName,

    @JsonKey(name: 'IsAdmin') required bool isAdmin,
    @JsonKey(name: 'IsAdminSale') required int isAdminSale,
    @JsonKey(name: 'MainViewID') required int mainViewId,

    @JsonKey(name: 'DepartmentName') required String departmentName,
    @JsonKey(name: 'HeadofDepartment') required String headofDepartment,
    @JsonKey(name: 'AnhCBNV') required String avatar,

    @JsonKey(name: 'StatusEmployee') required String statusEmployee,
    @JsonKey(name: 'StatusUser') required String statusUser,

    @JsonKey(name: 'PositionName') required String positionName,
    @JsonKey(name: 'UserGroupID') required int userGroupId,
    @JsonKey(name: 'PositionID') required int positionId,
    @JsonKey(name: 'GioiTinh') required int gioiTinh,

    @JsonKey(name: 'PositionCode') required String positionCode,
    @JsonKey(name: 'DepartmentCode') required String departmentCode,

    @JsonKey(name: 'IsBusinessCost') required bool isBusinessCost,
    @JsonKey(name: 'IsLeader') required int isLeader,
    @JsonKey(name: 'TeamOfUser') required int teamOfUser,

    @JsonKey(name: 'Permissions') required String permissions,

    @JsonKey(name: 'Name') required String name,

  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
