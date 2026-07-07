import '../../../features/auth/data/repository/auth_repository.dart';
import '../../../features/workplace/data/datasource/models/index.dart';
import '../../enums/permission_enum.dart';
import '../../enums/role_enum.dart';
import 'role_permission_map.dart';
import 'role_resolver.dart';

class PermissionService {
  PermissionService._();

  static final Map<String, AppPermission> _menuPermissionMap = {
    'report:sale': AppPermission.viewSaleReport,
    'report:tech': AppPermission.viewTechReport,
    'report:hr': AppPermission.viewHrReport,
    'report:marketing': AppPermission.viewMarketingReport,
    'report:agv': AppPermission.viewAgvReport,
    'report:ad': AppPermission.viewAdReport,
    'report:accountant': AppPermission.viewAccountingReport,
    'personal_approve:senior': AppPermission.viewSeniorApprove,
    'personal_approve:menu': AppPermission.viewPersonalApproveMenu,
  };

  static Set<AppPermission> _cachedPermissions = {};
  static bool _initialized = false;

  /// Init permission theo user hiện tại
  static Future<void> init() async {
    final user = await AuthRepository.getCurrentUser();

    if (user == null) {
      reset();
      return;
    }

    final roles = RoleResolver.resolve(user);

    _cachedPermissions = _collectPermissions(roles);
    _initialized = true;
  }

  /// Reset hoàn toàn (dùng khi logout)
  static void reset() {
    _cachedPermissions = {};
    _initialized = false;
  }

  static bool hasAccess(String itemId) {
    if (!_initialized) {
      return false;
    }

    final requiredPermission = _menuPermissionMap[itemId];
    if (requiredPermission == null) return false;

    return _cachedPermissions.contains(requiredPermission);
  }

  static List<AppItemModel> mapItems(List<AppItemModel> items) {
    return items.map((item) {
      final enabled = hasAccess(item.id);

      return item.copyWith(enabled: enabled, opacity: enabled ? 1.0 : 0.4);
    }).toList();
  }

  static Set<AppPermission> _collectPermissions(Set<AppRole> roles) {
    final result = <AppPermission>{};

    for (final role in roles) {
      final perms = RolePermissionMap.map[role];
      if (perms != null) {
        result.addAll(perms);
      }
    }

    return result;
  }
}