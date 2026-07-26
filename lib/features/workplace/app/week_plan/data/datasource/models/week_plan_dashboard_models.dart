// Data models shared giữa các widget của Dashboard.

import 'package:flutter/material.dart';

/// Thống kê số lượng công việc theo từng trạng thái.
class DashboardStats {
  const DashboardStats({
    required this.total,
    required this.totalOverdue,
    required this.chuaBatDau,
    required this.chuaBatDauQuaHan,
    required this.dangLam,
    required this.dangLamQuaHan,
    required this.choPheDuyet,
    required this.choPheDuyetQuaHan,
    required this.hoanThanh,
    required this.tuChoi,
    required this.tamHoan,
    required this.huy,
  });

  final int total;
  final int totalOverdue;
  final int chuaBatDau;
  final int chuaBatDauQuaHan;
  final int dangLam;
  final int dangLamQuaHan;
  final int choPheDuyet;
  final int choPheDuyetQuaHan;
  final int hoanThanh;
  final int tuChoi;
  final int tamHoan;
  final int huy;

  /// Trả về danh sách (label, value, color) phục vụ vẽ biểu đồ tròn.
  List<DashboardSliceData> get slices => [
    DashboardSliceData('Chưa bắt đầu', chuaBatDau, const Color(0xFF8C96B1)),
    DashboardSliceData('Đang làm', dangLam, const Color(0xFF2F80ED)),
    DashboardSliceData(
      'Đang làm quá hạn',
      dangLamQuaHan,
      const Color(0xFFEB5757),
    ),
    DashboardSliceData('Chờ phê duyệt', choPheDuyet, const Color(0xFFF2C94C)),
    DashboardSliceData(
      'Chờ phê duyệt quá hạn',
      choPheDuyetQuaHan,
      const Color(0xFFF0891A),
    ),
    DashboardSliceData('Hoàn thành', hoanThanh, const Color(0xFF33B469)),
    DashboardSliceData('Từ chối', tuChoi, const Color(0xFFE94260)),
    DashboardSliceData('Tạm hoãn', tamHoan, const Color(0xFFAF52DE)),
    DashboardSliceData('Huỷ', huy, const Color(0xFF6E7191)),
  ];

  List<DashboardSliceData> get visibleSlices =>
      slices.where((s) => s.value > 0).toList(growable: false);
}

/// Một lát của biểu đồ tròn.
class DashboardSliceData {
  const DashboardSliceData(this.label, this.value, this.color);
  final String label;
  final int value;
  final Color color;
}

/// Thống kê theo loại công việc.
class DashboardTaskTypeStat {
  const DashboardTaskTypeStat({
    required this.typeName,
    required this.total,
    required this.duyet,
    required this.tuChoi,
    required this.dangLam,
    required this.quaHan,
    required this.choDuyet,
  });

  final String typeName;
  final int total;
  final int duyet;
  final int tuChoi;
  final int dangLam;
  final int quaHan;
  final int choDuyet;
}
