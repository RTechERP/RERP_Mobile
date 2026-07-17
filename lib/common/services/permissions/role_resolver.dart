import 'package:rtc_erp/common/services/permissions/role_groups.dart';

import '../../../features/auth/data/datasource/models/user_model.dart';
import '../../enums/role_enum.dart';

class RoleResolver {
  static Set<AppRole> resolve(User user) {
    final roles = <AppRole>{};

    if (user.isAdmin == true) {
      roles.add(AppRole.admin);
      return roles;
    }

    final deptId = user.departmentId;
    final empId = user.employeeId;
    final userId = user.id;
    final posId = user.positionId;
    final permissions = user.permissions.split(',');
    final hasSalePermission = permissions.any(
      (p) => PermissionGroups.saleAdminReports.contains(p),
    );
    final hasAccountingPermission = permissions.any(
      (p) => PermissionGroups.accountantAdminReports.contains(p),
    );

    /// ===== HR =====
    if (DepartmentGroups.hr.contains(deptId) ||
        EmployeeIdGroups.employeeHrs.contains(empId) ||
        PositionGroups.positionCps.contains(posId) ||
        PositionGroups.positionLxs.contains(posId)) {
      roles.add(AppRole.hr);
    }

    /// ===== SALE =====
    if (DepartmentGroups.sale.contains(deptId) ||
        (hasSalePermission ||
            EmployeeIdGroups.employeeSaleHCM.contains(empId) ||
            UserIdGroups.userAdminReportTech.contains(userId))) {
      roles.add(AppRole.sale);
    }

    /// ===== TECH =====
    if (DepartmentGroups.tech.contains(deptId) ||
        UserIdGroups.userAllReportTechs.contains(userId)) {
      roles.add(AppRole.tech);
    }

    /// ===== AGV =====
    if (DepartmentGroups.agv.contains(deptId)) {
      roles.add(AppRole.agv);
    }

    /// ===== LRTK =====
    if (DepartmentGroups.lrtk.contains(deptId)) {
      roles.add(AppRole.ad);
    }

    /// ===== MARKETING =====
    if (DepartmentGroups.marketing.contains(deptId)) {
      roles.add(AppRole.marketing);
    }

    /// ===== ACCOUNTANT =====
    if (DepartmentGroups.accountant.contains(deptId) ||
        hasAccountingPermission) {
      roles.add(AppRole.accountant);
    }

    if (roles.isEmpty) {
      roles.add(AppRole.employee);
    }

    return roles;
  }
}
