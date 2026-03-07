
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../data/lxcp_model.dart';
import '../bloc/hr_bloc.dart';

class CpEditWorkItem extends StatefulWidget {
  final String title;
  final int index;

  final LxCpWork report;

  final bool isExpanded;
  final VoidCallback onToggleExpand;
  final VoidCallback? onDelete;
  final bool readonly;
  final bool alwaysExpanded;

  const CpEditWorkItem({
    super.key,
    required this.title,
    required this.index,
    required this.isExpanded,
    required this.onToggleExpand,
    required this.report,
    this.onDelete,
    this.readonly = false,
    this.alwaysExpanded = false,
  });

  @override
  State<CpEditWorkItem> createState() => _CpEditWorkItemState();
}

class _CpEditWorkItemState extends State<CpEditWorkItem> {

  late TextEditingController _percentController;
  late TextEditingController _performanceAvgController;
  late TextEditingController _performanceActualController;

  @override
  void initState() {
    super.initState();

    final work = context.read<HrBloc>().state.works[widget.index];

    _percentController = TextEditingController(
      text: work.percentage != null ? '${work.percentage!.toInt()}%' : '',
    );

    _performanceAvgController = TextEditingController(
      text: work.performanceAvg?.toInt().toString() ?? '',
    );

    _performanceActualController = TextEditingController(
      text: work.performanceActual?.toString() ?? '',
    );
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
      key: ValueKey('work_${widget.index}'),
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
    return BlocBuilder<HrBloc, HrState>(
      buildWhen: (p, c) =>
      p.works != c.works || p.filmDetail != c.filmDetail,
      builder: (context, state) {

        if (widget.index >= state.works.length) {
          return const SizedBox();
        }

        final work = state.works[widget.index];

        FilmDetailResponse? film;

        try {
          film = state.filmDetail.firstWhere(
                (e) => e.filmManagementID == work.filmManagementDetailId,
          );
        } catch (_) {}

        return Column(
          children: [

            /// Nội dung công việc
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
                  nameForm: 'cp_edit_content_${widget.index}',
                  nameTextField: 'edit_content_${widget.index}',
                  label: film?.workContent1 ?? 'Nội dung công việc',
                  readOnly: true,
                  icon: Icons.category_outlined,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// Quantity
            FormInputField(
              nameForm: 'cp_edit_quantity_${widget.index}',
              nameTextField: 'edit_quantity_${widget.index}',
              icon: Icons.onetwothree_outlined,
              label: 'Số lượng',
              keyboardType: TextInputType.number,
              initialValue: work.quantity?.toString(),
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

            /// Time
            FormInputField(
              nameForm: 'cp_edit_timeActual_${widget.index}',
              nameTextField: 'edit_timeActual_${widget.index}',
              icon: Icons.access_time_outlined,
              label: 'Thời gian (phút)',
              keyboardType: TextInputType.number,
              initialValue: work.timeActual?.toString(),
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

            /// Percentage
            FormInputField(
              nameForm: 'cp_edit_percentage_${widget.index}',
              nameTextField: 'edit_percentage_${widget.index}',
              icon: Icons.percent_outlined,
              label: 'Tỷ lệ (%)',
              controller: _percentController,
              enabled: false,
            ),

            const SizedBox(height: 8),

            /// Performance AVG
            FormInputField(
              nameForm: 'cp_edit_performanceAvg_${widget.index}',
              nameTextField: 'edit_performanceAvg_${widget.index}',
              icon: Icons.bar_chart_outlined,
              label: 'Năng suất trung bình',
              controller: _performanceAvgController,
              enabled: false,
            ),

            const SizedBox(height: 8),

            /// Performance Actual
            FormInputField(
              nameForm: 'cp_edit_performanceActual_${widget.index}',
              nameTextField: 'edit_performanceActual_${widget.index}',
              icon: Icons.bar_chart_outlined,
              label: 'Năng suất thực tế',
              controller: _performanceActualController,
              enabled: false,
            ),
          ],
        );
      },
    );
  }
}