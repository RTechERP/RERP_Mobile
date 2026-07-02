import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../app_theme/index.dart';

class DateRangePicker extends StatefulWidget {
  final DateTime? initialStart;
  final DateTime? initialEnd;
  final void Function(DateTime start, DateTime end) onApply;

  const DateRangePicker({
    super.key,
    this.initialStart,
    this.initialEnd,
    required this.onApply,
  });

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTime? _start;
  DateTime? _end;
  DateTime _currentMonth = DateTime.now();

  @override
  void initState() {
    super.initState();
    _start = widget.initialStart;
    _end = widget.initialEnd;
    _currentMonth = widget.initialStart ?? DateTime.now();
  }

  void _handleApply() {
    if (_start == null) return;
    final s = _start!;
    final e = _end ?? _start!;
    final from = s.isBefore(e) ? s : e;
    final to = s.isBefore(e) ? e : s;
    Navigator.pop(context);
    widget.onApply(from, to);
  }

  String _formatDate(DateTime d) {
    return '${d.day.toString().padLeft(2, '0')}/'
        '${d.month.toString().padLeft(2, '0')}/${d.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDragHandle(),
            _buildTitle(),
            _buildSelectedRange(),
            _buildDatePicker(),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildDragHandle() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: AppColors.gray.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        'Chọn ngày / khoảng ngày',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.heading,
        ),
      ),
    );
  }

  Widget _buildSelectedRange() {
    if (_start == null) return const SizedBox(height: 20);

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        _end != null && _start != _end
            ? '${_formatDate(_start!)} - ${_formatDate(_end!)}'
            : 'Ngày: ${_formatDate(_start!)}',
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryERP,
        ),
      ),
    );
  }
  Widget _buildDatePicker() {
    return SizedBox(
      height: 300,
      child: SfDateRangePickerTheme(
        data: SfDateRangePickerThemeData(
          backgroundColor: Colors.transparent,
          headerBackgroundColor: Colors.transparent,
          headerTextStyle: const TextStyle(
            color: AppColors.heading,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          viewHeaderBackgroundColor: AppColors.background,
          viewHeaderTextStyle: const TextStyle(
            color: AppColors.heading,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          todayHighlightColor: AppColors.primaryERP,
          todayTextStyle: const TextStyle(
            color: AppColors.primaryERP,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          todayCellTextStyle: const TextStyle(
            color: AppColors.primaryERP,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          selectionColor: AppColors.orangeA100,
          selectionTextStyle: const TextStyle(
            color: AppColors.primaryERP,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          startRangeSelectionColor: AppColors.blueA100,
          endRangeSelectionColor: AppColors.blueA100,
          rangeSelectionColor: AppColors.blueA100,
          rangeSelectionTextStyle: const TextStyle(
            color: AppColors.primaryERP,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          activeDatesTextStyle: const TextStyle(
            color: AppColors.heading,
            fontSize: 13,
          ),
          disabledDatesTextStyle: const TextStyle(
            color: AppColors.hintText,
            fontSize: 13,
          ),
          weekendDatesTextStyle: const TextStyle(
            color: AppColors.alert,
            fontSize: 13,
          ),
          leadingDatesTextStyle: const TextStyle(
            color: AppColors.text,
            fontSize: 13,
          ),
          trailingDatesTextStyle: const TextStyle(
            color: AppColors.text,
            fontSize: 13,
          ),
          specialDatesTextStyle: const TextStyle(
            color: AppColors.secondaryERP,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          blackoutDatesTextStyle: const TextStyle(
            color: AppColors.gray,
            fontSize: 13,
            decoration: TextDecoration.lineThrough,
          ),
          cellTextStyle: const TextStyle(
            color: AppColors.heading,
            fontSize: 13,
          ),
          disabledCellTextStyle: const TextStyle(
            color: AppColors.hintText,
            fontSize: 13,
          ),
          leadingCellTextStyle: const TextStyle(
            color: AppColors.text,
            fontSize: 13,
          ),
          weekNumberBackgroundColor: AppColors.background,
          weekNumberTextStyle: const TextStyle(
            color: AppColors.label,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        child: SfDateRangePicker(
          selectionMode: DateRangePickerSelectionMode.range,
          showNavigationArrow: false,
          allowViewNavigation: true,
          initialDisplayDate: _currentMonth,
          initialSelectedRange: (_start != null && _end != null)
              ? PickerDateRange(_start, _end)
              : null,
          onSelectionChanged: (args) {
            setState(() {
              final range = args.value as PickerDateRange?;
              _start = range?.startDate;
              _end = range?.endDate ?? range?.startDate;
            });
          },
          onViewChanged: (details) {
            final visibleDate = details.visibleDateRange.startDate;
            if (visibleDate != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                setState(() {
                  _currentMonth = DateTime(
                    visibleDate.year,
                    visibleDate.month,
                    1,
                  );
                });
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.gray,
                side: const BorderSide(color: AppColors.borderColor),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Huỷ'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: _start != null ? _handleApply : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                disabledBackgroundColor: AppColors.supportBtn,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Áp dụng',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
