import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../data/sale_admin_model.dart';
import '../bloc/sale_bloc.dart';

class SaleAdminEditScreen extends StatefulWidget {
  final int dailyId;

  const SaleAdminEditScreen({super.key, required this.dailyId});

  @override
  State<SaleAdminEditScreen> createState() => _SaleAdminEditScreenState();
}

class _SaleAdminEditScreenState
    extends BaseState<SaleAdminEditScreen, SaleEvent, SaleState, SaleBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

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

  bool _bound = false;

  @override
  void initState() {
    super.initState();

    _contentController = TextEditingController();
    _resultController = TextEditingController();
    _planController = TextEditingController();
    _blockingController = TextEditingController();
    _solutionController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(SaleEvent.selectAdminReport(dailyID: widget.dailyId));
      bloc.add(const SaleEvent.getAdminProject());
      bloc.add(const SaleEvent.getAdminCustomer());
      bloc.add(const SaleEvent.getAdminTypeReport());
      bloc.add(const SaleEvent.getAllUser());
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

  void _bindFromWork(SaleAdminWork work) {
    if (_bound) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _contentController.text = work.reportContent ?? '';
      _resultController.text = work.result ?? '';
      _planController.text = work.planNextDay ?? '';
      _blockingController.text = work.problem ?? '';
      _solutionController.text = work.problemSolve ?? '';

      staffField?.didChange(work.employeeFullName ?? '');
      reportTypeField?.didChange(work.reportTypeName ?? '');
      customerField?.didChange(work.customerName ?? '');
      requesterField?.didChange(work.employeeRequestFullName ?? '');
      projectField?.didChange(work.projectCode ?? '');
    });
    _bound = true;
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<SaleBloc, SaleState>(
      listenWhen: (p, c) => p.submitSuccess != c.submitSuccess,
      listener: (context, state) {
        if (state.submitSuccess) {
          context.pop(true);
        }
      },

      child: Stack(
        children: [
          BaseScaffold(
            appBar: const AppBarCommon(title: Text('Chỉnh sửa báo cáo')),

            body: BlocBuilder<SaleBloc, SaleState>(
              buildWhen: (p, c) =>
                  p.selectedReportAdminDetail != c.selectedReportAdminDetail ||
                  p.adminWorks != c.adminWorks ||
                  p.adminProjects != c.adminProjects ||
                  p.adminCustomers != c.adminCustomers ||
                  p.adminTypeReports != c.adminTypeReports,

              builder: (context, state) {
                if (state.selectedReportAdminDetail == null ||
                    state.adminWorks.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                final work = state.adminWorks[0];
                _bindFromWork(work);

                return Column(
                  children: [
                    Expanded(
                      child: FormBuilder(
                        key: _formKey,
                        initialValue: {
                          'date': work.dateReport ?? DateTime.now(),
                        },
                        child: ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            FormCard(
                              child: Column(
                                children: [
                                  /// STAFF
                                  GestureDetector(
                                    onTap: () {
                                      openSelectBottomSheet<UserResponse>(
                                        context: context,
                                        title: 'Chọn nhân viên',
                                        items: state.users,
                                        displayText: (v) =>
                                            '${v.code} - ${v.fullName}',
                                        onSelected: (item) {
                                          staffField?.didChange(item.fullName);

                                          context.read<SaleBloc>().add(
                                            SaleEvent.updateAdminWork(
                                              index: 0,
                                              employeeId: item.id,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        nameForm: 'sale_admin_staff_0',
                                        nameTextField: 'staff_0',
                                        label: 'Nhân viên',
                                        icon: Icons.person_outline,
                                        onFieldCreated: (field) =>
                                            staffField = field,
                                        readOnly: true,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  /// TYPE
                                  GestureDetector(
                                    onTap: () {
                                      openSelectBottomSheet<
                                        SaleAdminTypeReportResponse
                                      >(
                                        context: context,
                                        title: 'Chọn loại báo cáo',
                                        items: state.adminTypeReports,
                                        displayText: (v) => v.reportTypeName,
                                        onSelected: (item) {
                                          reportTypeField?.didChange(
                                            item.reportTypeName,
                                          );

                                          context.read<SaleBloc>().add(
                                            SaleEvent.updateAdminWork(
                                              index: 0,
                                              reportTypeId: item.id,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        nameForm: 'sale_admin_type_0',
                                        nameTextField: 'type_0',
                                        label: 'Loại báo cáo',
                                        icon: Icons.category_outlined,
                                        onFieldCreated: (field) =>
                                            reportTypeField = field,
                                        readOnly: true,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  /// PROJECT
                                  GestureDetector(
                                    onTap: () {
                                      openSelectBottomSheet<
                                        SaleAdminProjectResponse
                                      >(
                                        context: context,
                                        title: 'Chọn dự án',
                                        items: state.adminProjects,
                                        displayText: (v) =>
                                            '${v.projectCode} - ${v.projectName}',
                                        onSelected: (item) {
                                          projectField?.didChange(
                                            '${item.projectCode} - ${item.projectName}',
                                          );

                                          context.read<SaleBloc>().add(
                                            SaleEvent.updateAdminWork(
                                              index: 0,
                                              projectId: item.id,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        nameForm: 'sale_admin_project_0',
                                        nameTextField: 'project_0',
                                        label: 'Dự án',
                                        icon: Icons.work_outline,
                                        onFieldCreated: (field) =>
                                            projectField = field,
                                        readOnly: true,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  /// CUSTOMER
                                  GestureDetector(
                                    onTap: () {
                                      openSelectBottomSheet<
                                        SaleAdminCustomerResponse
                                      >(
                                        context: context,
                                        title: 'Chọn khách hàng',
                                        items: state.adminCustomers,
                                        displayText: (v) =>
                                            '${v.customerCode} - ${v.customerName}',
                                        onSelected: (item) {
                                          customerField?.didChange(
                                            '${item.customerCode} - ${item.customerName}',
                                          );

                                          context.read<SaleBloc>().add(
                                            SaleEvent.updateAdminWork(
                                              index: 0,
                                              customerId: item.id,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        nameForm: 'sale_admin_customer_0',
                                        nameTextField: 'customer_0',
                                        label: 'Khách hàng',
                                        icon: Icons.business_outlined,
                                        onFieldCreated: (field) =>
                                            customerField = field,
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
                                        displayText: (v) =>
                                            '${v.code} - ${v.fullName}',
                                        onSelected: (item) {
                                          requesterField?.didChange(
                                            item.fullName,
                                          );

                                          context.read<SaleBloc>().add(
                                            SaleEvent.updateAdminWork(
                                              index: 0,
                                              employeeRequestId: item.id,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        nameForm: 'sale_admin_requester_0',
                                        nameTextField: 'requester_0',
                                        label: 'Người yêu cầu',
                                        icon: Icons.person_pin_outlined,
                                        onFieldCreated: (field) =>
                                            requesterField = field,
                                        readOnly: true,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  /// CONTENT
                                  FormInputField(
                                    icon: Icons.description_outlined,
                                    nameForm: 'sale_admin_content_0',
                                    nameTextField: 'content_0',
                                    label: 'Nội dung báo cáo',
                                    controller: _contentController,
                                    maxLines: 3,
                                    onChanged: (v) {
                                      context.read<SaleBloc>().add(
                                        SaleEvent.updateAdminWork(
                                          index: 0,
                                          reportContent: v,
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 16),

                                  /// RESULT
                                  FormInputField(
                                    icon: Icons.check_circle_outline,
                                    nameForm: 'sale_admin_result_0',
                                    nameTextField: 'result_0',
                                    label: 'Kết quả xử lý',
                                    controller: _resultController,
                                    maxLines: 3,
                                    onChanged: (v) {
                                      context.read<SaleBloc>().add(
                                        SaleEvent.updateAdminWork(
                                          index: 0,
                                          result: v,
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 16),

                                  /// PLAN
                                  FormInputField(
                                    icon: Icons.assignment_outlined,
                                    nameForm: 'sale_admin_plan_0',
                                    nameTextField: 'plan_0',
                                    label: 'Kế hoạch ngày tiếp theo',
                                    controller: _planController,
                                    maxLines: 3,
                                    onChanged: (v) {
                                      context.read<SaleBloc>().add(
                                        SaleEvent.updateAdminWork(
                                          index: 0,
                                          planNextDay: v,
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 16),

                                  /// BLOCKING
                                  FormInputField(
                                    icon: Icons.warning_amber_outlined,
                                    nameForm: 'sale_admin_blocking_0',
                                    nameTextField: 'blocking_0',
                                    label: 'Vấn đề tồn đọng',
                                    controller: _blockingController,
                                    maxLines: 2,
                                    onChanged: (v) {
                                      context.read<SaleBloc>().add(
                                        SaleEvent.updateAdminWork(
                                          index: 0,
                                          problem: v,
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 16),

                                  /// SOLUTION
                                  FormInputField(
                                    icon: Icons.build_outlined,
                                    nameForm: 'sale_admin_solution_0',
                                    nameTextField: 'solution_0',
                                    label: 'Giải quyết vấn đề',
                                    controller: _solutionController,
                                    maxLines: 2,
                                    onChanged: (v) {
                                      context.read<SaleBloc>().add(
                                        SaleEvent.updateAdminWork(
                                          index: 0,
                                          problemSolve: v,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// ACTION
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: FormActions(
                        mode: FormActionMode.edit,
                        onCancel: () {
                          context.pop();
                        },
                        onSave: () {
                          final formState = _formKey.currentState;
                          if (formState == null) return;

                          final valid = formState.saveAndValidate();
                          if (!valid) return;

                          bloc.add(
                            SaleEvent.submitEditAdminReport(
                              work.dateReport ?? DateTime.now(),
                              widget.dailyId,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          BlocBuilder<SaleBloc, SaleState>(
            buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
            builder: (context, state) {
              if (!state.isSubmitting) {
                return const SizedBox.shrink();
              }

              return Positioned.fill(
                child: AbsorbPointer(
                  absorbing: true,
                  child: Container(
                    color: Colors.black.withOpacity(0.45),
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      'assets/lotties/Loading.json',
                      width: 240,
                      height: 240,
                      repeat: true,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
