import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../data/sale_admin_model.dart';
import '../bloc/sale_bloc.dart';

class SaleAdminAddItem extends StatefulWidget {
  final String title;
  final int index;
  final SaleAdminWork report;

  final bool isExpanded;
  final bool readonly;
  final bool alwaysExpanded;

  final VoidCallback onToggleExpand;
  final VoidCallback? onDelete;

  const SaleAdminAddItem({
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
  State<SaleAdminAddItem> createState() => _SaleAdminAddItemState();
}

class _SaleAdminAddItemState extends State<SaleAdminAddItem> {
  late TextEditingController _contentController;
  late TextEditingController _resultController;
  late TextEditingController _planController;
  late TextEditingController _blockingController;
  late TextEditingController _solutionController;

  FormFieldState<String>? staffField;
  FormFieldState<String>? projectField;
  FormFieldState<String>? customerField;
  FormFieldState<String>? requesterField;
  FormFieldState<String>? reportTypeField;

  @override
  void initState() {
    super.initState();

    final r = widget.report;

    _contentController = TextEditingController(text: r.reportContent ?? '');
    _resultController = TextEditingController(text: r.result ?? '');
    _planController = TextEditingController(text: r.planNextDay ?? '');
    _blockingController = TextEditingController(text: r.problem ?? '');
    _solutionController = TextEditingController(text: r.problemSolve ?? '');
  }

  void _set(TextEditingController c, String value) {
    if (c.text == value) return;

    c.value = TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }

  @override
  void didUpdateWidget(covariant SaleAdminAddItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final r = widget.report;

      _set(_contentController, r.reportContent ?? '');
      _set(_resultController, r.result ?? '');
      _set(_planController, r.planNextDay ?? '');
      _set(_blockingController, r.problem ?? '');
      _set(_solutionController, r.problemSolve ?? '');
    });
  }

  @override
  void dispose() {
    _contentController.dispose();
    _resultController.dispose();
    _planController.dispose();
    _blockingController.dispose();
    _solutionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showExpanded = widget.alwaysExpanded || widget.isExpanded;

    return Slidable(
      key: ValueKey('admin_${widget.index}'),
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
          prev.adminProjects != curr.adminProjects ||
          prev.adminCustomers != curr.adminCustomers ||
          prev.adminTypeReports != curr.adminTypeReports ||
          prev.users != curr.users,
      builder: (context, state) {
        return Column(
          children: [
            /// STAFF
            GestureDetector(
              onTap: () {
                openSelectBottomSheet<UserResponse>(
                  context: context,
                  title: 'Chọn nhân viên',
                  items: state.users,
                  displayText: (v) => '${v.code} - ${v.fullName}',
                  onSelected: (item) {
                    staffField?.didChange(item.fullName);

                    context.read<SaleBloc>().add(
                      SaleEvent.updateAdminWork(
                        index: widget.index,
                        employeeId: item.id,
                      ),
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: FormInputField(
                  nameForm: 'sale_admin_staff_${widget.index}',
                  nameTextField: 'staff_${widget.index}',
                  label: 'Nhân viên',
                  icon: Icons.person_outline,
                  onFieldCreated: (field) => staffField = field,
                  readOnly: true,
                ),
              ),
            ),
            const SizedBox(height: 16),

            /// TYPE
            GestureDetector(
              onTap: () {
                openSelectBottomSheet<SaleAdminTypeReportResponse>(
                  context: context,
                  title: 'Chọn loại báo cáo',
                  items: state.adminTypeReports,
                  displayText: (v) => v.reportTypeName,
                  onSelected: (item) {
                    reportTypeField?.didChange(item.reportTypeName);

                    context.read<SaleBloc>().add(
                      SaleEvent.updateAdminWork(
                        index: widget.index,
                        reportTypeId: item.id,
                        reportTypeName: item.reportTypeName,
                      ),
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: FormInputField(
                  nameForm: 'sale_admin_type_${widget.index}',
                  nameTextField: 'type_${widget.index}',
                  label: 'Loại báo cáo',
                  icon: Icons.category_outlined,
                  onFieldCreated: (field) => reportTypeField = field,
                  readOnly: true,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// PROJECT
            GestureDetector(
              onTap: () {
                openSelectBottomSheet<SaleAdminProjectResponse>(
                  context: context,
                  title: 'Chọn dự án',
                  items: state.adminProjects,
                  displayText: (v) => '${v.projectCode} - ${v.projectName}',
                  onSelected: (item) {
                    projectField?.didChange(
                      '${item.projectCode} - ${item.projectName}',
                    );

                    context.read<SaleBloc>().add(
                      SaleEvent.updateAdminWork(
                        index: widget.index,
                        projectId: item.id,
                      ),
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: FormInputField(
                  nameForm: 'sale_admin_project_${widget.index}',
                  nameTextField: 'project_${widget.index}',
                  label: 'Dự án',
                  icon: Icons.work_outline,
                  onFieldCreated: (field) => projectField = field,
                  readOnly: true,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// CUSTOMER
            GestureDetector(
              onTap: () {
                openSelectBottomSheet<SaleAdminCustomerResponse>(
                  context: context,
                  title: 'Chọn khách hàng',
                  items: state.adminCustomers,
                  displayText: (v) => '${v.customerCode} - ${v.customerName}',
                  onSelected: (item) {
                    customerField?.didChange(
                      '${item.customerCode} - ${item.customerName}',
                    );

                    context.read<SaleBloc>().add(
                      SaleEvent.updateAdminWork(
                        index: widget.index,
                        customerId: item.id,
                      ),
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: FormInputField(
                  nameForm: 'sale_admin_customer_${widget.index}',
                  nameTextField: 'customer_${widget.index}',
                  label: 'Khách hàng',
                  icon: Icons.business_outlined,
                  onFieldCreated: (field) => customerField = field,
                  readOnly: true,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// REQUESTER
            GestureDetector(
              onTap: () {
                openSelectBottomSheet<UserResponse>(
                  context: context,
                  title: 'Chọn người yêu cầu',
                  items: state.users,
                  displayText: (v) => '${v.code} - ${v.fullName}',
                  onSelected: (item) {
                    requesterField?.didChange(item.fullName);

                    context.read<SaleBloc>().add(
                      SaleEvent.updateAdminWork(
                        index: widget.index,
                        employeeRequestId: item.id,
                      ),
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: FormInputField(
                  nameForm: 'sale_admin_requester_${widget.index}',
                  nameTextField: 'requester_${widget.index}',
                  label: 'Người yêu cầu',
                  icon: Icons.person_pin_outlined,
                  onFieldCreated: (field) => requesterField = field,
                  readOnly: true,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// CONTENT
            FormInputField(
              icon: Icons.description_outlined,
              nameForm: 'sale_admin_content_${widget.index}',
              nameTextField: 'content_${widget.index}',
              label: 'Nội dung báo cáo',
              controller: _contentController,
              maxLines: 3,
              onChanged: (v) {
                context.read<SaleBloc>().add(
                  SaleEvent.updateAdminWork(
                    index: widget.index,
                    reportContent: v,
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            /// RESULT
            FormInputField(
              icon: Icons.check_circle_outline,
              nameForm: 'sale_admin_result_${widget.index}',
              nameTextField: 'result_${widget.index}',
              label: 'Kết quả xử lý',
              controller: _resultController,
              maxLines: 3,
              onChanged: (v) {
                context.read<SaleBloc>().add(
                  SaleEvent.updateAdminWork(index: widget.index, result: v),
                );
              },
            ),

            const SizedBox(height: 16),

            /// PLAN
            FormInputField(
              icon: Icons.assignment_outlined,
              nameForm: 'sale_admin_plan_${widget.index}',
              nameTextField: 'plan_${widget.index}',
              label: 'Kế hoạch ngày tiếp theo',
              controller: _planController,
              maxLines: 3,
              onChanged: (v) {
                context.read<SaleBloc>().add(
                  SaleEvent.updateAdminWork(
                    index: widget.index,
                    planNextDay: v,
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            /// BLOCKING
            FormInputField(
              icon: Icons.warning_amber_outlined,
              nameForm: 'sale_admin_blocking_${widget.index}',
              nameTextField: 'blocking_${widget.index}',
              label: 'Vấn đề tồn đọng',
              controller: _blockingController,
              maxLines: 2,
              onChanged: (v) {
                context.read<SaleBloc>().add(
                  SaleEvent.updateAdminWork(index: widget.index, problem: v),
                );
              },
            ),

            const SizedBox(height: 16),

            /// SOLUTION
            FormInputField(
              icon: Icons.build_outlined,
              nameForm: 'sale_admin_solution_${widget.index}',
              nameTextField: 'solution_${widget.index}',
              label: 'Giải quyết vấn đề',
              controller: _solutionController,
              maxLines: 2,
              onChanged: (v) {
                context.read<SaleBloc>().add(
                  SaleEvent.updateAdminWork(
                    index: widget.index,
                    problemSolve: v,
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
