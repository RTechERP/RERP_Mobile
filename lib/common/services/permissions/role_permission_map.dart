import '../../enums/permission_enum.dart';
import '../../enums/role_enum.dart';

class RolePermissionMap {
  static final Map<AppRole, Set<AppPermission>> map = {
    AppRole.admin: AppPermission.values.toSet(),

    AppRole.tech: {AppPermission.viewTechReport},

    AppRole.sale: {AppPermission.viewSaleReport},

    AppRole.hr: {AppPermission.viewHrReport},

    AppRole.marketing: {AppPermission.viewMarketingReport},

    AppRole.agv: {AppPermission.viewAgvReport},
    AppRole.ad: {AppPermission.viewAdReport},

    AppRole.accountant: {AppPermission.viewAccountingReport},

    AppRole.senior: {AppPermission.viewSeniorApprove},

    AppRole.headOfDepartment: {AppPermission.viewHeadOfDepartmentApprove},

    AppRole.boardOfDirector: {AppPermission.viewBoardOfDirectorApprove},

    AppRole.employee: {},
  };
}
