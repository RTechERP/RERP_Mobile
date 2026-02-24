import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/tech_model.dart';
import '../bloc/tech_bloc.dart';

class TechAddWorkItem extends StatefulWidget {
  final String title;
  final TechWork report;
  final bool isExpanded;
  final VoidCallback onToggleExpand;
  final VoidCallback? onDelete;
  final bool readonly;

  /// 👇 DetailScreen bật flag này = luôn mở
  final bool alwaysExpanded;
  final int index;

  const TechAddWorkItem({
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
  State<TechAddWorkItem> createState() => _TechAddWorkItemState();
}

class _TechAddWorkItemState extends State<TechAddWorkItem> {
  late TextEditingController _percentController;
  late TextEditingController _totalController;
  late TextEditingController _otController;

  @override
  void initState() {
    super.initState();
    _percentController = TextEditingController(
      text: widget.report.percentComplete.toInt().toString(),
    );

    _totalController = TextEditingController(
      text: (widget.report.totalHours)
          .toInt()
          .toString(),
    );

    _otController = TextEditingController(
      text: (widget.report.totalHourOT ?? 0)
          .toInt()
          .toString(),
    );
  }

  @override
  void didUpdateWidget(covariant TechAddWorkItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.report.percentComplete !=
        widget.report.percentComplete) {

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final newText = widget.report.percentComplete
            .toInt()
            .toString();

        if (_percentController.text != newText) {
          _percentController.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(
              offset: newText.length,
            ),
          );
        }
      });
    }

    if (oldWidget.report.totalHours != widget.report.totalHours) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final newText =
        (widget.report.totalHours)
            .toInt()
            .toString();

        if (_totalController.text != newText) {
          _totalController.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(
              offset: newText.length,
            ),
          );
        }
      });
    }

    if (oldWidget.report.totalHourOT != widget.report.totalHourOT) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final newText =
        (widget.report.totalHourOT ?? 0)
            .toInt()
            .toString();

        if (_otController.text != newText) {
          _otController.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(
              offset: newText.length,
            ),
          );
        }
      });
    }
  }
  @override
  void dispose() {
    _percentController.dispose();
    _totalController.dispose();
    _otController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final showExpanded = widget.alwaysExpanded || widget.isExpanded;

    return Slidable(
      key: ValueKey('work_${widget.title}_${widget.index}'),
      enabled: !showExpanded, // expanded thì disable swipe
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
        // 👈 rất quan trọng: để lấy đúng context của Slidable
        builder: (slidableCtx) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: widget.alwaysExpanded
                ? null
                : () {
              // 👇 Đóng Slidable trước khi expand
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
                      Slidable.of(slidableCtx)?.close(); // 👈 đóng khi bấm icon
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
    return BlocBuilder<TechBloc, TechState>(
      buildWhen: (prev, curr) =>
      prev.selectedProject != curr.selectedProject ||
          prev.expandedWorkIndex != curr.expandedWorkIndex ||
          prev.projectItem != curr.projectItem,

      builder: (context, state) {
        return Column(
          children: [
            /// ===== CATEGORY (MISSION TỪ BE) =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                openSelectBottomSheet(
                  context: context,
                  title: 'Chọn hạng mục',
                  items: state.projectItem, // List<ProjectItem>
                  displayText: (v) => '${v.code} - ${v.mission}',
                  onSelected: (item) {
                    context.read<TechBloc>().add(
                      TechEvent.updateWork(
                        index: widget.index,
                        mission: item.mission,
                        projectItemId: item.id,
                        code: item.code,
                        percentComplete: item.percentageActual,
                      ),
                    );
                  },
                );

              },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('work_${widget.report.id}'),
                  nameForm: 'tech_add_category_${widget.report.id}',
                  nameTextField: 'category_${widget.report.id}',
                  label: (widget.report.mission.isNotEmpty == true)
                      ? widget.report.mission
                      : 'Hạng mục',
                  readOnly: true,
                  icon: Icons.category_outlined,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// ===== TOTAL + OT =====
            Row(
              children: [
                Expanded(
                  child: FormInputField(
                    key: ValueKey('total_${widget.report.id}'),
                    icon: Icons.timer_outlined,
                    nameForm: 'tech_add_total_${widget.report.id}',
                    nameTextField: 'total_${widget.report.id}',
                    label: 'Tổng giờ',
                    keyboardType: TextInputType.number,
                    controller: _totalController,
                    onChanged: (v) {
                      context.read<TechBloc>().add(
                        TechEvent.updateWork(
                          index: widget.index,
                          totalHours: double.tryParse(v ?? '') ?? 0,
                        ),
                      );
                    },

                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FormInputField(
                    icon: Icons.timer_outlined,
                    nameForm: 'tech_add_ot_${widget.report.id}',
                    nameTextField: 'ot_${widget.report.id}',
                    label: 'OT',
                    keyboardType: TextInputType.number,
                    controller: _otController,
                    onChanged: (v) {
                      context.read<TechBloc>().add(
                        TechEvent.updateWork(
                          index: widget.index,
                          totalHourOT: double.tryParse(v ?? '') ?? 0,
                        ),
                      );
                    },

                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// ===== PERCENT =====
            FormInputField(
              key: ValueKey('percent_${widget.report.id}'),
              icon: Icons.percent_outlined,
              nameForm: 'tech_add_percent_${widget.report.id}',
              nameTextField: 'percent_${widget.report.id}',
              label: 'Tiến độ hoàn thành',
              keyboardType: TextInputType.number,
              controller: _percentController,
              onChanged: (v) {
                context.read<TechBloc>().add(
                  TechEvent.updateWork(
                    index: widget.index,
                    percentComplete: double.tryParse(v ?? '') ?? 0,
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            /// ===== CONTENT =====
            FormInputField(
              key: ValueKey('content_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'tech_add_content_${widget.report.id}',
              nameTextField: 'content_${widget.report.id}',

              label: 'Nội dung công việc',
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              initialValue: widget.report.content,
              onChanged: (v) {
                context.read<TechBloc>().add(
                  TechEvent.updateWork(index: widget.index, content: v),
                );
              },
            ),

            const SizedBox(height: 8),

            /// ===== RESULT =====
            FormInputField(
              key: ValueKey('result_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'tech_add_result_${widget.report.id}',
              nameTextField: 'result_${widget.report.id}',
              label: 'Kết quả',
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline, // ⬅ Enter xuống dòng
              initialValue: widget.report.results,
              onChanged: (v) {
                context.read<TechBloc>().add(
                  TechEvent.updateWork(index: widget.index, results: v),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
