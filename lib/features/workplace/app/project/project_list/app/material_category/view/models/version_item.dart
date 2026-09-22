import 'package:flutter/material.dart';

/// Trạng thái Sử dụng của Phiên bản (dựa vào `IsActive`).
enum VersionUsageStatus {
  inUse,
  archived,
  unknown;

  String get label {
    switch (this) {
      case VersionUsageStatus.inUse:
        return 'Đang dùng';
      case VersionUsageStatus.archived:
        return 'Lưu trữ';
      case VersionUsageStatus.unknown:
        return '--';
    }
  }
}

/// Trạng thái Duyệt của Phiên bản (dựa vào `IsApproved`).
enum VersionApprovalStatus {
  pending,
  approved,
  rejected,
  unknown;

  String get label {
    switch (this) {
      case VersionApprovalStatus.approved:
        return 'Đã duyệt';
      case VersionApprovalStatus.pending:
        return 'Chờ duyệt';
      case VersionApprovalStatus.rejected:
        return 'Từ chối';
      case VersionApprovalStatus.unknown:
        return '--';
    }
  }
}

/// Loại phiên bản - xác định từ request isPO.
enum VersionType {
  solutionVersion,
  poVersion;

  String get label {
    switch (this) {
      case VersionType.solutionVersion:
        return 'Phiên bản Giải pháp';
      case VersionType.poVersion:
        return 'Phiên bản PO';
    }
  }
}

/// Model hiển thị một Phiên bản (Version).
class VersionItem {
  const VersionItem({
    required this.id,
    required this.code,
    required this.description,
    required this.usage,
    required this.approval,
    required this.type,
    required this.projectTypeName,
    required this.fullNameCreated,
    this.statusVersionText,
    this.stt = 0,
    this.codeNew,
    this.createdDate,
    this.updatedDate,
    this.tbpApprover,
    this.tbpApprovedDate,
    this.projectSolutionId,
    this.projectId,
  });

  final int id;
  final String code;
  final String description;
  final VersionUsageStatus usage;
  final VersionApprovalStatus approval;
  final VersionType type;
  final String projectTypeName;
  final String fullNameCreated;

  /// Text mô tả trạng thái version từ API (VD: "Giải pháp").
  final String? statusVersionText;

  /// Số thứ tự.
  final int stt;

  /// Mã hiển thị mới (VD: "Điện - V1 - Giải pháp").
  final String? codeNew;

  final String? createdDate;
  final String? updatedDate;

  /// Người duyệt TBP (lấy từ API `ApprovedTBPID` + lookup tên).
  final String? tbpApprover;

  /// Ngày duyệt TBP.
  final String? tbpApprovedDate;

  final int? projectSolutionId;
  final int? projectId;
}

/// Mapping màu cho status chip tab Phiên bản.
class VersionStatusColors {
  static Color colorForUsage(VersionUsageStatus s) {
    switch (s) {
      case VersionUsageStatus.inUse:
        return const Color(0xFF16A34A);
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
}
