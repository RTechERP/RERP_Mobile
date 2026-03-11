import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../data/sale_model.dart';
import '../bloc/sale_bloc.dart';

class SaleStaffAddItem extends StatefulWidget {
  final String title;
  final SaleStaffWork report;
  final bool isExpanded;
  final VoidCallback onToggleExpand;
  final VoidCallback? onDelete;
  final bool readonly;
  final bool alwaysExpanded;
  final int index;

  const SaleStaffAddItem({
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
  State<SaleStaffAddItem> createState() => _SaleStaffAddItemState();
}

class _SaleStaffAddItemState extends State<SaleStaffAddItem> {
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
  void didUpdateWidget(covariant SaleStaffAddItem oldWidget) {
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
    return BlocBuilder<SaleBloc, SaleState>(
      buildWhen: (prev, curr) =>
          prev.expandedWorkIndex != curr.expandedWorkIndex ||
          prev.projects != curr.projects ||
          prev.staffWorks != curr.staffWorks,
      builder: (context, state) {
        final work = state.staffWorks[widget.index];

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
                          // context.read<SaleBloc>().add(
                          //   SaleEvent.updateWork(
                          //     index: widget.index,
                          //     projectId: item.id,
                          //     projectName: item.projectName,
                          //     code: item.projectCode,
                          //   ),
                          // );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('project_${widget.report.id}'),
                  nameForm: 'sale_staff_project_${widget.report.id}',
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

            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn hãng',
                        items: state.projects,
                        displayText: (v) => '${v.projectName}',
                        onSelected: (item) {
                          // context.read<SaleBloc>().add(
                          //   SaleEvent.updateWork(
                          //     index: widget.index,
                          //     projectId: item.id,
                          //     projectName: item.projectName,
                          //     code: item.projectCode,
                          //   ),
                          // );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('brand_${widget.report.id}'),
                  nameForm: 'sale_staff_brand_${widget.report.id}',
                  nameTextField: 'brand_${widget.report.id}',
                  label: (work.projectName ?? '').isNotEmpty
                      ? work.projectName!
                      : 'Hãng',
                  readOnly: true,
                  icon: Icons.category_outlined,
                ),
              ),
            ),

            const SizedBox(height: 8),

            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn loại dự án',
                        items: state.projects,
                        displayText: (v) =>
                            '${v.projectCode} - ${v.projectName}',
                        onSelected: (item) {
                          // context.read<SaleBloc>().add(
                          //   SaleEvent.updateWork(
                          //     index: widget.index,
                          //     projectId: item.id,
                          //     projectName: item.projectName,
                          //     code: item.projectCode,
                          //   ),
                          // );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('type_project_${widget.report.id}'),
                  nameForm: 'sale_staff_type_project_${widget.report.id}',
                  nameTextField: 'type_project_${widget.report.id}',
                  label: (work.projectName ?? '').isNotEmpty
                      ? work.projectName!
                      : 'Loại dự án',
                  readOnly: true,
                  icon: Icons.category_outlined,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// ===== TRẠNG THÁI DỰ ÁN =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn trạng thái dự án',
                        items: state.projects,
                        displayText: (v) => v.projectName ?? '',
                        onSelected: (item) {
                          // context.read<SaleBloc>().add(
                          //   SaleEvent.updateWork(
                          //     index: widget.index,
                          //     projectStatusId: item.id,
                          //   ),
                          // );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('status_${widget.report.id}'),
                  nameForm: 'sale_staff_status_${widget.report.id}',
                  nameTextField: 'status_${widget.report.id}',
                  label: (work.projectName ?? '').isNotEmpty
                      ? work.projectName!
                      : 'Trạng thái dự án',
                  readOnly: true,
                  icon: Icons.flag_outlined,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// ===== KHÁCH HÀNG =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn khách hàng',
                        items: state.projects,
                        displayText: (v) => v.projectName ?? '',
                        onSelected: (item) {
                          // context.read<SaleBloc>().add(
                          //   SaleEvent.updateWork(
                          //     index: widget.index,
                          //     customerId: item.id,
                          //     customerName: item.customerName,
                          //   ),
                          // );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('customer_${widget.report.id}'),
                  nameForm: 'sale_staff_customer_${widget.report.id}',
                  nameTextField: 'customer_${widget.report.id}',
                  label: (work.projectName ?? '').isNotEmpty
                      ? work.projectName!
                      : 'Khách hàng',
                  readOnly: true,
                  icon: Icons.business_outlined,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// ===== NGƯỜI LIÊN HỆ =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn người liên hệ',
                        items: state.projects,
                        displayText: (v) => v.projectName ?? '',
                        onSelected: (item) {
                          // context.read<SaleBloc>().add(
                          //   SaleEvent.updateWork(
                          //     index: widget.index,
                          //     contactId: item.id,
                          //     contactName: item.contactName,
                          //   ),
                          // );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('contact_${widget.report.id}'),
                  nameForm: 'sale_staff_contact_${widget.report.id}',
                  nameTextField: 'contact_${widget.report.id}',
                  label: (work.projectName ?? '').isNotEmpty
                      ? work.projectName!
                      : 'Người liên hệ',
                  readOnly: true,
                  icon: Icons.person_outline,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// ===== LOẠI NHÓM =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn loại nhóm',
                        items: state.projects,
                        displayText: (v) => v.projectName ?? '',
                        onSelected: (item) {
                          // context.read<SaleBloc>().add(
                          //   SaleEvent.updateWork(
                          //     index: widget.index,
                          //     groupType: item.id,
                          //   ),
                          // );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('group_${widget.report.id}'),
                  nameForm: 'sale_staff_group_${widget.report.id}',
                  nameTextField: 'group_${widget.report.id}',
                  label: (work.projectName ?? '').isNotEmpty
                      ? work.projectName!
                      : 'Loại nhóm',
                  readOnly: true,
                  icon: Icons.group_outlined,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// ===== END USER =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn End User',
                        items: state.projects,
                        displayText: (v) => v.projectName ?? '',
                        onSelected: (item) {
                          // context.read<SaleBloc>().add(
                          //   SaleEvent.updateWork(
                          //     index: widget.index,
                          //     endUserId: item.id,
                          //   ),
                          // );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('enduser_${widget.report.id}'),
                  nameForm: 'sale_staff_enduser_${widget.report.id}',
                  nameTextField: 'enduser_${widget.report.id}',
                  label: (work.projectName ?? '').isNotEmpty
                      ? work.projectName!
                      : 'End User',
                  readOnly: true,
                  icon: Icons.apartment_outlined,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// ===== CHECKBOX =====
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: widget.readonly
                            ? null
                            : (v) {
                                // context.read<SaleBloc>().add(
                                //   SaleEvent.updateWork(
                                //     index: widget.index,
                                //     saleOpportunity: v,
                                //   ),
                                // );
                              },
                      ),
                      const Text('Cơ hội bán'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: widget.readonly
                            ? null
                            : (v) {
                                // context.read<SaleBloc>().add(
                                //   SaleEvent.updateWork(
                                //     index: widget.index,
                                //     bigAccount: v,
                                //   ),
                                // );
                              },
                      ),
                      const Text('Big Account'),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            FormInputField(
              key: ValueKey('content_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'sale_staff_content_${widget.report.id}',
              nameTextField: 'content_${widget.report.id}',

              label: 'Nội dung công việc',
              maxLines: 1,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              controller: _contentController,
              onChanged: (v) {
                // context.read<SaleBloc>().add(
                //   SaleEvent.updateWork(
                //     index: widget.index,
                //     content: v,
                //   ),
                // );
              },
            ),

            const SizedBox(height: 8),

            /// ===== RESULT =====
            FormInputField(
              key: ValueKey('result_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'sale_staff_result_${widget.report.id}',
              nameTextField: 'result_${widget.report.id}',
              label: 'Kết quả',
              maxLines: 1,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline, // ⬅ Enter xuống dòng
              controller: _resultsController,
              onChanged: (v) {
                // context.read<SaleBloc>().add(
                //   SaleEvent.updateWork(
                //     index: widget.index,
                //     results: v,
                //   ),
                // );
              },
            ),
            const SizedBox(height: 8),

            FormInputField(
              key: ValueKey('backlog_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'sale_staff_backlog_${widget.report.id}',
              nameTextField: 'backlog_${widget.report.id}',
              label: 'Vấn đề tồn đọng',
              maxLines: 1,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline, // ⬅ Enter xuống dòng
              controller: _backlogController,
              onChanged: (v) {
                // context.read<SaleBloc>().add(
                //   SaleEvent.updateWork(
                //     index: widget.index,
                //     results: v,
                //   ),
                // );
              },
            ),
            const SizedBox(height: 8),

            FormInputField(
              key: ValueKey('plan_next_day_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'sale_staff_plan_next_day_${widget.report.id}',
              nameTextField: 'plan_next_day_${widget.report.id}',
              label: 'Kế hoạch tiếp theo',
              maxLines: 1,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline, // ⬅ Enter xuống dòng
              controller: _planNextDayController,
              onChanged: (v) {
                // context.read<SaleBloc>().add(
                //   SaleEvent.updateWork(
                //     index: widget.index,
                //     results: v,
                //   ),
                // );
              },
            ),
            const SizedBox(height: 8),

            FormInputField(
              key: ValueKey('product_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'sale_staff_product_${widget.report.id}',
              nameTextField: 'product_${widget.report.id}',
              label: 'Sản phẩm của KH',
              maxLines: 1,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline, // ⬅ Enter xuống dòng
              controller: _noteController,
              onChanged: (v) {
                // context.read<SaleBloc>().add(
                //   SaleEvent.updateWork(
                //     index: widget.index,
                //     results: v,
                //   ),
                // );
              },
            ),
          ],
        );
      },
    );
  }
}
