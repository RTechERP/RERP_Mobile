import 'package:flutter/material.dart';

/// Trạng thái của Giải pháp (mock data - sẽ map theo enum từ API sau).
enum SolutionStatus {
  pending,
  approved,
  rejected,
  inProgress,
  done,
  unknown;

  String get label {
    switch (this) {
      case SolutionStatus.pending:
        return 'Chờ xử lý';
      case SolutionStatus.approved:
        return 'Đã duyệt';
      case SolutionStatus.rejected:
        return 'Từ chối';
      case SolutionStatus.inProgress:
        return 'Đang thực hiện';
      case SolutionStatus.done:
        return 'Hoàn thành';
      case SolutionStatus.unknown:
        return '--';
    }
  }
}

/// Trạng thái Duyệt PO.
enum PoApproval {
  notRequired,
  pending,
  approved,
  rejected,
  unknown;

  String get label {
    switch (this) {
      case PoApproval.notRequired:
        return 'Không yêu cầu';
      case PoApproval.pending:
        return 'Chờ duyệt PO';
      case PoApproval.approved:
        return 'Đã duyệt PO';
      case PoApproval.rejected:
        return 'Từ chối PO';
      case PoApproval.unknown:
        return '--';
    }
  }
}

/// Model hiển thị một Giải pháp.
/// Cột: STT - Trạng thái - Duyệt PO - Ngày GP - Mã - Nội dung.
class SolutionItem {
  const SolutionItem({
    required this.id,
    required this.code,
    required this.content,
    required this.status,
    required this.requestCode,
    this.poApproval = PoApproval.notRequired,
    this.gpDate,
    // Các trường bổ sung từ API
    this.projectRequestId,
    this.projectCode,
    this.projectName,
    this.stt = 0,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.statusSolution,
    this.isApprovedPrice,
    this.isApprovedPO,
    this.note,
  });

  final int id;
  final String code;
  final String content;
  final SolutionStatus status;
  /// Mã yêu cầu dùng để gom nhóm các giải pháp liên quan.
  final String requestCode;
  final PoApproval poApproval;
  final DateTime? gpDate;

  // Các trường bổ sung từ API
  final int? projectRequestId;
  final String? projectCode;
  final String? projectName;
  final int stt;
  final String? createdBy;
  final String? createdDate;
  final String? updatedBy;
  final String? updatedDate;
  final int? statusSolution;
  final bool? isApprovedPrice;
  final bool? isApprovedPO;
  final String? note;
}

/// Mapping màu cho status chip tab Giải pháp.
class SolutionStatusColors {
  static Color colorForStatus(SolutionStatus s) {
    switch (s) {
      case SolutionStatus.done:
        return const Color(0xFF16A34A);
      case SolutionStatus.inProgress:
        return const Color(0xFF2563EB);
      case SolutionStatus.approved:
        return const Color(0xFF0D9488);
      case SolutionStatus.pending:
        return const Color(0xFFF59E0B);
      case SolutionStatus.rejected:
        return const Color(0xFFDC2626);
      case SolutionStatus.unknown:
        return const Color(0xFF6B7280);
    }
  }

  static Color colorForPoApproval(PoApproval p) {
    switch (p) {
      case PoApproval.approved:
        return const Color(0xFF16A34A);
      case PoApproval.pending:
        return const Color(0xFFF59E0B);
      case PoApproval.rejected:
        return const Color(0xFFDC2626);
      case PoApproval.notRequired:
      case PoApproval.unknown:
        return const Color(0xFF6B7280);
    }
  }
}
