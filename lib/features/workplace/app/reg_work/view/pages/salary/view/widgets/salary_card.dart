import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

class SalaryCard extends StatefulWidget {
  const SalaryCard({
    super.key,
    required this.accentColor,
    required this.title,
    required this.icon,
    required this.child,
    this.formula,
    this.formulaDesc,
    this.collapsed = false,
    this.onDetailTap,
  });

  final Color accentColor;
  final String title;
  final IconData icon;
  final Widget child;
  final String? formula;
  final String? formulaDesc;
  final bool collapsed;
  final VoidCallback? onDetailTap;

  @override
  State<SalaryCard> createState() => _SalaryCardState();
}

class _SalaryCardState extends State<SalaryCard> {
  late bool _isCollapsed;

  @override
  void initState() {
    super.initState();
    _isCollapsed = widget.collapsed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
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
            formula: widget.formula,
            formulaDesc: widget.formulaDesc,
            isCollapsed: _isCollapsed,
            onToggle: () => setState(() => _isCollapsed = !_isCollapsed),
            onDetailTap: widget.onDetailTap,
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: _isCollapsed
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
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
    required this.isCollapsed,
    required this.onToggle,
    this.formula,
    this.formulaDesc,
    this.onDetailTap,
  });

  final Color accentColor;
  final IconData icon;
  final String title;
  final bool isCollapsed;
  final VoidCallback onToggle;
  final String? formula;
  final String? formulaDesc;
  final VoidCallback? onDetailTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: accentColor.withValues(alpha: 0.06),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          border: Border(bottom: BorderSide(color: accentColor, width: 1.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                  flex: 10,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          title,
                          style: AppStyles.subtitle3.copyWith(
                            color: AppColors.heading,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (formula != null)
                        Expanded(
                          flex: 4,
                          child: Text(
                            formula!,
                            textAlign: TextAlign.end,
                            style: AppStyles.body2.copyWith(
                              color: accentColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                if (onDetailTap != null)
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: onDetailTap,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          Icons.info_outline,
                          color: accentColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                AnimatedRotation(
                  turns: isCollapsed ? -0.25 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: accentColor,
                    size: 22,
                  ),
                ),
              ],
            ),
            if (formulaDesc != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: accentColor.withValues(alpha: 0.15),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calculate_outlined,
                      color: accentColor,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        formulaDesc!,
                        softWrap: true,
                        style: AppStyles.caption2.copyWith(
                          color: AppColors.gray,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class SalaryInfoRow extends StatelessWidget {
  const SalaryInfoRow({super.key, required this.label, required this.value});

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
            child: Center(
              child: Text(
                label,
                style: AppStyles.body2.copyWith(
                  color: AppColors.gray,
                  fontSize: 12,
                ),
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

class SalaryRow extends StatelessWidget {
  const SalaryRow({
    super.key,
    required this.items,
    required this.color,
    this.highlightFirstColumn = false,
    this.highlightMiddleColumn = false,
    this.highlightLastColumn = true,
  });

  final List<SalaryRowItem> items;
  final Color color;
  final bool highlightFirstColumn;
  final bool highlightMiddleColumn;
  final bool highlightLastColumn;

  bool _isHighlighted(int index) {
    final isFirst = index == 0;
    final isLast = index == items.length - 1;
    final isMiddle = !isFirst && !isLast;
    return (highlightFirstColumn && isFirst) ||
        (highlightMiddleColumn && isMiddle) ||
        (highlightLastColumn && isLast);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < items.length; i++) ...[
              if (i > 0) Container(width: 1, color: AppColors.borderColor),
              Expanded(
                child: _SalaryCell(
                  item: items[i],
                  color: color,
                  isHighlighted: _isHighlighted(i),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SalaryCell extends StatelessWidget {
  const _SalaryCell({
    required this.item,
    required this.color,
    required this.isHighlighted,
  });

  final SalaryRowItem item;
  final Color color;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    final showBg = isHighlighted && item.highlightBg;

    return Container(
      color: showBg ? color.withValues(alpha: 0.06) : null,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLabel(),
          if (item.formula != null) ...[
            const SizedBox(height: 3),
            Text(
              item.formula!,
              textAlign: TextAlign.center,
              style: AppStyles.caption2.copyWith(
                color: isHighlighted ? color : AppColors.gray,
                fontWeight: FontWeight.w700,
                fontSize: 9,
                height: 1.2,
              ),
            ),
          ],
          const SizedBox(height: 2),
          Text(
            item.value,
            textAlign: TextAlign.center,
            style: AppStyles.body2.copyWith(
              color: showBg ? color : AppColors.heading,
              fontWeight: showBg ? FontWeight.w700 : FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  /// Label luôn chiếm không gian cố định để formula 2 cột đồng đều nhau.
  Widget _buildLabel() {
    return SizedBox(
      height: 28,
      child: Center(
        child: Text(
          item.label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.caption2.copyWith(
            color: AppColors.gray,
            fontSize: 10,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}

class SalaryRowItem {
  const SalaryRowItem({
    required this.label,
    required this.value,
    this.formula,
    this.highlightBg = true,
  });

  final String label;
  final String value;
  final String? formula;
  final bool highlightBg;
}
