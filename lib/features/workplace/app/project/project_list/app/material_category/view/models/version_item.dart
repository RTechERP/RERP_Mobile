import 'package:flutter/material.dart';

/// Cột trạng thái Sử dụng của Phiên bản.
enum VersionUsageStatus {
  notUsed,
  inUse,
  archived,
  unknown;

  String get label {
    switch (this) {
      case VersionUsageStatus.notUsed:
        return 'Không sử dụng';
      case VersionUsageStatus.inUse:
        return 'Đang sử dụng';
      case VersionUsageStatus.archived:
        return 'Lưu trữ';
      case VersionUsageStatus.unknown:
        return '--';
    }
  }
}

/// Cột Duyệt của Phiên bản (TBP Duyệt + Duyệt).
enum VersionApprovalStatus {
  pending,
  approved,
  rejected,
  unknown;

  String get label {
    switch (this) {
      case VersionApprovalStatus.pending:
        return 'Chờ duyệt';
      case VersionApprovalStatus.approved:
        return 'Đã duyệt';
      case VersionApprovalStatus.rejected:
        return 'Từ chối';
      case VersionApprovalStatus.unknown:
        return '--';
    }
  }
}

/// Cột Phát sinh (có phát sinh hay không).
enum VersionHasIncident {
  none,
  has,
  unknown;

  String get label {
    switch (this) {
      case VersionHasIncident.none:
        return 'Không';
      case VersionHasIncident.has:
        return 'Có';
      case VersionHasIncident.unknown:
        return '--';
    }
  }
}

/// Loại phiên bản - dùng để gom nhóm hiển thị.
/// - solutionVersion: phiên bản của Giải pháp.
/// - poVersion: phiên bản của PO.
enum VersionType {
  solutionVersion,
  poVersion,
  unknown;

  String get label {
    switch (this) {
      case VersionType.solutionVersion:
        return 'Phiên bản Giải pháp';
      case VersionType.poVersion:
        return 'Phiên bản PO';
      case VersionType.unknown:
        return '--';
    }
  }
}

/// Model hiển thị một Phiên bản.
/// Cột: STT - Sử dụng - Mã - Mô tả - TBP Duyệt - Duyệt - Phát sinh - Nội dung phát sinh.
class VersionItem {
  const VersionItem({
    required this.id,
    required this.code,
    required this.description,
    required this.usage,
    required this.tbpApprover,
    required this.approval,
    required this.incident,
    required this.type,
    this.incidentContent = '',
  });

  final int id;
  final String code;
  final String description;
  final VersionUsageStatus usage;
  final String tbpApprover;
  final VersionApprovalStatus approval;
  final VersionHasIncident incident;
  final String incidentContent;
  /// Loại phiên bản (Giải pháp / PO) - dùng để gom nhóm trên UI.
  final VersionType type;
}

/// Mapping màu cho status chip tab Phiên bản.
class VersionStatusColors {
  static Color colorForUsage(VersionUsageStatus s) {
    switch (s) {
      case VersionUsageStatus.inUse:
        return const Color(0xFF2563EB);
      case VersionUsageStatus.notUsed:
        return const Color(0xFF9CA3AF);
      case VersionUsageStatus.archived:
        return const Color(0xFF92400E);
      case VersionUsageStatus.unknown:
        return const Color(0xFF6B7280);
    }
  }

  static Color colorForApproval(VersionApprovalStatus s) {
    switch (s) {
      case VersionApprovalStatus.approved:
        return const Color(0xFF16A34A);
      case VersionApprovalStatus.pending:
        return const Color(0xFFF59E0B);
      case VersionApprovalStatus.rejected:
        return const Color(0xFFDC2626);
      case VersionApprovalStatus.unknown:
        return const Color(0xFF6B7280);
    }
  }

  static Color colorForIncident(VersionHasIncident s) {
    switch (s) {
      case VersionHasIncident.has:
        return const Color(0xFFDC2626);
      case VersionHasIncident.none:
        return const Color(0xFF16A34A);
      case VersionHasIncident.unknown:
        return const Color(0xFF6B7280);
    }
  }
}
