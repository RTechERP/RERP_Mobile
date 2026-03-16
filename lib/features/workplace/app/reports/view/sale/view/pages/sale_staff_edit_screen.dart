import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/sale_model.dart';
import '../bloc/sale_bloc.dart';

class SaleStaffEditScreen extends StatefulWidget {
  final int dailyId;

  const SaleStaffEditScreen({super.key, required this.dailyId});

  @override
  State<SaleStaffEditScreen> createState() => _SaleStaffEditScreenState();
}

class _SaleStaffEditScreenState
    extends BaseState<SaleStaffEditScreen, SaleEvent, SaleState, SaleBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _contentController = TextEditingController();
  final _resultController = TextEditingController();
  final _backlogController = TextEditingController();
  final _planNextDayController = TextEditingController();
  final _customerProductController = TextEditingController();

  FormFieldState<String>? projectField;
  FormFieldState<String>? firmField;
  FormFieldState<String>? typeProjectField;
  FormFieldState<String>? statusProjectField;
  FormFieldState<String>? customerField;
  FormFieldState<String>? typeTeamSaleField;
  FormFieldState<String>? contactField;
  FormFieldState<String>? endUserField;

  bool _loaded = false;

  void _bindData(SaleStaffWork work) {
    if (_loaded) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _contentController.text = work.content;
      _resultController.text = work.results;
      _backlogController.text = work.backlog ?? '';
      _planNextDayController.text = work.planNextDay;
      _customerProductController.text = work.customerProduct ?? '';
    });

    _loaded = true;
  }

  @override
  void initState() {
    super.initState();

    bloc.add(SaleEvent.selectReport(dailyID: widget.dailyId, forEdit: true));
    bloc.add(const SaleEvent.getSaleProject());
    bloc.add(const SaleEvent.getFirmBase());
    bloc.add(const SaleEvent.getTypeProjectBase());
    bloc.add(const SaleEvent.getCustomer());
    bloc.add(const SaleEvent.getTypeTeamSale());
    bloc.add(const SaleEvent.getStatusProject());
  }

  @override
  void dispose() {
    _contentController.dispose();
    _resultController.dispose();
    _backlogController.dispose();
    _planNextDayController.dispose();
    _customerProductController.dispose();
    super.dispose();
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<SaleBloc, SaleState>(
      listenWhen: (p, c) => p.saveSuccess != c.saveSuccess,
      listener: (context, state) {
        if (state.saveSuccess) {
          context.pop(true);
        }
      },

      child: Stack(
        children: [
          BaseScaffold(
            appBar: const AppBarCommon(title: Text('Chỉnh sửa báo cáo')),

            body: BlocBuilder<SaleBloc, SaleState>(
              buildWhen: (p, c) =>
                  p.selectedReportDetail != c.selectedReportDetail ||
                  p.staffWorks != c.staffWorks ||
                  p.projects != c.projects ||
                  p.firmBases != c.firmBases ||
                  p.typeProjectBases != c.typeProjectBases ||
                  p.customers != c.customers ||
                  p.customerContacts != c.customerContacts ||
                  p.customerParts != c.customerParts ||
                  p.typeTeamSales != c.typeTeamSales ||
                  p.statusProjects != c.statusProjects,

              builder: (context, state) {
                if (state.selectedReportDetail == null ||
                    state.staffWorks.length != 1) {
                  return const Center(child: CircularProgressIndicator());
                }

                final work = state.staffWorks[0];
                _bindData(work);

                final customerId = work.customerId;

                return Column(
                  children: [
                    Expanded(
                      child: FormBuilder(
                        key: _formKey,
                        child: ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            FormCard(
                              child: Column(
                                children: [
                                  /// ===== NGÀY =====
                                  FormDateTimePicker(
                                    icon: Icons.calendar_today,
                                    nameForm: 'sale_staff_add_date_start',
                                    nameTimePicker: 'date_start',
                                    label: 'Ngày thực hiện gần nhất',
                                    inputType: InputType.date,
                                    initialValue: work.dateStart,
                                    format: DateFormat('dd/MM/yyyy'),
                                  ),

                                  const SizedBox(height: 16),

                                  FormDateTimePicker(
                                    icon: Icons.calendar_today,
                                    nameForm: 'sale_staff_add_date_end',
                                    nameTimePicker: 'date_end',
                                    label: 'Ngày dự kiến thực hiện',
                                    inputType: InputType.date,
                                    initialValue: work.dateEnd,
                                    format: DateFormat('dd/MM/yyyy'),
                                  ),

                                  const SizedBox(height: 16),

                                  /// ===== DỰ ÁN =====
                                  GestureDetector(
                                    onTap: () {
                                      if (state.projects.isEmpty) {
                                        bloc.add(
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
                                          projectField?.didChange(
                                            item.projectName,
                                          );

                                          bloc.add(
                                            SaleEvent.updateWork(
                                              index: 0,
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
                                        nameForm:
                                            'sale_staff_project_${widget.dailyId}',
                                        nameTextField:
                                            'project_${widget.dailyId}',
                                        label: 'Chọn dự án',
                                        icon: Icons.category_outlined,
                                        onFieldCreated: (field) =>
                                            projectField = field,
                                        readOnly: true,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  GestureDetector(
                                    onTap: () {
                                      if (state.firmBases.isEmpty) {
                                        bloc.add(const SaleEvent.getFirmBase());
                                      }
                                      openSelectBottomSheet(
                                        context: context,
                                        title: 'Chọn hãng',
                                        items: state.firmBases,
                                        displayText: (v) => v.firmName,
                                        onSelected: (item) {
                                          firmField?.didChange(item.firmName);

                                          bloc.add(
                                            SaleEvent.updateWork(
                                              index: 0,
                                              firmId: item.id,
                                              firmName: item.firmName,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        nameForm:
                                            'sale_staff_firm_${widget.dailyId}',
                                        nameTextField: 'firm_${widget.dailyId}',
                                        label: 'Hãng',
                                        icon: Icons.category_outlined,
                                        onFieldCreated: (field) =>
                                            firmField = field,
                                        readOnly: true,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  GestureDetector(
                                    onTap: () {
                                      if (state.typeProjectBases.isEmpty) {
                                        bloc.add(
                                          const SaleEvent.getTypeProjectBase(),
                                        );
                                      }
                                      openSelectBottomSheet(
                                        context: context,
                                        title: 'Chọn loại dự án',
                                        items: state.typeProjectBases,
                                        displayText: (v) => v.projectTypeName,
                                        onSelected: (item) {
                                          typeProjectField?.didChange(
                                            item.projectTypeName,
                                          );

                                          bloc.add(
                                            SaleEvent.updateWork(
                                              index: 0,
                                              typeProjectId: item.id,
                                              typeProjectName:
                                                  item.projectTypeName,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        nameForm:
                                            'sale_staff_type_project_${widget.dailyId}',
                                        nameTextField:
                                            'type_project_${widget.dailyId}',
                                        label: 'Loại dự án',
                                        icon: Icons.category_outlined,
                                        onFieldCreated: (field) =>
                                            typeProjectField = field,
                                        readOnly: true,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  GestureDetector(
                                    onTap: () {
                                      if (state.statusProjects.isEmpty) {
                                        bloc.add(
                                          const SaleEvent.getStatusProject(),
                                        );
                                      }
                                      openSelectBottomSheet(
                                        context: context,
                                        title: 'Chọn trạng thái dự án',
                                        items: state.statusProjects,
                                        displayText: (v) => v.statusName ?? '',
                                        onSelected: (item) {
                                          statusProjectField?.didChange(
                                            item.statusName,
                                          );
                                          bloc.add(
                                            SaleEvent.updateWork(
                                              index: 0,
                                              statusProjectId: item.id,
                                              statusProjectName:
                                                  item.statusName,
                                              indexStatusProject: item.stt,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        nameForm:
                                            'sale_staff_status_${widget.dailyId}',
                                        nameTextField:
                                            'status_${widget.dailyId}',
                                        label: 'Trạng thái dự án',
                                        onFieldCreated: (field) =>
                                            statusProjectField = field,
                                        readOnly: true,
                                        icon: Icons.flag_outlined,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  /// ===== KHÁCH HÀNG =====
                                  GestureDetector(
                                    onTap: () {
                                      openSelectBottomSheet(
                                        context: context,
                                        title: 'Chọn khách hàng',
                                        items: state.customers,
                                        displayText: (v) =>
                                            '${v.customerCode} - ${v.customerName}',
                                        onSelected: (item) {
                                          customerField?.didChange(
                                            item.customerName,
                                          );

                                          bloc.add(
                                            SaleEvent.updateWork(
                                              index: 0,
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
                                        nameForm:
                                            'sale_staff_customer_${widget.dailyId}',
                                        nameTextField:
                                            'customer_${widget.dailyId}',
                                        label: 'Khách hàng',
                                        onFieldCreated: (field) =>
                                            customerField = field,
                                        readOnly: true,
                                        icon: Icons.business_outlined,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  /// ===== NGƯỜI LIÊN HỆ =====
                                  GestureDetector(
                                    onTap: () {
                                      if ((customerId ?? 0) > 0 &&
                                          state.customerContacts.isEmpty) {
                                        bloc.add(
                                          SaleEvent.getCustomerContact(
                                            customerId: customerId ?? 0,
                                          ),
                                        );
                                      }
                                      openSelectBottomSheet(
                                        context: context,
                                        title: 'Chọn người liên hệ',
                                        items: state.customerContacts,
                                        displayText: (v) => v.contactName,
                                        onSelected: (item) {
                                          contactField?.didChange(
                                            item.contactName,
                                          );

                                          bloc.add(
                                            SaleEvent.updateWork(
                                              index: 0,
                                              customerContactId: item.id,
                                              customerContactName:
                                                  item.contactName,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        nameForm:
                                            'sale_staff_contact_${widget.dailyId}',
                                        nameTextField:
                                            'contact_${widget.dailyId}',
                                        label: 'Người liên hệ',
                                        readOnly: true,
                                        onFieldCreated: (field) =>
                                            contactField = field,
                                        icon: Icons.person_outline,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  /// ===== LOẠI NHÓM =====
                                  GestureDetector(
                                    onTap: () {
                                      openSelectBottomSheet(
                                        context: context,
                                        title: 'Chọn loại nhóm',
                                        items: state.typeTeamSales,
                                        displayText: (v) => v.mainIndex,
                                        onSelected: (item) {
                                          typeTeamSaleField?.didChange(
                                            item.mainIndex,
                                          );
                                          bloc.add(
                                            SaleEvent.updateWork(
                                              index: 0,
                                              typeTeamSaleId: item.id,
                                              typeTeamSaleMainIndex:
                                                  item.mainIndex,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        nameForm:
                                            'sale_staff_group_${widget.dailyId}',
                                        nameTextField:
                                            'group_${widget.dailyId}',
                                        label: 'Loại nhóm',
                                        onFieldCreated: (field) =>
                                            typeTeamSaleField = field,
                                        readOnly: true,
                                        icon: Icons.group_outlined,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  /// ===== END USER =====
                                  GestureDetector(
                                    onTap: () {
                                      if ((customerId ?? 0) > 0 &&
                                          state.customerParts.isEmpty) {
                                        bloc.add(
                                          SaleEvent.getCustomerPart(
                                            customerId: customerId ?? 0,
                                          ),
                                        );
                                      }
                                      openSelectBottomSheet(
                                        context: context,
                                        title: 'Chọn bộ phận khách hàng',
                                        items: state.customerParts,
                                        displayText: (v) => v.partCode,
                                        onSelected: (item) {
                                          endUserField?.didChange(
                                            item.partCode,
                                          );
                                          bloc.add(
                                            SaleEvent.updateWork(
                                              index: 0,
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
                                        nameForm:
                                            'sale_staff_enduser_${widget.dailyId}',
                                        nameTextField:
                                            'enduser_${widget.dailyId}',
                                        label: 'Bộ phận khách hàng',
                                        onFieldCreated: (field) =>
                                            endUserField = field,
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
                                              onChanged: (v) {
                                                bloc.add(
                                                  SaleEvent.updateWork(
                                                    index: 0,
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
                                              onChanged: (v) {
                                                bloc.add(
                                                  SaleEvent.updateWork(
                                                    index: 0,
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

                                  /// ===== CONTENT =====
                                  FormInputField(
                                    icon: Icons.note_outlined,
                                    nameForm:
                                        'sale_staff_content_${widget.dailyId}',
                                    nameTextField: 'content_${widget.dailyId}',
                                    label: 'Nội dung công việc',
                                    controller: _contentController,
                                    onChanged: (v) {
                                      bloc.add(
                                        SaleEvent.updateWork(
                                          index: 0,
                                          content: v,
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 16),

                                  /// RESULT
                                  FormInputField(
                                    icon: Icons.note_outlined,
                                    nameForm:
                                        'sale_staff_result_${widget.dailyId}',
                                    nameTextField: 'result_${widget.dailyId}',
                                    label: 'Kết quả',
                                    controller: _resultController,
                                    onChanged: (v) {
                                      bloc.add(
                                        SaleEvent.updateWork(
                                          index: 0,
                                          results: v,
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 16),

                                  /// BACKLOG
                                  FormInputField(
                                    icon: Icons.note_outlined,
                                    nameForm:
                                        'sale_staff_backlog_${widget.dailyId}',
                                    nameTextField: 'backlog_${widget.dailyId}',
                                    label: 'Vấn đề tồn đọng',
                                    controller: _backlogController,
                                    onChanged: (v) {
                                      bloc.add(
                                        SaleEvent.updateWork(
                                          index: 0,
                                          backlog: v,
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 16),

                                  /// PLAN NEXT
                                  FormInputField(
                                    icon: Icons.note_outlined,
                                    nameForm:
                                        'sale_staff_plan_next_day_${widget.dailyId}',
                                    nameTextField:
                                        'plan_next_day_${widget.dailyId}',
                                    label: 'Kế hoạch tiếp theo',
                                    controller: _planNextDayController,
                                    onChanged: (v) {
                                      bloc.add(
                                        SaleEvent.updateWork(
                                          index: 0,
                                          planNextDay: v,
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 16),

                                  /// PRODUCT
                                  FormInputField(
                                    icon: Icons.note_outlined,
                                    nameForm:
                                        'sale_staff_product_${widget.dailyId}',
                                    nameTextField: 'product_${widget.dailyId}',
                                    label: 'Sản phẩm của KH',
                                    controller: _customerProductController,
                                    onChanged: (v) {
                                      bloc.add(
                                        SaleEvent.updateWork(
                                          index: 0,
                                          customerProduct: v,
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
                            SaleEvent.submitEditReport(
                              DateTime.now(),
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
            buildWhen: (p, c) => p.isSaving != c.isSaving,
            builder: (context, state) {
              if (!state.isSaving) {
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
