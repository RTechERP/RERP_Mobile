import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../../../../../../common/app_theme/index.dart';


class TimekeepingMonthPicker extends StatefulWidget {
  final DateTime? selectedMonth;
  final void Function(DateTime month) onApply;

  const TimekeepingMonthPicker({
    super.key,
    this.selectedMonth,
    required this.onApply,
  });

  static Future<void> show(
    BuildContext context, {
    DateTime? selectedMonth,
    required void Function(DateTime month) onApply,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => TimekeepingMonthPicker(
        selectedMonth: selectedMonth,
        onApply: onApply,
      ),
    );
  }

  @override
  State<TimekeepingMonthPicker> createState() =>
      _TimekeepingMonthPickerState();
}

class _TimekeepingMonthPickerState extends State<TimekeepingMonthPicker> {
  late DateTime _selectedMonth;

  @override
  void initState() {
    super.initState();
    _selectedMonth = widget.selectedMonth ??
        DateTime(DateTime.now().year, DateTime.now().month);
  }

  @override
  Widget build(BuildContext context) {
    final displayMonth =
        DateFormat('MMMM yyyy', 'vi_VN').format(_selectedMonth);

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.gray.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Chọn tháng',
                    style: AppStyles.subtitle2.copyWith(
                      color: AppColors.heading,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryERP.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      displayMonth,
                      style: AppStyles.body2.copyWith(
                        color: AppColors.primaryERP,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 280,
              child: SfDateRangePicker(
                view: DateRangePickerView.year,
                showNavigationArrow: true,
                selectionMode: DateRangePickerSelectionMode.single,
                initialSelectedDate: _selectedMonth,
                allowViewNavigation: false,
                onSelectionChanged:
                    (DateRangePickerSelectionChangedArgs args) {
                  final date = args.value as DateTime;
                  setState(() {
                    _selectedMonth = DateTime(date.year, date.month);
                  });
                },
                monthFormat: 'MM/yyyy',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.pop(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(color: AppColors.borderColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Huỷ',
                        style: AppStyles.body2.copyWith(
                          color: AppColors.gray,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                        widget.onApply(_selectedMonth);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryERP,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Áp dụng',
                        style: AppStyles.body2.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
