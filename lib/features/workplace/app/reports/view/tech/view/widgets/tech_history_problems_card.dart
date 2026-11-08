// Widget hiển thị các phát sinh trong quá khứ của hạng mục công việc.
//
// API: `GET /DailyReportTech/get-project-history-problem-by-project-item`
//
// Đây là **UI riêng**, dữ liệu phát sinh chỉ để đọc tham khảo — KHÔNG điền vào
// các trường "Vấn đề phát sinh / Hướng giải quyết / Tồn đọng / Ghi chú" của
// báo cáo.
//
// Card theo hạng mục đang thao tác trên form:
// - API trả về có phát sinh → tự mở và liệt kê ngay, không cần người dùng bấm.
// - API trả về rỗng → ẩn hẳn để form không bị rối.
//
// Dữ liệu được cache trong bloc theo `projectItemId` nên đổi qua lại giữa các
// hạng mục không gọi lại API.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../data/tech_problem_status.dart';
import '../bloc/tech_bloc.dart';

/// Card phát sinh của hạng mục công việc đang thao tác.
class TechHistoryProblemsCard extends StatefulWidget {
  const TechHistoryProblemsCard({super.key});

  @override
  State<TechHistoryProblemsCard> createState() =>
      _TechHistoryProblemsCardState();
}

class _TechHistoryProblemsCardState extends State<TechHistoryProblemsCard> {
  /// Card đang mở hay đang thu gọn (tự mở khi API trả về có phát sinh).
  bool _expanded = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _sync(context.read<TechBloc>().state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TechBloc, TechState>(
      listenWhen: (prev, curr) =>
          prev.focusedProjectItemId != curr.focusedProjectItemId ||
          prev.historyProblems != curr.historyProblems,
      listener: (context, state) => _sync(state),
      buildWhen: (prev, curr) =>
          prev.focusedProjectItemId != curr.focusedProjectItemId ||
          prev.focusedProjectItemLabel != curr.focusedProjectItemLabel ||
          prev.historyProblems != curr.historyProblems,
      builder: (context, state) {
        final projectItemId = state.focusedProjectItemId ?? 0;
        if (projectItemId <= 0) return const SizedBox.shrink();

        final problems = state.historyProblems[projectItemId];

        // Chưa có dữ liệu hoặc hạng mục không có phát sinh → không chiếm chỗ.
        if (problems == null || problems.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(
                label: state.focusedProjectItemLabel,
                count: problems.length,
              ),
              if (_expanded) ...[
                const Divider(height: 1, color: AppColors.borderColor),
                for (var i = 0; i < problems.length; i++) ...[
                  if (i > 0)
                    const Divider(
                      height: 1,
                      indent: 12,
                      endIndent: 12,
                      color: AppColors.borderColor,
                    ),
                  _ProblemItem(problem: problems[i]),
                ],
              ],
            ],
          ),
        );
      },
    );
  }

  /// Tải phát sinh của hạng mục đang focus nếu chưa có cache, và tự mở card
  /// khi API đã trả về dữ liệu để người dùng thấy ngay.
  void _sync(TechState state) {
    final projectItemId = state.focusedProjectItemId ?? 0;
    if (projectItemId <= 0) return;

    final problems = state.historyProblems[projectItemId];

    // Chưa có dữ liệu → gọi API (bloc tự bỏ qua nếu đang tải hoặc đã cache).
    if (problems == null) {
      context.read<TechBloc>().add(
        TechEvent.loadHistoryProblems(projectItemId: projectItemId),
      );
      return;
    }

    // API trả về có phát sinh → mở card ngay, không cần người dùng bấm.
    if (problems.isNotEmpty && !_expanded) {
      setState(() => _expanded = true);
    }
  }

  /// Header: tiêu đề + số phát sinh + tên hạng mục + nút mở/đóng.
  Widget _buildHeader({required String? label, required int count}) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => setState(() => _expanded = !_expanded),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.pending_actions_outlined,
                size: 16,
                color: AppColors.warning,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Phát sinh',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.neutralText,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.warning.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '$count',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppColors.warning,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Tên hạng mục đang xem phát sinh — giãn theo độ dài tên.
                  if (label != null && label.trim().isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 11,
                        height: 1.3,
                        color: AppColors.hintText,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              _expanded
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              size: 20,
              color: AppColors.gray,
            ),
          ],
        ),
      ),
    );
  }
}

/// Hiển thị 1 phát sinh của hạng mục.
class _ProblemItem extends StatelessWidget {
  const _ProblemItem({required this.problem});

  final ProjectHistoryProblem problem;

  @override
  Widget build(BuildContext context) {
    final content = (problem.contentError ?? '').trim();
    final statusColor = _statusColor(problem.statusProblem);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vạch màu bên trái thể hiện trạng thái xử lý của phát sinh.
          Container(
            width: 3,
            height: 30,
            margin: const EdgeInsets.only(top: 2, right: 10),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Nội dung phát sinh (trái) + trạng thái (phải) ──
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        content.isEmpty ? 'Không có mô tả phát sinh' : content,
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.3,
                          fontWeight: FontWeight.w600,
                          color: AppColors.neutralText,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _Tag(
                      icon: Icons.autorenew_rounded,
                      text: _statusLabel(problem.statusProblem),
                      color: statusColor,
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // ── Nguyên nhân / Biện pháp / Kết luận ──
                _detail('Nguyên nhân', problem.reason),
                _detail('Biện pháp', problem.remedies),
                _detail('Kết luận', problem.issueConclusion),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Hiển thị 1 dòng chi tiết (bỏ qua nếu giá trị rỗng).
  ///
  /// Label cố định bên trái, nội dung bên phải — gọn hơn so với xếp dọc.
  Widget _detail(String label, String? value) {
    final text = (value ?? '').trim();
    if (text.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 76,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.label,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                height: 1.35,
                color: AppColors.textSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Nhãn trạng thái xử lý phát sinh.
  static String _statusLabel(int? status) => TechProblemStatus.label(status);

  /// Màu theo trạng thái xử lý phát sinh.
  static Color _statusColor(int? status) {
    switch (status) {
      case 1:
        return AppColors.warning;
      case 2:
        return AppColors.primaryERP;
      case 3:
        return AppColors.stateSuccessColor;
      case 4:
        return AppColors.gray;
      case 0:
      default:
        return AppColors.alert;
    }
  }
}

/// Tag nhỏ hiển thị trạng thái xử lý.
class _Tag extends StatelessWidget {
  const _Tag({required this.icon, required this.text, required this.color});

  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 10, color: color),
          const SizedBox(width: 3),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
