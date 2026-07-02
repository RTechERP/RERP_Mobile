import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/salary_model.dart';

class SalaryOverviewItemCard extends StatefulWidget {
  const SalaryOverviewItemCard({super.key, required this.item});

  final SalarySummaryItem item;

  @override
  State<SalaryOverviewItemCard> createState() => _SalaryOverviewItemCardState();
}

class _SalaryOverviewItemCardState extends State<SalaryOverviewItemCard> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = true;
  }

  String _v(dynamic val) {
    if (val == null) return '0';
    if (val is num) return val.toInt().toString();
    if (val is String) {
      if (val.isEmpty) return '0';
      final parsed = num.tryParse(val);
      return parsed?.toInt().toString() ?? '0';
    }
    return '0';
  }

  Color get _accentColor {
    final t = (widget.item.typeText ?? '').toUpperCase();
    if (t.contains('CƠM') || t.contains('ĂN')) return AppColors.warning;
    if (t.contains('NGHỈ')) return AppColors.secondaryERP;
    return AppColors.primaryERP;
  }

  @override
  Widget build(BuildContext context) {
    final it = widget.item;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _accentColor.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                color: _accentColor.withValues(alpha: 0.1),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Icon(Icons.article_outlined, color: _accentColor, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      it.hangMuc ?? '',
                      style: AppStyles.subtitle3.copyWith(color: AppColors.heading, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: _accentColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      it.unit ?? '',
                      style: AppStyles.caption2.copyWith(color: _accentColor, fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: _isExpanded ? 0 : -0.25,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(Icons.keyboard_arrow_down, color: _accentColor, size: 20),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: _buildContent(it),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(SalarySummaryItem it) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
      child: Column(
        children: [
          _buildRow('Đăng ký', _v(it.valueText), 'Duyệt', _v(it.valueTextReal)),
          const SizedBox(height: 8),
          _buildRow('HR duyệt (lần)', _v(it.hrApproved), 'TBP duyệt (lần)', _v(it.tbpApproved)),
          const SizedBox(height: 8),
          _buildRow('HR huỷ ĐK nghỉ (lần)', _v(it.hrCancel), 'TBP huỷ ĐK nghỉ (lần)', _v(it.tbpCancel)),
          const SizedBox(height: 8),
          _buildNote(it.note ?? '-'),
        ],
      ),
    );
  }

  Widget _buildRow(String l1, String v1, String l2, String v2) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l1, style: AppStyles.caption2.copyWith(color: _accentColor, fontSize: 11, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(v1, style: AppStyles.subtitle3.copyWith(color: AppColors.heading, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Container(width: 1, height: 36, color: AppColors.borderColor.withValues(alpha: 0.3)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l2, style: AppStyles.caption2.copyWith(color: _accentColor, fontSize: 11, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(v2, style: AppStyles.subtitle3.copyWith(color: AppColors.heading, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNote(String note) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: _accentColor.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _accentColor.withValues(alpha: 0.15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.sticky_note_2_outlined, color: _accentColor, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text('Ghi chú: $note', style: AppStyles.caption2.copyWith(color: AppColors.label, fontSize: 12, height: 1.4)),
          ),
        ],
      ),
    );
  }
}
