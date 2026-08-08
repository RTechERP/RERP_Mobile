import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/tech_model.dart';
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
  late TextEditingController _categoryController;
  late TextEditingController _contentController;

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

  /// Validate hour: must be > 0, ≤ 24, only 1 digit after decimal allowed (0–9).
  static String? _validateHour(String? raw, {bool required = true}) {
    if (raw == null || raw.trim().isEmpty) {
      return required ? 'Nhập số giờ' : null;
    }
    final v = raw.trim().replaceAll(',', '.');
    final parts = v.split('.');
    if (parts.isEmpty) return 'Giá trị không hợp lệ';
    if (double.tryParse(parts[0]) == null) return 'Giá trị không hợp lệ';
    // Chỉ cho phép tối đa 1 chữ số sau dấu .
    if (parts.length > 2 || (parts.length == 2 && parts[1].length > 1)) {
      return 'Chỉ cho phép tối đa 1 chữ số thập phân';
    }
    if (parts.length == 2 && parts[1].isNotEmpty) {
      final digit = parts[1];
      if (digit.length != 1 || !RegExp(r'^[0-9]$').hasMatch(digit)) {
        return 'Giá trị không hợp lệ';
      }
    }
    final val = double.tryParse(v) ?? 0;
    if (required && val <= 0) return 'Số giờ phải > 0';
    if (val > 24) return 'Số giờ không > 24';
    return null;
  }

  @override
  void initState() {
    super.initState();
    _categoryController = TextEditingController(
      text: widget.report.mission,
    );

    _percentController = TextEditingController(
      text: widget.report.percentComplete.toInt().toString(),
    );

    _totalController = TextEditingController(
      text: _formatHour(widget.report.totalHours),
    );

    _otController = TextEditingController(
      text: _formatHour(widget.report.totalHourOT ?? 0),
    );

    _contentController = TextEditingController(
      text: widget.report.content,
    );
  }

  @override
  void didUpdateWidget(covariant TechAddWorkItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.report.mission != widget.report.mission) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final newText = widget.report.mission;

        if (_categoryController.text != newText) {
          _categoryController.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }
      });
    }

    if (oldWidget.report.percentComplete != widget.report.percentComplete) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final newText = widget.report.percentComplete.toInt().toString();

        if (_percentController.text != newText) {
          _percentController.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }
      });
    }

    if (oldWidget.report.totalHours != widget.report.totalHours) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final newText = _formatHour(widget.report.totalHours);

        if (_totalController.text != newText) {
          _totalController.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }
      });
    }

    if (oldWidget.report.totalHourOT != widget.report.totalHourOT) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final newText = _formatHour(widget.report.totalHourOT ?? 0);

        if (_otController.text != newText) {
          _otController.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }
      });
    }

    if (oldWidget.report.content != widget.report.content) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final newText = widget.report.content;

        if (_contentController.text != newText) {
          _contentController.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _percentController.dispose();
    _totalController.dispose();
    _otController.dispose();
    _contentController.dispose();
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
                        items: context.read<TechBloc>().state.projectItem, // Lấy trực tiếp từ state
                        displayText: (v) => '${v.code} - ${v.mission}',
                        // onAdd: () => context.push(RouteNames.workCategoryAdd),
                        onSelected: (item) {
                          final isPercentageZero = (item.percentageActual ?? 0) == 0;
                          final oldMission = widget.report.mission;
                          final currentContent = widget.report.content;

                          String? newContent;
                          if (isPercentageZero) {
                            // percentageActual == 0: auto-fill with mission
                            newContent = item.mission ?? '';
                          } else {
                            // percentageActual > 0: only clear if content was auto-filled from old mission
                            final wasAutoFilled = oldMission.isNotEmpty &&
                                oldMission == currentContent;
                            newContent = wasAutoFilled ? '' : null;
                          }

                          context.read<TechBloc>().add(
                            TechEvent.updateWork(
                              index: widget.index,
                              mission: item.mission,
                              projectItemId: item.id,
                              code: item.code,
                              percentComplete: item.percentageActual,
                              content: newContent,
                            ),
                          );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  autoExpand: true,
                  key: ValueKey('work_${widget.report.id}'),
                  nameForm: 'tech_add_category_${widget.report.id}',
                  nameTextField: 'category_${widget.report.id}',
                  label: 'Hạng mục',
                  controller: _categoryController,
                  readOnly: true,
                  icon: Icons.category_outlined,
                  isRequired: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Vui lòng chọn hạng mục';
                    return null;
                  },
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
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    controller: _totalController,
                    onChanged: (v) {
                      context.read<TechBloc>().add(
                        TechEvent.updateWork(
                          index: widget.index,
                          totalHours: _parseHour(v),
                        ),
                      );
                    },
                    isRequired: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) => _validateHour(v),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FormInputField(
                    icon: Icons.timer_outlined,
                    nameForm: 'tech_add_ot_${widget.report.id}',
                    nameTextField: 'ot_${widget.report.id}',
                    label: 'OT',
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    controller: _otController,
                    onChanged: (v) {
                      context.read<TechBloc>().add(
                        TechEvent.updateWork(
                          index: widget.index,
                          totalHourOT: _parseHour(v),
                        ),
                      );
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) => _validateHour(v, required: false),
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
              isRequired: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Vui lòng nhập tiến độ hoàn thành';
                final percent = double.tryParse(v) ?? 0;
                if (percent <= 0 || percent > 100) return '% Hoàn thành phải từ 1 đến 100';
                return null;
              }
            ),

            const SizedBox(height: 8),

            /// ===== CONTENT =====
            FormInputField(
              key: ValueKey('content_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'tech_add_content_${widget.report.id}',
              nameTextField: 'content_${widget.report.id}',

              label: 'Nội dung công việc',
              autoExpand: true,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              controller: _contentController,
              onChanged: (v) {
                context.read<TechBloc>().add(
                  TechEvent.updateWork(index: widget.index, content: v),
                );
              },
              isRequired: true,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Vui lòng nhập nội dung công việc';
                return null;
              }
            ),

            const SizedBox(height: 8),

            /// ===== RESULT =====
            FormInputField(
              key: ValueKey('result_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'tech_add_result_${widget.report.id}',
              nameTextField: 'result_${widget.report.id}',
              label: 'Kết quả',
              autoExpand: true,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              initialValue: widget.report.results,
              onChanged: (v) {
                context.read<TechBloc>().add(
                  TechEvent.updateWork(index: widget.index, results: v),
                );
              },
              isRequired: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Vui lòng nhập kết quả';
                return null;
              }
            ),
          ],
        );
  }
}
