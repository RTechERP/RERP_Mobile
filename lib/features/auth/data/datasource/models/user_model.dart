// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: User data model - thông tin nhân viên đang đăng nhập

// ignore_for_file: type=lint, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// User info trả về từ API /auth/me.
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
