import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../bloc/salary_bloc.dart';
import 'salary_card.dart';

class SalaryTaxDeductionSection extends StatefulWidget {
  const SalaryTaxDeductionSection({
    super.key,
    required this.state,
    required this.nf,
    this.initiallyExpanded = true,
  });

  final SalaryState state;
  final NumberFormat nf;
  final bool initiallyExpanded;

  @override
  State<SalaryTaxDeductionSection> createState() =>
      _SalaryTaxDeductionSectionState();
}

class _SalaryTaxDeductionSectionState extends State<SalaryTaxDeductionSection> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final nf = widget.nf;
    final state = widget.state;
    String f(num n) => '${nf.format(n.round())}đ';

    return Container(
      decoration: BoxDecoration(
        color: AppColors.stateInfoColor.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.stateInfoColor.withValues(alpha: 0.15)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12)),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.secondaryERP.withValues(alpha: 0.06),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                border: const Border(
                  bottom: BorderSide(color: AppColors.secondaryERP, width: 1.5),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryERP.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.call_split,
                      color: AppColors.secondaryERP,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Các khoản giảm trừ thuế TNCN',
                            style: AppStyles.subtitle3.copyWith(
                              color: AppColors.heading,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            '(40) → (44)',
                            textAlign: TextAlign.end,
                            style: AppStyles.body2.copyWith(
                              color: AppColors.stateInfoColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: _isExpanded ? 0 : -0.25,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.stateInfoColor,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            height: _isExpanded ? null : 0,
            clipBehavior: Clip.none,
            child: _isExpanded
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
                    child: Column(
                      children: [
                        const Divider(height: 16, color: AppColors.borderColor),
                        SalaryRow(
                          color: AppColors.stateInfoColor,
                          highlightFirstColumn: true,
                          highlightMiddleColumn: true,
                          highlightLastColumn: true,
                          items: [
                            SalaryRowItem(
                              label: 'Lương BHXH (10.5%)',
                              value: f(state.insurances),
                              formula: '(39)',
                              highlightBg: false,
                            ),
                            SalaryRowItem(
                              label: 'Lương làm thêm',
                              value: f(state.taxSalaryOT),
                              formula: '(40)',
                              highlightBg: false,
                            ),
                            SalaryRowItem(
                              label: 'PC cơm ca',
                              value: f(state.taxSalaryMeal),
                              formula: '(41)',
                              highlightBg: false,
                            ),

                          ],
                        ),
                        const SizedBox(height: 6),
                        SalaryRow(
                          color: AppColors.stateInfoColor,
                          highlightFirstColumn: true,
                          highlightMiddleColumn: true,
                          highlightLastColumn: true,
                          items: [
                            SalaryRowItem(
                              label: 'PC điện thoại',
                              value: f(state.taxSalaryPhone),
                              formula: '(42)',
                              highlightBg: false,
                            ),
                            SalaryRowItem(
                              label: 'Giảm trừ bản thân',
                              value: f(state.taxPersonalDeduction),
                              formula: '(43)',
                              highlightBg: false,
                            ),
                            SalaryRowItem(
                              label: 'Giảm trừ người phụ thuộc',
                              value: f(state.taxDependentsDeduction),
                              formula: '(44)',
                              highlightBg: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
