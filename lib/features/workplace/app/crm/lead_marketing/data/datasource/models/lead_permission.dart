import '../../../../../../../../features/auth/data/datasource/models/user_model.dart';
import 'lead_marketing_model.dart';

/// Quyền thao tác trên phiếu lead, phụ thuộc giai đoạn xử lý và vai trò
/// người dùng.
///
/// Quy tắc theo mã giai đoạn (`Stage`):
///
/// - Giai đoạn 1–4 và 9: nhân viên **marketing** được thao tác.
/// - Giai đoạn 5–8: nhân viên **sale** được thao tác.
/// - Giai đoạn 1–9: nhân viên đặc biệt (`employeeID = 332` hoặc
///   `id` user = `1425`) được thao tác mọi giai đoạn.
/// - Giai đoạn 10 (Chốt PO): không ai được thao tác.
///
/// Ngoài quyền theo giai đoạn, quyền xoá phiếu của người khác do API quyết định.
class LeadPermission {
  const LeadPermission._();

  /// Mã giai đoạn Chốt PO — không ai được quyền thao tác.
  static const int customerPoStageCode = 10;

  /// Mã giai đoạn Không phù hợp (đã bị loại bỏ).
  static const int disqualifiedStageCode = 9;

  /// Mã giai đoạn Chờ phân công — không được xác nhận / huỷ TT không phù hợp.
  static const int pendingAssignStageCode = 4;

  /// EmployeeID của nhân viên đặc biệt luôn có quyền thao tác.
  static const int specialEmployeeId = 332;

  /// ID user của nhân viên đặc biệt luôn có quyền thao tác.
  static const int specialUserId = 1425;

  /// Mã giai đoạn lớn nhất mà nhân viên marketing vẫn được thao tác.
  static const int marketingMaxStageCode = 4;

  /// Thông báo khi người dùng không có quyền thao tác phiếu lead.
  static const String noPermissionMessage =
      'Bạn không có quyền thao tác phiếu lead ở trạng thái này';

  /// Thông báo khi phiếu đã chốt PO — không ai được thao tác.
  static const String customerPoMessage =
      'Không thể thao tác phiếu lead đã chốt PO';

  /// Thông báo khi phiếu không ở giai đoạn phù hợp để xác nhận / huỷ TT
  /// không phù hợp.
  ///
  /// Nhận mã phiếu và tên giai đoạn để hiển thị đầy đủ.
  static String invalidStageMessage({
    required String? leadCode,
    required String? stageName,
  }) {
    final code = (leadCode ?? '').trim();
    final stage = (stageName ?? '').trim();
    return 'Lead không ở giai đoạn phù hợp: $code ($stage)';
  }

  /// Tên giai đoạn → mã giai đoạn, dùng khi API chưa trả `Stage`.
  ///
  /// Khớp theo tên chứa (vd `Trả lại MKT` → mã 3).
  static const Map<String, int> _stageNameToCode = {
    'mới': 1,
    'đang chăm sóc': 2,
    'trả lại': 3,
    'chờ phân công': 4,
    'đã phân công': 5,
    'đang xử lý': 6,
    'đã chuyển thành khách hàng': 7,
    'thất bại': 8,
    'không phù hợp': 9,
    'chốt po': 10,
  };

  /// Xác định mã giai đoạn của phiếu từ dữ liệu API.
  ///
  /// Ưu tiên mã `Stage` API trả về; khi không có mã thì suy ra từ tên giai
  /// đoạn. Trả về `null` khi không xác định được.
  static int? resolveStageCode({int? stageCode, String? stageName}) {
    if (stageCode != null && stageCode > 0) return stageCode;

    final name = (stageName ?? '').trim().toLowerCase();
    if (name.isEmpty) return null;

    for (final entry in _stageNameToCode.entries) {
      if (name.contains(entry.key)) return entry.value;
    }
    return null;
  }

  /// Người dùng hiện tại có là nhân viên đặc biệt không.
  ///
  /// Nhân viên đặc biệt được xác định bởi `EmployeeID` = [specialEmployeeId]
  /// hoặc `ID` user = [specialUserId].
  static bool isSpecialUser({
    required LeadRoleContext? roleContext,
    required User? user,
  }) {
    if (roleContext?.employeeId == specialEmployeeId) return true;
    if (user?.employeeId == specialEmployeeId) return true;
    if (user?.id == specialUserId) return true;
    return false;
  }

  /// Người dùng hiện tại có là nhân viên marketing không.
  static bool isMarketingUser({required LeadRoleContext? roleContext}) {
    return roleContext?.isMarketing == true;
  }

  /// Người dùng hiện tại có là nhân viên sale không.
  static bool isSaleUser({required LeadRoleContext? roleContext}) {
    return roleContext?.isSale == true;
  }

  /// Kiểm tra người dùng hiện tại có được phép **xoá** phiếu lead [item] hay
  /// không.
  ///
  /// Quyền xoá phụ thuộc giai đoạn của phiếu (xem [canOperate]).
  ///
  /// Trả về `null` nếu được phép; ngược lại trả về thông báo cần hiển thị.
  static String? blockedDeleteMessage({
    required LeadMarketingItem item,
    required LeadRoleContext? roleContext,
    required User? user,
  }) {
    final stageCode = resolveStageCode(
      stageCode: item.stage,
      stageName: item.stageName,
    );

    return blockedMessage(
      stageCode: stageCode,
      roleContext: roleContext,
      user: user,
    );
  }

  /// Kiểm tra người dùng hiện tại có được phép xác nhận / huỷ TT không phù hợp
  /// với phiếu lead [item] hay không.
  ///
  /// Giai đoạn "Chờ phân công" (mã 4) không được phép dùng 2 thao tác này.
  ///
  /// Trả về `null` nếu được phép; ngược lại trả về thông báo cần hiển thị.
  static String? blockedStageActionMessage({
    required LeadMarketingItem item,
  }) {
    final stageCode = resolveStageCode(
      stageCode: item.stage,
      stageName: item.stageName,
    );
    if (stageCode != pendingAssignStageCode) return null;

    return invalidStageMessage(
      leadCode: item.leadCode,
      stageName: item.stageName,
    );
  }

  /// Kiểm tra người dùng hiện tại có được phép thao tác phiếu lead đang ở
  /// giai đoạn [stageCode] hay không.
  ///
  /// [stageCode] là mã giai đoạn của phiếu; nếu không xác định được (API chưa
  /// trả mã/tên giai đoạn) thì cho phép thao tác để không chặn nhầm.
  static bool canOperate({
    required int? stageCode,
    required LeadRoleContext? roleContext,
    required User? user,
  }) {
    if (stageCode == null) return true;

    // Giai đoạn 10 (Chốt PO) — không ai được thao tác.
    if (stageCode >= customerPoStageCode) return false;

    // Nhân viên đặc biệt được thao tác mọi giai đoạn 1–9.
    if (isSpecialUser(roleContext: roleContext, user: user)) return true;

    // Giai đoạn 1–4 và 9 — nhân viên marketing được thao tác.
    if (stageCode <= marketingMaxStageCode ||
        stageCode == disqualifiedStageCode) {
      return isMarketingUser(roleContext: roleContext);
    }

    // Giai đoạn 5–8 — nhân viên sale được thao tác.
    return isSaleUser(roleContext: roleContext);
  }

  /// Thông báo phù hợp với lý do bị chặn thao tác.
  ///
  /// Trả về `null` nếu người dùng được phép thao tác.
  static String? blockedMessage({
    required int? stageCode,
    required LeadRoleContext? roleContext,
    required User? user,
  }) {
    if (canOperate(
      stageCode: stageCode,
      roleContext: roleContext,
      user: user,
    )) {
      return null;
    }

    if (stageCode != null && stageCode >= customerPoStageCode) {
      return customerPoMessage;
    }
    return noPermissionMessage;
  }
}
