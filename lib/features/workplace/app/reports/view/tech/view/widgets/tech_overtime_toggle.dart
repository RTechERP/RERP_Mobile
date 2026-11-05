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
///
/// Khi người dùng chọn hạng mục trùng với ca làm thêm đã đăng ký trước đó,
/// bloc tự tích "Có làm thêm" và phát tín hiệu `autoOpenOvertimeIndex` →
/// widget này mở luôn bottom sheet để người dùng xem thông tin ca đã có.
class TechOvertimeToggle extends StatefulWidget {
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

  @override
  State<TechOvertimeToggle> createState() => _TechOvertimeToggleState();
}

class _TechOvertimeToggleState extends State<TechOvertimeToggle> {
  /// Bật / bỏ tick "Có làm thêm".
  ///
  /// Bật → mở bottom sheet khai báo ca làm thêm.
  /// Bỏ tick khi đang có ca làm thêm → hỏi xác nhận trước khi xoá toàn bộ.
  Future<void> _handleChanged(BuildContext context, bool? value) async {
    final enabled = value ?? false;
    final bloc = context.read<TechBloc>();

    if (!enabled && widget.report.overtimes.isNotEmpty) {
      final confirmed = await DialogService.showConfirmDialog(
        context: context,
        title: 'Xác nhận xoá ca làm thêm',
        message:
            'Bạn có chắc muốn bỏ "Có làm thêm" không? Toàn bộ ${widget.report.overtimes.length} phiếu làm thêm đã khai báo sẽ bị xoá.',
      );
      if (!confirmed) return;
      if (!context.mounted) return;

      bloc.add(TechEvent.toggleOvertime(index: widget.index, enabled: false));
      return;
    }

    if (!enabled) return;

    bloc.add(TechEvent.toggleOvertime(index: widget.index, enabled: true));

    await openTechOvertimeSheet(
      context: context,
      bloc: bloc,
      workIndex: widget.index,
      reportDate: widget.reportDate,
    );
  }

  /// Hạng mục vừa chọn trùng với ca làm thêm đã đăng ký → mở sheet để xem
  /// thông tin ca đã lấy từ API.
  Future<void> _handleAutoOpen() async {
    final bloc = context.read<TechBloc>();

    // Reset tín hiệu trước khi mở sheet để không mở lặp lại.
    bloc.add(const TechEvent.clearAutoOpenOvertime());

    // Chờ frame kế tiếp để bloc kịp cập nhật danh sách ca trước khi sheet đọc.
    await WidgetsBinding.instance.endOfFrame;
    if (!mounted) return;

    await openTechOvertimeSheet(
      context: context,
      bloc: bloc,
      workIndex: widget.index,
      reportDate: widget.reportDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TechBloc, TechState>(
      listenWhen: (prev, curr) =>
          prev.autoOpenOvertimeIndex != curr.autoOpenOvertimeIndex &&
          curr.autoOpenOvertimeIndex == widget.index,
      listener: (context, state) => _handleAutoOpen(),
      child: CheckboxListTile(
        value: widget.report.hasOvertime,
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
      ),
    );
  }
}
