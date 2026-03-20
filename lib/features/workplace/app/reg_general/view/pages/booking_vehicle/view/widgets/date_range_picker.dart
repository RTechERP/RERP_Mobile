import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
  DateTime? start;
  DateTime? end;

  @override
  void initState() {
    super.initState();
    start = widget.initialStart;
    end = widget.initialEnd;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 420,
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Text(
              'Chọn ngày / khoảng ngày',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.range,
                // ❌ bỏ minDate / maxDate
                initialSelectedRange: (start != null && end != null)
                    ? PickerDateRange(start, end)
                    : null,
                onSelectionChanged: (args) {
                  final range = args.value as PickerDateRange?;
                  setState(() {
                    start = range?.startDate;
                    end = range?.endDate ?? range?.startDate;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Huỷ'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (start != null && end != null)
                          ? () {
                        Navigator.pop(context);
                        widget.onApply(start!, end!);
                      }
                          : null,
                      child: const Text('Áp dụng'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}