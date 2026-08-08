import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/sale_staff_model.dart';
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
  late TextEditingController _contentController;
  late TextEditingController _resultsController;
  late TextEditingController _planNextDayController;

  late TextEditingController _backlogController;
  late TextEditingController _problemController;
  late TextEditingController _problemSolveController;
  late TextEditingController _customerProductController;
  late TextEditingController _projectController;

  FormFieldState<String>? projectField;
  FormFieldState<String>? firmField;
  FormFieldState<String>? typeProjectField;
  FormFieldState<String>? statusProjectField;
  FormFieldState<String>? customerField;
  FormFieldState<String>? typeTeamSaleField;

  FormFieldState<String>? contactField;

  FormFieldState<String>? endUserField;
  @override
  void initState() {
    super.initState();

    final r = widget.report;


    _contentController = TextEditingController(text: r.content);
    _resultsController = TextEditingController(text: r.results);
    _planNextDayController = TextEditingController(text: r.planNextDay);

    _backlogController = TextEditingController(text: r.backlog ?? '');
    _problemController = TextEditingController(text: r.problem ?? '');
    _problemSolveController = TextEditingController(text: r.problemSolve ?? '');
    _customerProductController = TextEditingController(text: r.customerProduct ?? '');

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

    // Tránh cập nhật TextEditingController trong lúc build đang diễn ra.
    // Dời việc sync dữ liệu sang frame tiếp theo để không vi phạm assert
    // "setState() or markNeedsBuild() called during build".
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final r = widget.report;

      _set(_contentController, r.content);
      _set(_resultsController, r.results);
      _set(_planNextDayController, r.planNextDay);

      _set(_backlogController, r.backlog ?? '');
      _set(_problemController, r.problem ?? '');
      _set(_problemSolveController, r.problemSolve ?? '');
      _set(_customerProductController, r.customerProduct ?? '');

      _set(_projectController, r.projectText ?? '');
    });
  }

  @override
  void dispose() {
    _contentController.dispose();
    _resultsController.dispose();
    _planNextDayController.dispose();

    _backlogController.dispose();
    _problemController.dispose();
    _problemSolveController.dispose();
    _customerProductController.dispose();
    _projectController.dispose();

    super.dispose();
  }

  DateTime? _initialReportDate() {
    final now = DateTime.now();

    // 09:00 hôm nay
    final todayAt9 = DateTime(now.year, now.month, now.day, 9);

    // Nếu trước 09:00 => null, sau 09:00 => now
    if (now.isBefore(todayAt9)) return null;
    return now;
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
          prev.staffWorks != curr.staffWorks ||
          prev.customerContacts != curr.customerContacts ||
          prev.customerParts != curr.customerParts,
      builder: (context, state) {
        final work = state.staffWorks[widget.index];
        // Dùng customerId của dòng công việc (sau khi chọn khách hàng), không dùng state.customerId
        final customerId = work.customerId;

        return Column(
          children: [
            /// ===== NGÀY =====
            FormDateTimePicker(
              icon: Icons.calendar_today,
              nameForm: 'sale_staff_add_date_start',
              nameTimePicker: 'date_start',
              label: 'Ngày thực hiện gần nhất',
              inputType: InputType.date,
              initialValue: _initialReportDate(),
              format: DateFormat('dd/MM/yyyy'),
            ),

            const SizedBox(height: 16),

            FormDateTimePicker(
              icon: Icons.calendar_today,
              nameForm: 'sale_staff_add_date_end',
              nameTimePicker: 'date_end',
              label: 'Ngày dự kiến thực hiện',
              inputType: InputType.date,
              initialValue: _initialReportDate(),
              format: DateFormat('dd/MM/yyyy'),
            ),

            const SizedBox(height: 16),

            /// ===== Nội dung công việc =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      if (state.projects.isEmpty) {
                        context.read<SaleBloc>().add(
                          const SaleEvent.getSaleProject(),
                        );
                      }
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn dự án',
                        items: state.projects,
                        displayText: (v) =>
                            '${v.projectCode} - ${v.projectName}',
                        onSelected: (item) {
                          projectField?.didChange(item.projectName);
                          context.read<SaleBloc>().add(
                            SaleEvent.updateWork(
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
                  nameForm: 'sale_staff_project_${widget.report.id}',
                  nameTextField: 'project_${widget.report.id}',
                  label: (work.projectCode ?? '').isNotEmpty
                      ? work.projectCode!
                      : 'Chọn dự án',
                  icon: Icons.category_outlined,
                  onFieldCreated: (field) => projectField = field,
                  readOnly: true,
                ),
              ),
            ),

            const SizedBox(height: 16),

            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      if (state.firmBases.isEmpty) {
                        context.read<SaleBloc>().add(
                          const SaleEvent.getFirmBase(),
                        );
                      }
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn hãng',
                        items: state.firmBases,
                        displayText: (v) => v.firmName,
                        onSelected: (item) {
                          firmField?.didChange(item.firmName);
                          context.read<SaleBloc>().add(
                            SaleEvent.updateWork(
                              index: widget.index,
                              firmId: item.id,
                              firmName: item.firmName,
                            ),
                          );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('firm_${widget.report.id}'),
                  nameForm: 'sale_staff_firm_${widget.report.id}',
                  nameTextField: 'firm_${widget.report.id}',
                  label: 'Hãng',
                  onFieldCreated: (field) => firmField = field,
                  readOnly: true,
                  icon: Icons.category_outlined,
                ),
              ),
            ),

            const SizedBox(height: 16),

            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn loại dự án',
                        items: state.typeProjectBases,
                        displayText: (v) => v.projectTypeName,
                        onSelected: (item) {
                          typeProjectField?.didChange(item.projectTypeName);
                          context.read<SaleBloc>().add(
                            SaleEvent.updateWork(
                              index: widget.index,
                              typeProjectId: item.id,
                              typeProjectName: item.projectTypeName,
                            ),
                          );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('type_project_${widget.report.id}'),
                  nameForm: 'sale_staff_type_project_${widget.report.id}',
                  nameTextField: 'type_project_${widget.report.id}',
                  label: 'Loại dự án',
                  onFieldCreated: (field) => typeProjectField = field,
                  readOnly: true,
                  icon: Icons.category_outlined,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// ===== TRẠNG THÁI DỰ ÁN =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn trạng thái dự án',
                        items: state.statusProjects,
                        displayText: (v) => v.statusName ?? '',
                        onSelected: (item) {
                          statusProjectField?.didChange(item.statusName);
                          context.read<SaleBloc>().add(
                            SaleEvent.updateWork(
                              index: widget.index,
                              statusProjectId: item.id,
                              statusProjectName: item.statusName,
                              indexStatusProject: item.stt,
                            ),
                          );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('status_${widget.report.id}'),
                  nameForm: 'sale_staff_status_${widget.report.id}',
                  nameTextField: 'status_${widget.report.id}',
                  label: 'Trạng thái dự án',
                  onFieldCreated: (field) => statusProjectField = field,
                  readOnly: true,
                  icon: Icons.flag_outlined,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// ===== KHÁCH HÀNG =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn khách hàng',
                        items: state.customers,
                        displayText: (v) =>
                            '${v.customerCode} - ${v.customerName}',
                        onSelected: (item) {
                          customerField?.didChange(item.customerName);
                          context.read<SaleBloc>().add(
                            SaleEvent.updateWork(
                              index: widget.index,
                              customerId: item.id,
                              customerName: item.customerName,
                              customerCode: item.customerCode,
                            ),
                          );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('customer_${widget.report.id}'),
                  nameForm: 'sale_staff_customer_${widget.report.id}',
                  nameTextField: 'customer_${widget.report.id}',
                  label: (work.customerCode ?? '').isNotEmpty
                      ? work.customerCode!
                      : 'Khách hàng',
                  onFieldCreated: (field) => customerField = field,
                  readOnly: true,
                  icon: Icons.business_outlined,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// ===== NGƯỜI LIÊN HỆ =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      // Nếu chưa có list hoặc vừa đổi KH (bloc đã prefetch), vẫn gọi khi rỗng để retry
                      if (customerId != null &&
                          customerId > 0 &&
                          state.customerContacts.isEmpty) {
                        context.read<SaleBloc>().add(
                          SaleEvent.getCustomerContact(customerId: customerId),
                        );
                      }
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn người liên hệ',
                        items: state.customerContacts,
                        displayText: (v) => v.contactName,
                        onSelected: (item) {
                          contactField?.didChange(item.contactName);
                          context.read<SaleBloc>().add(
                            SaleEvent.updateWork(
                              index: widget.index,
                              customerContactId: item.id,
                              customerContactName: item.contactName,
                              customerContactPhone: item.contactPhone,
                              customerContactTeam: item.customerTeam,
                              customerContactPart: item.customerPart,
                              customerContactPosition: item.customerPosition,
                            ),
                          );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('contact_${widget.report.id}'),
                  nameForm: 'sale_staff_contact_${widget.report.id}',
                  nameTextField: 'contact_${widget.report.id}',
                  label: 'Người liên hệ',
                  readOnly: true,
                  onFieldCreated: (field) => contactField = field,
                  icon: Icons.person_outline,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// ===== LOẠI NHÓM =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn loại nhóm',
                        items: state.typeTeamSales,
                        displayText: (v) => v.mainIndex,
                        onSelected: (item) {
                          typeTeamSaleField?.didChange(item.mainIndex);
                          context.read<SaleBloc>().add(
                            SaleEvent.updateWork(
                              index: widget.index,
                              typeTeamSaleId: item.id,
                              typeTeamSaleMainIndex: item.mainIndex,
                            ),
                          );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('group_${widget.report.id}'),
                  nameForm: 'sale_staff_group_${widget.report.id}',
                  nameTextField: 'group_${widget.report.id}',
                  label: 'Loại nhóm',
                  onFieldCreated: (field) => typeTeamSaleField = field,
                  readOnly: true,
                  icon: Icons.group_outlined,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// ===== END USER =====
            GestureDetector(
              onTap: widget.readonly
                  ? null
                  : () {
                      if (customerId != null &&
                          customerId > 0 &&
                          state.customerParts.isEmpty) {
                        context.read<SaleBloc>().add(
                          SaleEvent.getCustomerPart(customerId: customerId),
                        );
                      }
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn bộ phận khách hàng',
                        items: state.customerParts,
                        displayText: (v) => v.partCode,
                        onSelected: (item) {
                          endUserField?.didChange(item.partCode);
                          context.read<SaleBloc>().add(
                            SaleEvent.updateWork(
                              index: widget.index,
                              customerPartId: item.id,
                              customerPartName: item.partName,
                              customerPartCode: item.partCode,
                              indexCustomerPart: item.stt,
                            ),
                          );
                        },
                      );
                    },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('enduser_${widget.report.id}'),
                  nameForm: 'sale_staff_enduser_${widget.report.id}',
                  nameTextField: 'enduser_${widget.report.id}',
                  label: 'Bộ phận khách hàng',
                  onFieldCreated: (field) => endUserField = field,
                  readOnly: true,
                  icon: Icons.apartment_outlined,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// ===== CHECKBOX =====
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: work.saleOpportunity,
                        onChanged: widget.readonly
                            ? null
                            : (v) {
                                context.read<SaleBloc>().add(
                                  SaleEvent.updateWork(
                                    index: widget.index,
                                    saleOpportunity: v,
                                  ),
                                );
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
                        value: work.bigAccount,
                        onChanged: widget.readonly
                            ? null
                            : (v) {
                                context.read<SaleBloc>().add(
                                  SaleEvent.updateWork(
                                    index: widget.index,
                                    bigAccount: v,
                                  ),
                                );
                              },
                      ),
                      const Text('Big Account'),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            FormInputField(
              key: ValueKey('content_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'sale_staff_content_${widget.report.id}',
              nameTextField: 'content_${widget.report.id}',

              label: 'Nội dung công việc',
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              autoExpand: true,
              controller: _contentController,
              onChanged: (v) {
                context.read<SaleBloc>().add(
                  SaleEvent.updateWork(
                    index: widget.index,
                    content: v,
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            /// ===== RESULT =====
            FormInputField(
              key: ValueKey('result_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'sale_staff_result_${widget.report.id}',
              nameTextField: 'result_${widget.report.id}',
              label: 'Kết quả',
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              autoExpand: true,
              controller: _resultsController,
              onChanged: (v) {
                context.read<SaleBloc>().add(
                  SaleEvent.updateWork(
                    index: widget.index,
                    results: v,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            FormInputField(
              key: ValueKey('backlog_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'sale_staff_backlog_${widget.report.id}',
              nameTextField: 'backlog_${widget.report.id}',
              label: 'Vấn đề tồn đọng',
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              autoExpand: true,
              controller: _backlogController,
              onChanged: (v) {
                context.read<SaleBloc>().add(
                  SaleEvent.updateWork(
                    index: widget.index,
                    backlog: v,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            FormInputField(
              key: ValueKey('plan_next_day_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'sale_staff_plan_next_day_${widget.report.id}',
              nameTextField: 'plan_next_day_${widget.report.id}',
              label: 'Kế hoạch tiếp theo',
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              autoExpand: true,
              controller: _planNextDayController,
              onChanged: (v) {
                context.read<SaleBloc>().add(
                  SaleEvent.updateWork(
                    index: widget.index,
                    planNextDay: v,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            FormInputField(
              key: ValueKey('product_${widget.report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'sale_staff_product_${widget.report.id}',
              nameTextField: 'product_${widget.report.id}',
              label: 'Sản phẩm của KH',
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              autoExpand: true,
              controller: _customerProductController,
              onChanged: (v) {
                context.read<SaleBloc>().add(
                  SaleEvent.updateWork(
                    index: widget.index,
                    customerProduct: v,
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
