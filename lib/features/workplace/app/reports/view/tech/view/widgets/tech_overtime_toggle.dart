import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../data/tech_model.dart';
import '../bloc/tech_bloc.dart';
import 'tech_overtime_sheet.dart';

/// Tick "Có làm thêm" cho một hạng mục công việc trong báo cáo kỹ thuật.
///
/// Bật tick → mở bottom sheet khai báo ca làm thêm (Ca 1 mặc định 18:00 - 20:00).
/// Bỏ tick khi đang có ca làm thêm → hỏi xác nhận trước khi xoá toàn bộ.
/// Giá trị luôn lấy từ bloc nên đồng bộ với các ca làm thêm đã tải về.
class TechOvertimeToggle extends StatelessWidget {
  const TechOvertimeToggle({
    super.key,
    required this.report,
    required this.index,
    required this.reportDate,
  });

  /// Hạng mục công việc hiện tại.
  final TechWork report;

  /// Index của hạng mục trong danh sách works (dùng để dispatch event).
  final int index;

  /// Ngày báo cáo — dùng làm mốc cho các mốc giờ làm thêm.
  final DateTime reportDate;

  /// Bật / bỏ tick "Có làm thêm".
  ///
  /// Bật → mở bottom sheet khai báo ca làm thêm.
  /// Bỏ tick khi đang có ca làm thêm → hỏi xác nhận trước khi xoá toàn bộ.
  Future<void> _handleChanged(BuildContext context, bool? value) async {
    final enabled = value ?? false;
    final bloc = context.read<TechBloc>();

    if (!enabled && report.overtimes.isNotEmpty) {
      final confirmed = await DialogService.showConfirmDialog(
        context: context,
        title: 'Xác nhận xoá ca làm thêm',
        message:
            'Bạn có chắc muốn bỏ "Có làm thêm" không? Toàn bộ ${report.overtimes.length} phiếu làm thêm đã khai báo sẽ bị xoá.',
      );
      if (!confirmed) return;
      if (!context.mounted) return;

      bloc.add(TechEvent.toggleOvertime(index: index, enabled: false));
      return;
    }

    if (!enabled) return;

    bloc.add(TechEvent.toggleOvertime(index: index, enabled: true));

    await openTechOvertimeSheet(
      context: context,
      bloc: bloc,
      workIndex: index,
      reportDate: reportDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: report.hasOvertime,
      onChanged: (value) => _handleChanged(context, value),
      title: const Text(
        'Có làm thêm',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.primaryERP,
      checkColor: Colors.white,
      dense: true,
    );
  }
}