import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/tech_model.dart';
import '../bloc/tech_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../../routes/route_names.dart';

class TechEditWorkItem extends StatefulWidget {
  final String title;
  final TechWork report;
  final int index;
  final bool readonly;

  const TechEditWorkItem({
    super.key,
    required this.title,
    required this.report,
    required this.index,
    this.readonly = false,
  });

  @override
  State<TechEditWorkItem> createState() => _TechEditWorkItemState();
}

class _TechEditWorkItemState extends State<TechEditWorkItem> {
  late TextEditingController _percentController;
  late TextEditingController _totalController;
  late TextEditingController _otController;

  late TextEditingController _contentController;

  late TextEditingController _resultController;

  late TextEditingController _missionController;

  @override
  void initState() {
    super.initState();

    _percentController = TextEditingController(
      text: widget.report.percentComplete.toInt().toString(),
    );

    _totalController = TextEditingController(
      text: widget.report.totalHours.toInt().toString(),
    );

    _otController = TextEditingController(
      text: (widget.report.totalHourOT ?? 0).toInt().toString(),
    );

    _contentController = TextEditingController(
      text: widget.report.content,
    );

    _resultController = TextEditingController(
      text: widget.report.results,
    );

    _missionController = TextEditingController(
      text: widget.report.mission,
    );
  }

  @override
  void didUpdateWidget(covariant TechEditWorkItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    void updateController(
        TextEditingController controller,
        String newText,
        ) {
      if (controller.text != newText) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          controller.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        });
      }
    }

    updateController(
      _percentController,
      widget.report.percentComplete.toInt().toString(),
    );

    updateController(
      _totalController,
      widget.report.totalHours.toInt().toString(),
    );

    updateController(
      _otController,
      (widget.report.totalHourOT ?? 0).toInt().toString(),
    );

    updateController(
      _contentController,
      widget.report.content,
    );

    updateController(
      _resultController,
      widget.report.results,
    );

    updateController(
      _missionController,
      widget.report.mission,
    );
  }

  @override
  void dispose() {
    _percentController.dispose();
    _totalController.dispose();
    _otController.dispose();
    _contentController.dispose();
    _resultController.dispose();
    _missionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormCard(
      title: widget.title,
      collapsed: false,
      child: IgnorePointer(
        ignoring: widget.readonly,
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return BlocBuilder<TechBloc, TechState>(
      buildWhen: (prev, curr) =>
      prev.selectedProject != curr.selectedProject ||
          prev.projectItem != curr.projectItem,
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 8),

            /// ===== CATEGORY =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                openSelectBottomSheet(
                  context: context,
                  title: 'Chọn hạng mục',
                  items: state.projectItem,
                  displayText: (v) => '${v.code} - ${v.mission}',
                  onAdd: () => context.push(RouteNames.workCategoryAdd),
                  onSelected: (item) {
                    context.read<TechBloc>().add(
                      TechEvent.updateWork(
                        index: widget.index,
                        mission: item.mission,
                        projectItemId: item.id,
                        code: item.code,
                        percentComplete:
                        item.percentageActual,
                      ),
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: FormInputField(
                  autoExpand: true,
                  key: ValueKey('edit_category_${widget.report.id}'),
                  nameForm: 'tech_edit_category_${widget.report.id}',
                  nameTextField: 'edit_category_${widget.report.id}',
                  label: 'Hạng mục',
                  readOnly: true,
                  icon: Icons.category_outlined,
                  isRequired: true,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Vui lòng chọn hạng mục';
                    }
                    return null;
                  },
                  controller: _missionController,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// ===== TOTAL + OT =====
            Row(
              children: [
                Expanded(
                  child: FormInputField(
                    icon: Icons.timer_outlined,
                    nameForm:
                    'tech_edit_total_${widget.report.id}',
                    nameTextField:
                    'edit_total_${widget.report.id}',
                    label: 'Tổng giờ',
                    keyboardType: TextInputType.number,
                    controller: _totalController,
                    isRequired: true,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return 'Nhập tổng giờ';
                      final total = double.tryParse(v) ?? 0;
                      if (total <= 0) return 'Tổng giờ phải > 0';
                      if (total > 24) return 'Tổng giờ không > 24';
                      return null;
                    },
                    onChanged: (v) {
                      context.read<TechBloc>().add(
                        TechEvent.updateWork(
                          index: widget.index,
                          totalHours:
                          double.tryParse(v ?? '') ?? 0,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FormInputField(
                    icon: Icons.timer_outlined,
                    nameForm: 'tech_edit_ot_${widget.report.id}',
                    nameTextField:
                    'edit_ot_${widget.report.id}',
                    label: 'OT',
                    keyboardType: TextInputType.number,
                    controller: _otController,
                    onChanged: (v) {
                      context.read<TechBloc>().add(
                        TechEvent.updateWork(
                          index: widget.index,
                          totalHourOT:
                          double.tryParse(v ?? '') ?? 0,
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
              icon: Icons.percent_outlined,
              nameForm:
              'tech_edit_percent_${widget.report.id}',
              nameTextField:
              'edit_percent_${widget.report.id}',
              label: 'Tiến độ hoàn thành',
              keyboardType: TextInputType.number,
              controller: _percentController,
              isRequired: true,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Vui lòng nhập tiến độ hoàn thành';
                }
                final percent = double.tryParse(v) ?? 0;
                if (percent <= 0 || percent > 100) {
                  return '% Hoàn thành phải từ 1 đến 100';
                }
                return null;
              },
              onChanged: (v) {
                context.read<TechBloc>().add(
                  TechEvent.updateWork(
                    index: widget.index,
                    percentComplete:
                    double.tryParse(v ?? '') ?? 0,
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            /// ===== CONTENT =====
            FormInputField(
              nameForm:
              'tech_edit_content_${widget.report.id}',
              nameTextField:
              'edit_content_${widget.report.id}',
              icon: Icons.note_outlined,
              label: 'Nội dung công việc',
              autoExpand: true,
              controller: _contentController,
              isRequired: true,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Vui lòng nhập nội dung công việc';
                }
                return null;
              },
              onChanged: (v) {
                context.read<TechBloc>().add(
                  TechEvent.updateWork(
                    index: widget.index,
                    content: v,
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            /// ===== RESULT =====
            FormInputField(
              nameForm:
              'tech_edit_result_${widget.report.id}',
              nameTextField:
              'edit_result_${widget.report.id}',
              icon: Icons.note_outlined,
              label: 'Kết quả',
              autoExpand: true,
              controller: _resultController,
              isRequired: true,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Vui lòng nhập kết quả';
                return null;
              },
              onChanged: (v) {
                context.read<TechBloc>().add(
                  TechEvent.updateWork(
                    index: widget.index,
                    results: v,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}