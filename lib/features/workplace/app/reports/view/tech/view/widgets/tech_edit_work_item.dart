import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/tech_model.dart';
import '../bloc/tech_bloc.dart';
import 'tech_overtime_section.dart';
import 'tech_overtime_toggle.dart';
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

  late TextEditingController _contentController;

  late TextEditingController _resultController;

  late TextEditingController _missionController;

  /// Parse hour string (accept both '.' and ',' as decimal separator) → double.
  static double _parseHour(String? raw) {
    if (raw == null || raw.trim().isEmpty) return 0;
    return double.tryParse(raw.trim().replaceAll(',', '.')) ?? 0;
  }

  /// Format double hour → display string using platform decimal separator.
  /// iOS uses ',' (e.g. "6,5"), Android/desktop uses '.' (e.g. "6.5").
  /// Integer values shown without decimal (e.g. "8").
  static String _formatHour(double value) {
    final sep = Platform.isIOS ? ',' : '.';
    if (value == value.toInt()) return value.toInt().toString();
    return value.toString().replaceFirst('.', sep);
  }

  /// Validate giờ hành chính: `0 <= TotalHours <= 8.0`, tối đa 2 chữ số thập phân.
  ///
  /// Số `0` (hoặc bỏ trống) là giá trị hợp lệ — payload vẫn gửi `TotalHours: 0`.
  static String? _validateAdminHour(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;

    final value = _parseHour(raw);
    if (value < 0) return 'Số giờ không được nhỏ hơn 0';
    if (value > 8) return 'Số giờ không được lớn hơn 8';

    final v = raw.trim().replaceAll(',', '.');
    final parts = v.split('.');
    if (parts.length > 2) return 'Giá trị không hợp lệ';
    if (parts.length == 2 && parts[1].isNotEmpty) {
      // Cho phép tối đa 2 chữ số thập phân (VD: 6.8, 6.83)
      if (!RegExp(r'^[0-9]{1,2}$').hasMatch(parts[1])) {
        return 'Giá trị không hợp lệ';
      }
    }
    if (double.tryParse(v) == null) return 'Giá trị không hợp lệ';

    return null;
  }

  @override
  void initState() {
    super.initState();

    _percentController = TextEditingController(
      text: widget.report.percentComplete.toInt().toString(),
    );

    _totalController = TextEditingController(
      text: _formatHour(widget.report.totalHours),
    );

    _contentController = TextEditingController(text: widget.report.content);

    _resultController = TextEditingController(text: widget.report.results);

    _missionController = TextEditingController(text: widget.report.mission);
  }

  @override
  void didUpdateWidget(covariant TechEditWorkItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    void updateController(TextEditingController controller, String newText) {
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

    updateController(_totalController, _formatHour(widget.report.totalHours));

    updateController(_contentController, widget.report.content);

    updateController(_resultController, widget.report.results);

    updateController(_missionController, widget.report.mission);
  }

  @override
  void dispose() {
    _percentController.dispose();
    _totalController.dispose();
    _contentController.dispose();
    _resultController.dispose();
    _missionController.dispose();
    super.dispose();
  }

  /// Ngày báo cáo — dùng làm mốc cho các ca làm thêm của hạng mục này.
  ///
  /// Lấy từ bloc (`currentReportDate`) vì đây là ngày đang khai báo trên form,
  /// không phải `dateReport` của hạng mục (hạng mục được khởi tạo theo tuần).
  DateTime get _reportDate {
    final current = context.read<TechBloc>().state.currentReportDate;
    if (current != null) {
      return DateTime(current.year, current.month, current.day);
    }

    final parsed = DateTime.tryParse(widget.report.dateReport);
    if (parsed != null) {
      return DateTime(parsed.year, parsed.month, parsed.day);
    }
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
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
                              percentComplete: item.percentageActual,
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

            /// ===== TOTAL + PERCENT =====
            Row(
              children: [
                Expanded(
                  child: FormInputField(
                    icon: Icons.timer_outlined,
                    nameForm: 'tech_edit_total_${widget.report.id}',
                    nameTextField: 'edit_total_${widget.report.id}',
                    label: 'Tổng giờ',
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    controller: _totalController,
                    isRequired: true,
                    validator: (v) => _validateAdminHour(v),
                    onChanged: (v) {
                      context.read<TechBloc>().add(
                        TechEvent.updateWork(
                          index: widget.index,
                          totalHours: _parseHour(v),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FormInputField(
                    icon: Icons.percent_outlined,
                    nameForm: 'tech_edit_percent_${widget.report.id}',
                    nameTextField: 'edit_percent_${widget.report.id}',
                    label: 'Tiến độ',
                    keyboardType: TextInputType.number,
                    controller: _percentController,
                    isRequired: true,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Vui lòng nhập tiến độ';
                      }
                      final percent = double.tryParse(v) ?? 0;
                      if (percent <= 0) {
                        return 'Lớn hơn 0%';
                      }
                      if (percent > 100) {
                        return '% từ 0 đến 100';
                      }
                      return null;
                    },
                    onChanged: (v) {
                      context.read<TechBloc>().add(
                        TechEvent.updateWork(
                          index: widget.index,
                          percentComplete: double.tryParse(v ?? '') ?? 0,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// ===== CONTENT =====
            FormInputField(
              nameForm: 'tech_edit_content_${widget.report.id}',
              nameTextField: 'edit_content_${widget.report.id}',
              icon: Icons.note_outlined,
              label: 'Nội dung công việc',
              autoExpand: true,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
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
                  TechEvent.updateWork(index: widget.index, content: v),
                );
              },
            ),

            const SizedBox(height: 8),

            /// ===== RESULT =====
            FormInputField(
              nameForm: 'tech_edit_result_${widget.report.id}',
              nameTextField: 'edit_result_${widget.report.id}',
              icon: Icons.note_outlined,
              label: 'Kết quả',
              autoExpand: true,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              controller: _resultController,
              isRequired: true,
              validator: (v) {
                if (v == null || v.trim().isEmpty)
                  return 'Vui lòng nhập kết quả';
                return null;
              },
              onChanged: (v) {
                context.read<TechBloc>().add(
                  TechEvent.updateWork(index: widget.index, results: v),
                );
              },
            ),

            const SizedBox(height: 8),

            /// ===== OVERTIME (LÀM THÊM) =====
            TechOvertimeToggle(
              report: widget.report,
              index: widget.index,
              reportDate: _reportDate,
            ),

            if (widget.report.hasOvertime) ...[
              const SizedBox(height: 8),
              TechOvertimeSection(
                work: widget.report,
                workIndex: widget.index,
                reportDate: _reportDate,
              ),
            ],
          ],
        );
      },
    );
  }
}
