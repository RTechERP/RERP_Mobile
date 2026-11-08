// Tóm tắt các ca làm thêm đã khai báo cho một hạng mục công việc.
//
// Mỗi ca hiển thị gọn trong 1 chip: `Ca n (giờ bắt đầu - giờ kết thúc)` kèm icon
// phụ cấp ăn tối (nếu có) và icon xoá. Bấm vào 1 chip sẽ mở lại bottom sheet tại
// ca đó; bấm icon xoá sẽ hỏi xác nhận trước khi xoá.
//
// Chi tiết nhập liệu của từng ca nằm trong bottom sheet
// `tech_overtime_sheet.dart`.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../data/tech_model.dart';
import '../bloc/tech_bloc.dart';
import 'tech_overtime_sheet.dart';

/// Danh sách ca làm thêm đã khai báo, hiển thị gọn dạng chip trên màn báo cáo.
class TechOvertimeSection extends StatelessWidget {
  const TechOvertimeSection({
    super.key,
    required this.work,
    required this.workIndex,
    required this.reportDate,
  });

  /// Hạng mục công việc hiện tại.
  final TechWork work;

  /// Index của hạng mục trong danh sách works (dùng để dispatch event).
  final int workIndex;

  /// Ngày báo cáo — dùng làm mốc cho các mốc giờ làm thêm.
  final DateTime reportDate;

  @override
  Widget build(BuildContext context) {
    final sessions = work.overtimes;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Các ca nằm cùng 1 hàng ngang để tiết kiệm diện tích.
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < sessions.length; i++) ...[
                if (i > 0) const SizedBox(width: 8),
                _OvertimeShiftChip(
                  key: ValueKey('ot_chip_${sessions[i].id}_$i'),
                  session: sessions[i],
                  sessionIndex: i,
                  workIndex: workIndex,
                  reportDate: reportDate,
                ),
              ],
            ],
          ),
        ),
        BlocSelector<TechBloc, TechState, int>(
          selector: (state) => state.deletedOvertimes.length,
          builder: (context, deletedCount) {
            if (deletedCount == 0) return const SizedBox.shrink();

            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Có $deletedCount ca làm thêm đã xoá sẽ được gửi xoá mềm khi lưu.',
                style: const TextStyle(fontSize: 11, color: AppColors.hintText),
              ),
            );
          },
        ),
      ],
    );
  }
}

/// Chip tóm tắt 1 ca làm thêm: `Ca n (HH:mm - HH:mm)`.
class _OvertimeShiftChip extends StatelessWidget {
  const _OvertimeShiftChip({
    super.key,
    required this.session,
    required this.sessionIndex,
    required this.workIndex,
    required this.reportDate,
  });

  final OvertimeSession session;
  final int sessionIndex;
  final int workIndex;
  final DateTime reportDate;

  /// Xoá ca làm thêm.
  ///
  /// Chỉ hỏi xác nhận khi đây là phiếu cuối cùng (xoá hết phiếu làm thêm →
  /// "Có làm thêm" cũng được bỏ chọn). Xoá 1 phiếu trong nhiều phiếu thì
  /// xoá trực tiếp, không hỏi.
  Future<void> _confirmRemove(BuildContext context) async {
    final bloc = context.read<TechBloc>();
    final works = bloc.state.selectedProject?.works ?? const <TechWork>[];
    final total = workIndex < works.length
        ? works[workIndex].overtimes.length
        : 0;

    if (total <= 1) {
      final confirmed = await DialogService.showConfirmDialog(
        context: context,
        title: 'Xác nhận xoá ca làm thêm',
        message:
            'Bạn có chắc muốn xoá ca làm thêm này không? "Có làm thêm" sẽ được bỏ chọn.',
      );
      if (!confirmed) return;
      if (!context.mounted) return;
    }

    bloc.add(
      TechEvent.removeOvertimeSession(
        index: workIndex,
        sessionIndex: sessionIndex,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TechBloc>();

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => openTechOvertimeSheet(
        context: context,
        bloc: bloc,
        workIndex: workIndex,
        reportDate: reportDate,
        initialTabIndex: sessionIndex,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primaryERP.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primaryERP.withValues(alpha: 0.4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Tên ca nằm trên 1 dòng, khung giờ + số giờ nằm ở dòng dưới.
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ca ${sessionIndex + 1}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryERP,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${_formatTime(session.timeStart)} - '
                      '${_formatTime(session.endTime)}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryERP,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${_formatHours(session.timeReality)}h',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryERP,
                      ),
                    ),
                    if (session.overnight) ...[
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.restaurant_rounded,
                        size: 14,
                        color: AppColors.warning,
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(width: 6),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => _confirmRemove(context),
              child: const Padding(
                padding: EdgeInsets.all(2),
                child: Icon(
                  Icons.delete_outline,
                  size: 16,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Định dạng giờ `HH:mm`.
  static String _formatTime(DateTime? time) {
    if (time == null) return '--:--';
    return DateFormat('HH:mm').format(time);
  }

  /// Định dạng số giờ — bỏ phần thập phân 0 (VD: 2 → `2`, 2.5 → `2,5`).
  static String _formatHours(double value) {
    if (value <= 0) return '0';
    if (value == value.toInt()) return value.toInt().toString();
    return value.toString().replaceFirst('.', ',');
  }
}
