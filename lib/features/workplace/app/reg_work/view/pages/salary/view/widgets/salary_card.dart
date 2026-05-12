import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';

class SalaryCard extends StatefulWidget {
  const SalaryCard({
    super.key,
    required this.accentColor,
    required this.title,
    required this.icon,
    required this.child,
    this.initiallyExpanded = true,
  });

  final Color accentColor;
  final String title;
  final IconData icon;
  final Widget child;
  final bool initiallyExpanded;

  @override
  State<SalaryCard> createState() => _SalaryCardState();
}

class _SalaryCardState extends State<SalaryCard> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(
            accentColor: widget.accentColor,
            icon: widget.icon,
            title: widget.title,
            isExpanded: _isExpanded,
            onToggle: () => setState(() => _isExpanded = !_isExpanded),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState:
                _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.all(16),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({
    required this.accentColor,
    required this.icon,
    required this.title,
    required this.isExpanded,
    required this.onToggle,
  });

  final Color accentColor;
  final IconData icon;
  final String title;
  final bool isExpanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: accentColor.withValues(alpha: 0.06),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          border: Border(
            top: BorderSide(color: accentColor, width: 2),
            left: BorderSide(color: accentColor, width: 2),
            right: BorderSide(color: accentColor, width: 2),
            bottom: BorderSide.none,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: accentColor, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: AppStyles.subtitle3.copyWith(
                  color: AppColors.heading,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            AnimatedRotation(
              turns: isExpanded ? 0 : -0.25,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: accentColor,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalaryInfoRow extends StatelessWidget {
  const SalaryInfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.gray.withValues(alpha: 0.6),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: AppStyles.body2.copyWith(
                color: AppColors.gray,
                fontSize: 12,
              ),
            ),
          ),
          Text(
            value,
            style: AppStyles.body2.copyWith(
              color: AppColors.heading,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class SalaryCalcRow extends StatelessWidget {
  const SalaryCalcRow({
    super.key,
    required this.label,
    required this.value,
    required this.formula,
    this.isBold = false,
  });

  final String label;
  final String value;
  final String formula;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: AppStyles.body2.copyWith(
                color: AppColors.gray,
                fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
          if (formula.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              decoration: BoxDecoration(
                color: AppColors.gray.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                formula,
                style: AppStyles.caption2.copyWith(
                  color: AppColors.gray,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          Text(
            '$value đ',
            style: AppStyles.body2.copyWith(
              color: isBold ? AppColors.heading : AppColors.gray,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class SalaryOvertimeRow extends StatelessWidget {
  const SalaryOvertimeRow({
    super.key,
    required this.label,
    required this.hours,
    required this.amount,
    required this.multiplier,
    required this.formula,
    required this.nf,
    required this.color,
  });

  final String label;
  final double hours;
  final double amount;
  final String multiplier;
  final String formula;
  final NumberFormat nf;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: AppStyles.body2.copyWith(
              color: AppColors.gray,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _SalaryOvertimeChip(
          label: 'Số giờ',
          value: '${nf.format(hours.round())}h',
          formula: formula.split(',')[0],
          color: color,
        ),
        const SizedBox(width: 8),
        _SalaryOvertimeChip(
          label: 'Thành tiền',
          value: '${nf.format(amount.round())} đ',
          formula: formula.split(',').length > 1
              ? formula.split(',')[1].trim()
              : formula,
          multiplier: multiplier,
          color: color,
          isAmount: true,
        ),
      ],
    );
  }
}

class _SalaryOvertimeChip extends StatelessWidget {
  const _SalaryOvertimeChip({
    required this.label,
    required this.value,
    required this.formula,
    required this.color,
    this.multiplier,
    this.isAmount = false,
  });

  final String label;
  final String value;
  final String formula;
  final Color color;
  final String? multiplier;
  final bool isAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment:
            isAmount ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppStyles.caption2.copyWith(
              color: AppColors.gray,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 1),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                formula,
                style: AppStyles.caption2.copyWith(
                  color: color.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
              if (multiplier != null)
                Container(
                  margin: const EdgeInsets.only(left: 3),
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    multiplier!,
                    style: AppStyles.caption2.copyWith(
                      color: color,
                      fontWeight: FontWeight.w700,
                      fontSize: 9,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 1),
          Text(
            value,
            style: AppStyles.body2.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
