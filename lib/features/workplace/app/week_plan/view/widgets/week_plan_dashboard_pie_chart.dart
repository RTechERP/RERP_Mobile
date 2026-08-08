import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import 'week_plan_dashboard_glass_container.dart';
import '../../data/datasource/models/week_plan_dashboard_models.dart';

/// Biểu đồ tròn (Pie Chart) hiển thị phân bổ trạng thái công việc.
///
/// Dùng `SfCircularChart` với `DoughnutSeries`:
///  - Liệt kê **đầy đủ 10 trạng thái** (kể cả khi `value == 0`) để đồng bộ với lưới.
///  - Màu & nhãn khớp với `WeekPlanDashboardStatusGrid`.
///  - Trên mỗi lát in **số lượng** (cỡ lớn) và **tên trạng thái** (cỡ nhỏ) bằng màu chữ tương phản.
///  - Bên cạnh biểu đồ là danh sách chú thích: ô màu + tên trạng thái + số lượng + tỉ lệ %.
///  - Phần trung tâm chỉ hiển thị tổng cộng.
class WeekPlanDashboardPieChart extends StatelessWidget {
  const WeekPlanDashboardPieChart({super.key, required this.stats});

  final DashboardStats stats;

  static const List<_PieItem> _items = [
    _PieItem('Chưa bắt đầu', Color(0xFF8C96B1)),
    _PieItem('Chưa bắt đầu quá hạn', Color(0xFFEB5757)),
    _PieItem('Đang làm', Color(0xFF2F80ED)),
    _PieItem('Đang làm quá hạn', Color(0xFFEB5757)),
    _PieItem('Chờ phê duyệt', Color(0xFFF2C94C)),
    _PieItem('Chờ phê duyệt quá hạn', Color(0xFFF0891A)),
    _PieItem('Hoàn thành', Color(0xFF33B469)),
    _PieItem('Từ chối', Color(0xFFE94260)),
    _PieItem('Tạm hoãn', Color(0xFFAF52DE)),
    _PieItem('Huỷ', Color(0xFF6E7191)),
  ];

  List<_PieSlice> _buildSlices() {
    return _items
        .map(
          (it) => _PieSlice(
            label: it.label,
            value: _valueOf(it.label),
            color: it.color,
          ),
        )
        .toList(growable: false);
  }

  int _valueOf(String label) {
    switch (label) {
      case 'Chưa bắt đầu':
        return stats.chuaBatDau;
      case 'Chưa bắt đầu quá hạn':
        return stats.chuaBatDauQuaHan;
      case 'Đang làm':
        return stats.dangLam;
      case 'Đang làm quá hạn':
        return stats.dangLamQuaHan;
      case 'Chờ phê duyệt':
        return stats.choPheDuyet;
      case 'Chờ phê duyệt quá hạn':
        return stats.choPheDuyetQuaHan;
      case 'Hoàn thành':
        return stats.hoanThanh;
      case 'Từ chối':
        return stats.tuChoi;
      case 'Tạm hoãn':
        return stats.tamHoan;
      case 'Huỷ':
        return stats.huy;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final slices = _buildSlices();

    return WeekPlanDashboardGlassContainer(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WeekPlanDashboardSectionHeader(
            title: 'Biểu đồ tỉ lệ trạng thái',
            subtitle: 'Phân bổ công việc theo trạng thái',
            icon: Icons.pie_chart_outline,
          ),
          const SizedBox(height: 14),
          if (stats.total == 0)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text(
                  'Chưa có dữ liệu',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textTertiaryColor,
                  ),
                ),
              ),
            )
          else
            Column(
              children: [
                Center(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final side = constraints.maxWidth.clamp(0.0, 280.0);
                      return SizedBox(
                        width: side,
                        height: side,
                        child: SfCircularChart(
                          margin: EdgeInsets.zero,
                          tooltipBehavior: TooltipBehavior(
                            enable: true,
                            builder:
                                (data, point, series, pointIndex, seriesIndex) {
                                  final slice = point as _PieSlice;
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.85,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      '${slice.label}: ${slice.value}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                },
                          ),
                          series: <CircularSeries>[
                            DoughnutSeries<_PieSlice, String>(
                              dataSource: slices,
                              xValueMapper: (s, _) => s.label,
                              yValueMapper: (s, _) => s.value,
                              pointColorMapper: (s, _) => s.color,
                              radius: '100%',
                              innerRadius: '52%',
                              startAngle: 270,
                              endAngle: 270,
                              dataLabelSettings: DataLabelSettings(
                                isVisible: true,
                                labelIntersectAction:
                                    LabelIntersectAction.shift,
                                connectorLineSettings:
                                    const ConnectorLineSettings(
                                      width: 1,
                                      color: AppColors.borderColor,
                                    ),
                                builder:
                                    (
                                      data,
                                      point,
                                      series,
                                      pointIndex,
                                      seriesIndex,
                                    ) {
                                      final slice = data as _PieSlice;
                                      if (slice.value <= 0) {
                                        return const SizedBox.shrink();
                                      }
                                      return _SliceLabel(slice: slice);
                                    },
                              ),
                            ),
                          ],
                          annotations: <CircularChartAnnotation>[
                            CircularChartAnnotation(
                              widget: _PieCenterLabel(
                                total: stats.total,
                                overdue: stats.totalOverdue,
                              ),
                              radius: '0%',
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 14),
                _LegendWrap(slices: slices),
              ],
            ),
        ],
      ),
    );
  }
}

class _PieItem {
  const _PieItem(this.label, this.color);
  final String label;
  final Color color;
}

class _PieSlice {
  const _PieSlice({
    required this.label,
    required this.value,
    required this.color,
  });
  final String label;
  final int value;
  final Color color;
}

/// Danh sách chú thích dạng Wrap nằm dưới biểu đồ: tự xuống hàng khi hết chỗ,
/// hiển thị đủ 10 trạng thái (kể cả value = 0 — sẽ làm mờ).
class _LegendWrap extends StatelessWidget {
  const _LegendWrap({required this.slices});

  final List<_PieSlice> slices;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      alignment: WrapAlignment.center,
      children: [for (final s in slices) _LegendChip(slice: s)],
    );
  }
}

class _LegendChip extends StatelessWidget {
  const _LegendChip({required this.slice});

  final _PieSlice slice;

  @override
  Widget build(BuildContext context) {
    final isEmpty = slice.value <= 0;
    return Opacity(
      opacity: isEmpty ? 0.55 : 1.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: slice.color.withValues(alpha: isEmpty ? 0.06 : 0.10),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: slice.color.withValues(alpha: isEmpty ? 0.18 : 0.30),
            width: 0.6,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: slice.color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              slice.label,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondaryColor,
                fontWeight: FontWeight.w500,
                height: 1.1,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              '${slice.value}',
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w800,
                color: slice.color,
                height: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Nhãn hiển thị trên từng lát: số lượng cỡ lớn phía trên, tên trạng thái phía dưới.
class _SliceLabel extends StatelessWidget {
  const _SliceLabel({required this.slice});

  final _PieSlice slice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: slice.color.withValues(alpha: 0.45),
          width: 1,
        ),
      ),
      child: Text(
        '${slice.value}',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: slice.color,
          height: 1.0,
        ),
      ),
    );
  }
}

/// Nhãn hiển thị ở tâm biểu đồ tròn.
class _PieCenterLabel extends StatelessWidget {
  const _PieCenterLabel({required this.total, required this.overdue});

  final int total;
  final int overdue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$total',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.heading,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          'Tổng cộng',
          style: TextStyle(
            fontSize: 10,
            color: AppColors.textTertiaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (overdue > 0) ...[
          const SizedBox(height: 3),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFEB5757).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$overdue quá hạn',
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: Color(0xFFEB5757),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
