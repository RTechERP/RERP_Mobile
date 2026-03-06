import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../data/cp_model.dart';
import '../bloc/hr_bloc.dart';

class CpAddWorkItem extends StatefulWidget {
  final String title;
  final CpWork report;
  final bool isExpanded;
  final VoidCallback onToggleExpand;
  final VoidCallback? onDelete;
  final bool readonly;
  final bool alwaysExpanded;
  final int index;

  const CpAddWorkItem({
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
  State<CpAddWorkItem> createState() => _CpAddWorkItemState();
}

class _CpAddWorkItemState extends State<CpAddWorkItem> {

  late TextEditingController _percentController;
  late TextEditingController _performanceAvgController;
  late TextEditingController _performanceActualController;


  @override
  void initState() {
    super.initState();

    _percentController = TextEditingController(
      text: widget.report.percentage != null
          ? '${widget.report.percentage!.toInt()}%'
          : '',
    );

    _performanceAvgController = TextEditingController(
      text: widget.report.performanceAvg != null
          ? widget.report.performanceAvg!.toInt().toString()
          : '',
    );

    _performanceActualController = TextEditingController(
      text: widget.report.performanceActual?.toString() ?? '',
    );
  }

  @override
  void didUpdateWidget(covariant CpAddWorkItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.report.percentage != widget.report.percentage) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final newText = widget.report.percentage != null
            ? '${widget.report.percentage!.toInt()}%'
            : '';

        if (_percentController.text != newText) {
          _percentController.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }
      });
    }

    if (oldWidget.report.performanceAvg != widget.report.performanceAvg) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final newText = widget.report.performanceAvg != null
            ? widget.report.performanceAvg!.toInt().toString()
            : '';

        if (_performanceAvgController.text != newText) {
          _performanceAvgController.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }
      });
    }

    if (oldWidget.report.performanceActual != widget.report.performanceActual) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final newText = widget.report.performanceActual?.toString() ?? '';

        if (_performanceActualController.text != newText) {
          _performanceActualController.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _percentController.dispose();
    _performanceAvgController.dispose();
    _performanceActualController.dispose();
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
    return BlocBuilder<HrBloc, HrState>(
      buildWhen: (prev, curr) =>
          prev.expandedWorkIndex != curr.expandedWorkIndex ||
          prev.filmDetail != curr.filmDetail ||
          prev.works != curr.works,

      builder: (context, state) {
        final work = state.works[widget.index];

        FilmDetailResponse? film;

        try {
          film = state.filmDetail.firstWhere(
            (e) => e.filmManagementID == work.filmManagementDetailId,
          );
        } catch (_) {
          film = null;
        }

        debugPrint('UI filmManagementDetailId: ${work.filmManagementDetailId}');
        debugPrint('UI workContent1: ${film?.workContent1}');
        return Column(
          children: [
            /// ===== Nội dung công việc =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Nội dung công việc',
                        items: state.filmDetail,
                        displayText: (v) => '${v.workContent1}',
                        onSelected: (item) {
                          debugPrint(
                            'filmManagementID: ${item.filmManagementID}',
                          );
                          debugPrint('workContent1: ${item.workContent1}');
                          context.read<HrBloc>().add(
                            HrEvent.lxcpUpdateWork(
                              index: widget.index,
                              filmManagementDetailID: item.filmManagementID,
                            ),
                          );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('content_${widget.report.id}'),
                  nameForm: 'cp_add_content_${widget.report.id}',
                  nameTextField: 'content_${widget.report.id}',
                  label: film?.workContent1?.isNotEmpty == true
                      ? film!.workContent1!
                      : 'Nội dung công việc',
                  readOnly: true,
                  icon: Icons.category_outlined,
                ),
              ),
            ),

            const SizedBox(height: 8),

            FormInputField(
              key: ValueKey('quantity_${widget.report.id}'),

              icon: Icons.onetwothree_outlined,
              nameForm: 'cp_add_quantity_${widget.report.id}',
              nameTextField: 'quantity_${widget.report.id}',
              label: 'Số lượng',
              maxLines: 1,
              keyboardType: TextInputType.number,
              onChanged: (v) {
                context.read<HrBloc>().add(
                  HrEvent.lxcpUpdateWork(
                    index: widget.index,
                    quantity: int.tryParse(v ?? '') ?? 0,
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            FormInputField(
              key: ValueKey('timeActual_${widget.report.id}'),

              icon: Icons.access_time_outlined,
              nameForm: 'cp_add_timeActual_${widget.report.id}',
              nameTextField: 'timeActual_${widget.report.id}',
              label: 'Thời gian (phút)',
              maxLines: 1,
              keyboardType: TextInputType.number,
              onChanged: (v) {
                context.read<HrBloc>().add(
                  HrEvent.lxcpUpdateWork(
                    index: widget.index,
                    timeActual: int.tryParse(v ?? '') ?? 0,
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            FormInputField(
              key: ValueKey('percentage_${widget.report.id}'),
              icon: Icons.percent_outlined,
              nameForm: 'cp_add_percentage_${widget.report.id}',
              nameTextField: 'percentage_${widget.report.id}',
              label: 'Tỷ lệ (%)',
              controller: _percentController,
              enabled: false,
            ),

            const SizedBox(height: 8),

            FormInputField(
              key: ValueKey('performanceAvg_${widget.report.id}'),
              icon: Icons.bar_chart_outlined,
              nameForm: 'cp_add_performanceAvg_${widget.report.id}',
              nameTextField: 'performanceAvg_${widget.report.id}',
              label: 'Năng suất trung bình',
              controller: _performanceAvgController,
              enabled: false,

            ),

            const SizedBox(height: 8),

            FormInputField(
              key: ValueKey('performanceActual_${widget.report.id}'),
              icon: Icons.bar_chart_outlined,
              nameForm: 'cp_add_performanceActual_${widget.report.id}',
              nameTextField: 'performanceActual_${widget.report.id}',
              label: 'Năng suất thực tế',
              initialValue: work.performanceActual?.toString(),
              controller: _performanceActualController,
              enabled: false,

            ),
          ],
        );
      },
    );
  }
}
