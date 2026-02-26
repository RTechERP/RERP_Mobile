import '../../../features/auth/data/datasource/models/user_model.dart';
import '../../enums/role_enum.dart';
import 'department_groups.dart';

class RoleResolver {
  static Set<AppRole> resolve(User user) {
    final roles = <AppRole>{};

    if (user.isAdmin) {
      roles.add(AppRole.admin);
      return roles;
    }

    if (DepartmentGroups.techs.contains(user.departmentId)) {
      roles.add(AppRole.tech);
    }

    if (DepartmentGroups.sales.contains(user.departmentId)) {
      roles.add(AppRole.sale);
    }

    if (DepartmentGroups.hrs.contains(user.departmentId)) {
      roles.add(AppRole.hr);
    }

    if (DepartmentGroups.agvCokhis.contains(user.departmentId)) {
      roles.add(AppRole.agv);
    }

    if (DepartmentGroups.marketingPositions
        .contains(user.positionId)) {
      roles.add(AppRole.marketing);
    }

    if(DepartmentGroups.lapraps.contains(user.departmentId)){
      roles.add(AppRole.ad);
    }

    if (roles.isEmpty) {
      roles.add(AppRole.employee);
    }

    return roles;
  }
}