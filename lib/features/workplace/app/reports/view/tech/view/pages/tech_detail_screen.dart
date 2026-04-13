// Date: 13/04/2026 - Dev: Claude
// Nội dung/Chức năng: Màn chi tiết báo cáo tech - UI/UX hiện đại, rõ ràng

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../../../../../../../routes/route_names.dart';
import '../bloc/tech_bloc.dart';

class TechDetailScreen extends StatefulWidget {
  const TechDetailScreen({super.key});

  @override
  State<TechDetailScreen> createState() => _TechDetailScreenState();
}

class _TechDetailScreenState
    extends BaseState<TechDetailScreen, TechEvent, TechState, TechBloc> {
  int? _dailyId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra;

      if (extra is int) {
        _dailyId = extra;
        bloc.add(TechEvent.selectReport(dailyID: _dailyId!));
      }
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(title: const Text('Chi tiết báo cáo')),
      body: BlocBuilder<TechBloc, TechState>(
        builder: (context, state) {
          if (state.isLoadingDetail) {
            return const Center(child: CircularProgressIndicator());
          }

          final detail = state.selectedReportDetail;

          if (detail == null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImages.missing, width: 320),
                  const SizedBox(height: 12),
                  const Text('Không có báo cáo'),
                ],
              ),
            );
          }

          final progress = (detail.percentComplete / 100).clamp(0.0, 1.0);
          final percent = (progress * 100).round();
          final progressColor = _progressColor(percent);

          final dateDt = DateTime.tryParse(detail.dateReport);
          final weekdays = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
          final dateLabel = dateDt != null
              ? '${weekdays[dateDt.weekday - 1]}, ngày ${dateDt.day.toString().padLeft(2, '0')}/${dateDt.month.toString().padLeft(2, '0')}/${dateDt.year}'
              : detail.dateReport;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    children: [
                      // ===== HEADER CARD =====
                      _HeaderCard(
                        dateLabel: dateLabel,
                        percent: percent,
                        progress: progress,
                        progressColor: progressColor,
                        totalHours: detail.totalHours.toInt(),
                        totalOT: detail.totalHourOT.toInt(),
                        location: detail.location,
                      ),

                      const SizedBox(height: 16),

                      // ===== CONTENT SECTION =====
                      _SectionCard(
                        title: 'Nội dung công việc',
                        icon: Icons.assignment_outlined,
                        iconColor: AppColors.primaryERP,
                        content: detail.content,
                      ),

                      const SizedBox(height: 12),

                      // ===== RESULTS SECTION =====
                      _SectionCard(
                        title: 'Kết quả công việc',
                        icon: Icons.check_circle_outline,
                        iconColor: AppColors.success,
                        content: detail.results,
                      ),

                      const SizedBox(height: 12),

                      // ===== PLAN NEXT DAY =====
                      _SectionCard(
                        title: 'Kế hoạch ngày tiếp theo',
                        icon: Icons.calendar_month_outlined,
                        iconColor: AppColors.secondaryERP,
                        content: detail.planNextDay,
                      ),

                      const SizedBox(height: 12),

                      // ===== BACKLOG & ISSUE SECTION =====
                      _IssueCard(
                        backlog: detail.backlog,
                        problem: detail.problem,
                        problemSolve: detail.problemSolve,
                        note: detail.note,
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),

              // ===== BOTTOM EDIT BUTTON =====
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha:0.06),
                      blurRadius: 12,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryERP,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () async {
                      final result = await context.push(
                        RouteNames.reportITdepartEdit,
                        extra: _dailyId,
                      );

                      if (result == true && context.mounted) {
                        context.pop(true);
                      }
                    },
                    child: const Text(
                      'Sửa báo cáo',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Color _progressColor(int percent) {
    if (percent >= 80) return AppColors.success;
    if (percent >= 50) return AppColors.warning;
    if (percent > 0) return AppColors.alert;
    return Colors.grey;
  }
}

// ===== HEADER CARD =====
class _HeaderCard extends StatelessWidget {
  const _HeaderCard({
    required this.dateLabel,
    required this.percent,
    required this.progress,
    required this.progressColor,
    required this.totalHours,
    required this.totalOT,
    required this.location,
  });

  final String dateLabel;
  final int percent;
  final double progress;
  final Color progressColor;
  final int totalHours;
  final int totalOT;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Date + progress ring row
            Row(
              children: [
                // Date info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                            size: 14,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            dateLabel,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _StatBadge(
                        icon: Icons.access_time,
                        label: 'Giờ làm',
                        value: '${totalHours}h',
                      ),
                      const SizedBox(height: 8),
                      _StatBadge(
                        icon: Icons.more_time,
                        label: 'OT',
                        value: '${totalOT}h',
                      ),
                      if (location.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        _StatBadge(
                          icon: Icons.location_on_outlined,
                          label: 'Địa điểm',
                          value: location,
                        ),
                      ],
                    ],
                  ),
                ),

                // Progress ring
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 8,
                          backgroundColor: Colors.black.withValues(alpha: 0.2),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            progressColor,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$percent%',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            'Hoàn thành',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  const _StatBadge({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 14),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// ===== SECTION CARD =====
class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.content,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: iconColor, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1, color: Color(0xFFF0F0F5)),
            const SizedBox(height: 12),
            Text(
              content.isNotEmpty ? content : '— Không có nội dung',
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: content.isNotEmpty
                    ? const Color(0xFF2C2C2E)
                    : AppColors.hintText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== ISSUE CARD (backlog, problem, solve, note) =====
class _IssueCard extends StatelessWidget {
  const _IssueCard({
    required this.backlog,
    required this.problem,
    required this.problemSolve,
    required this.note,
  });

  final String backlog;
  final String problem;
  final String problemSolve;
  final String note;

  bool get _hasAnyIssue =>
      backlog.isNotEmpty ||
      problem.isNotEmpty ||
      problemSolve.isNotEmpty ||
      note.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          if (_hasAnyIssue) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: AppColors.alert.withValues(alpha:0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.warning_amber_outlined,
                      color: AppColors.alert,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Phát sinh & Tồn đọng',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1C1E),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFF0F0F5)),
          ],
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                if (backlog.isNotEmpty)
                  _IssueRow(label: 'Tồn đọng', value: backlog, color: AppColors.warning),
                if (problem.isNotEmpty)
                  _IssueRow(label: 'Vấn đề phát sinh', value: problem, color: AppColors.alert),
                if (problemSolve.isNotEmpty)
                  _IssueRow(label: 'Giải pháp', value: problemSolve, color: AppColors.success),
                if (note.isNotEmpty)
                  _IssueRow(label: 'Ghi chú', value: note, color: AppColors.label),
                if (!_hasAnyIssue)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Không có tồn đọng hay vấn đề phát sinh',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.hintText,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IssueRow extends StatelessWidget {
  const _IssueRow({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 14,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.5,
              color: Color(0xFF2C2C2E),
            ),
          ),
        ],
      ),
    );
  }
}
