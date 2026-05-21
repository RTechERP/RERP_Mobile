import 'package:flutter/material.dart';

class DateHeader extends StatelessWidget {
  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// inject để test hoặc override
  final DateTime? now;

  /// custom text (optional)
  final String currentLabel;
  final String fromLabel;
  final String toLabel;

  /// custom formatter (nếu muốn dùng intl)
  final String Function(DateTime)? formatter;

  const DateHeader({
    super.key,
    this.dateStart,
    this.dateEnd,
    this.now,
    this.currentLabel = 'Hiện tại',
    this.fromLabel = 'Từ',
    this.toLabel = 'Đến',
    this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    final text = _resolveText();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Text(
          text,
          key: ValueKey(text), // trigger animation khi đổi text
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  String _resolveText() {
    final hasFilter = dateStart != null && dateEnd != null;

    if (hasFilter) {
      final start = dateStart!;
      final end = dateEnd!;

      if (_isSameDay(start, end)) {
        return '$currentLabel: ${_format(start)}';
      }
      return '$fromLabel: ${_format(start)} - $toLabel: ${_format(end)}';
    }

    final current = now ?? DateTime.now();
    return '$currentLabel: ${_format(current)}';
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year &&
        a.month == b.month &&
        a.day == b.day;
  }

  String _format(DateTime d) {
    if (formatter != null) return formatter!(d);

    return '${d.day.toString().padLeft(2, '0')}/'
        '${d.month.toString().padLeft(2, '0')}/'
        '${d.year}';
  }
}