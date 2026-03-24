import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../data/ad_model.dart';
import '../bloc/ad_bloc.dart';

class AdAddWorkItem extends StatefulWidget {
  final String title;
  final AdWork report;
  final bool isExpanded;
  final VoidCallback onToggleExpand;
  final VoidCallback? onDelete;
  final bool readonly;
  final bool alwaysExpanded;
  final int index;

  const AdAddWorkItem({
    super.key,
    required this.title,
    required this.index,
    required this.report,
    required this.isExpanded,
    required this.onToggleExpand,
    this.onDelete,
    this.readonly = false,
    this.alwaysExpanded = false,
  });

  @override
  State<AdAddWorkItem> createState() => _AdAddWorkItemState();
}

class _AdAddWorkItemState extends State<AdAddWorkItem> {
  late TextEditingController _totalHoursController;
  late TextEditingController _totalOTController;

  late TextEditingController _contentController;
  late TextEditingController _resultsController;
  late TextEditingController _planNextDayController;

  late TextEditingController _backlogController;
  late TextEditingController _problemController;
  late TextEditingController _problemSolveController;
  late TextEditingController _noteController;

  late TextEditingController _locationController;
  late TextEditingController _projectController;

  bool _showExtraInfo = false;

  @override
  void initState() {
    super.initState();

    final r = widget.report;

    _totalHoursController = TextEditingController(
      text: r.totalHours.toInt().toString(),
    );

    _totalOTController = TextEditingController(
      text: (r.totalHourOT ?? 0).toInt().toString(),
    );

    _contentController = TextEditingController(text: r.content);
    _resultsController = TextEditingController(text: r.results);
    _planNextDayController = TextEditingController(text: r.planNextDay);

    _backlogController = TextEditingController(text: r.backlog ?? '');
    _problemController = TextEditingController(text: r.problem ?? '');
    _problemSolveController = TextEditingController(text: r.problemSolve ?? '');
    _noteController = TextEditingController(text: r.note ?? '');

    _locationController = TextEditingController(text: r.location ?? '');

    _projectController = TextEditingController(text: r.projectText ?? '');
  }

  void _set(TextEditingController c, String value) {
    if (c.text == value) return;

    c.value = TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }

  @override
  void didUpdateWidget(covariant AdAddWorkItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    final r = widget.report;

    _set(_totalHoursController, r.totalHours.toInt().toString());
    _set(_totalOTController, (r.totalHourOT ?? 0).toInt().toString());

    _set(_contentController, r.content);
    _set(_resultsController, r.results);
    _set(_planNextDayController, r.planNextDay);

    _set(_backlogController, r.backlog ?? '');
    _set(_problemController, r.problem ?? '');
    _set(_problemSolveController, r.problemSolve ?? '');
    _set(_noteController, r.note ?? '');

    _set(_locationController, r.location ?? '');
    _set(_projectController, r.projectText ?? '');
  }

  @override
  void dispose() {
    _totalHoursController.dispose();
    _totalOTController.dispose();

    _contentController.dispose();
    _resultsController.dispose();
    _planNextDayController.dispose();

    _backlogController.dispose();
    _problemController.dispose();
    _problemSolveController.dispose();
    _noteController.dispose();

    _locationController.dispose();
    _projectController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showExpanded = widget.alwaysExpanded || widget.isExpanded;

    return Slidable(
      key: ValueKey('work_${widget.title}_${widget.index}'),
      enabled: !showExpanded,
      endActionPane: showExpanded
          ? null
          : ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.22,
        children: [
          SlidableAction(
            onPressed: (_) => widget.onDelete?.call(),
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete_outline,
            label: 'Xoá',
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
      child: Builder(
        builder: (slidableCtx) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: widget.alwaysExpanded
                ? null
                : () {
              Slidable.of(slidableCtx)?.close();
              widget.onToggleExpand();
            },
            child: FormCard(
              title: widget.title,
              collapsed: !showExpanded,
              actions: [
                if (!widget.alwaysExpanded)
                  IconButton(
                    icon: Icon(
                      showExpanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                    ),
                    onPressed: () {
                      Slidable.of(slidableCtx)?.close();
                      widget.onToggleExpand();
                    },
                  ),
              ],
              child: AnimatedSize(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: showExpanded
                    ? IgnorePointer(
                  ignoring: widget.readonly,
                  child: _buildContent(context),
                )
                    : const SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return BlocBuilder<AdBloc, AdState>(
      buildWhen: (prev, curr) =>
      prev.expandedWorkIndex != curr.expandedWorkIndex ||
          prev.projects != curr.projects ||
          prev.works != curr.works,
      builder: (context, state) {
        final work = state.works[widget.index];

        ProjectResponse? project;

        try {
          project = state.projects.firstWhere((e) => e.id == work.id);
        } catch (_) {
          project = null;
        }

        return Column(
          children: [
            /// ===== Nội dung công việc =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                openSelectBottomSheet(
                  context: context,
                  title: 'Chọn dự án',
                  items: state.projects,
                  displayText: (v) =>
                  '${v.projectCode} - ${v.projectName}',
                  onSelected: (item) {
                    context.read<AdBloc>().add(
                      AdEvent.updateWork(
                        index: widget.index,
                        projectId: item.id,
                        projectName: item.projectName,
                        code: item.projectCode,
                      ),
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('project_${widget.report.id}'),
                  nameForm: 'Ad_project_${widget.report.id}',
                  nameTextField: 'project_${widget.report.id}',
                  label: (work.projectName ?? '').isNotEmpty
                      ? work.projectName!
                      : 'Chọn dự án',
                  readOnly: true,
                  icon: Icons.category_outlined,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: FormInputField(
                    key: ValueKey('total_${widget.report.id}'),
                    icon: Icons.timer_outlined,
                    nameForm: 'Ad_add_total_${widget.report.id}',
                    nameTextField: 'total_${widget.report.id}',
                    label: 'Tổng giờ',
                    keyboardType: TextInputType.number,
                    controller: _totalHoursController,
                    onChanged: (v) {

                      context.read<AdBloc>().add(
                        AdEvent.updateWork(
                          index: widget.index,
                          totalHours: int.tryParse(v ?? '') ?? 0,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FormInputField(
                    icon: Icons.timer_outlined,
                    nameForm: 'Ad_add_ot_${widget.report.id}',
                    nameTextField: 'ot_${widget.report.id}',
                    label: 'OT',
                    keyboardType: TextInputType.number,
                    controller: _totalOTController,
                    onChanged: (v) {
                      context.read<AdBloc>().add(
                        AdEvent.updateWork(
                          index: widget.index,
                          totalHourOT: int.tryParse(v ?? '') ?? 0,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            FormInputField(
              key: ValueKey('content_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'Ad_add_content_${widget.report.id}',
              nameTextField: 'content_${widget.report.id}',

              label: 'Nội dung công việc',
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              controller: _contentController,
              onChanged: (v) {
                context.read<AdBloc>().add(
                  AdEvent.updateWork(
                    index: widget.index,
                    content: v,
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            /// ===== RESULT =====
            FormInputField(
              key: ValueKey('result_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'Ad_add_result_${widget.report.id}',
              nameTextField: 'result_${widget.report.id}',
              label: 'Kết quả',
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline, // ⬅ Enter xuống dòng
              controller: _resultsController,
              onChanged: (v) {
                context.read<AdBloc>().add(
                  AdEvent.updateWork(
                    index: widget.index,
                    results: v,
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            Column(
              children: [
                InkWell(
                  onTap: () => setState(() => _showExtraInfo = !_showExtraInfo),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _showExtraInfo
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: AppColors.primaryERP,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _showExtraInfo
                            ? 'Ẩn thông tin bổ sung'
                            : 'Hiện thông tin bổ sung',
                        style: const TextStyle(
                          color: AppColors.primaryERP,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                if (_showExtraInfo) ...[
                  const SizedBox(height: 8),

                  FormInputField(
                    icon: Icons.warning_amber_outlined,
                    nameForm: 'Ad_add_blocking',
                    nameTextField: 'blocking',
                    label: 'Tồn đọng (nếu có)',
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    controller: _backlogController,
                    onChanged: (v) {
                      context.read<AdBloc>().add(
                        AdEvent.updateWork(
                          index: widget.index,
                          backlog: v,
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 8),

                  FormInputField(
                    icon: Icons.note_outlined,
                    nameForm: 'Ad_add_note',
                    nameTextField: 'note',
                    label: 'Ghi chú / Lý do tồn đọng',
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    controller: _noteController,
                    onChanged: (v) {
                      context.read<AdBloc>().add(
                        AdEvent.updateWork(
                          index: widget.index,
                          note: v,
                        ),
                      );
                    },
                  ),
                ],
              ],
            ),
          ],
        );
      },
    );
  }
}
