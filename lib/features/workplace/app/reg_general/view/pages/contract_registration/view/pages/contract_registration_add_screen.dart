import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../reports/data/datasource/models/report_model.dart';
import '../../data/datasource/models/contract_registration_model.dart';
import '../bloc/contract_registration_bloc.dart';

class ContractRegistrationAddScreen extends StatefulWidget {
  const ContractRegistrationAddScreen({super.key});

  @override
  State<ContractRegistrationAddScreen> createState() =>
      _ContractRegistrationAddScreenState();
}

class _ContractRegistrationAddScreenState extends BaseState<
    ContractRegistrationAddScreen,
    ContractRegistrationEvent,
    ContractRegistrationState,
    ContractRegistrationBloc> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _hasScanFile = false;

  FormFieldState<String>? _companyField;
  FormFieldState<String>? _documentTypeField;
  FormFieldState<String>? _receiverField;

  int? _selectedCompanyId;
  int? _selectedDocumentTypeId;
  int? _selectedReceiverId;

  @override
  void initState() {
    super.initState();
    bloc.add(const ContractRegistrationEvent.initAdd());
    bloc.add(const ContractRegistrationEvent.fetchReceivers());
  }

  void _openDocumentTypeSheet(
      BuildContext context, List<TypeDocumentResponseItem> types) {
    if (types.isEmpty) {
      showMessage(context, 'Không có loại hồ sơ', type: SnackBarType.error);
      return;
    }
    openSelectBottomSheet<TypeDocumentResponseItem>(
      context: context,
      title: 'Loại hồ sơ',
      items: types,
      onSelected: (item) {
        setState(() {
          _selectedDocumentTypeId = item.id;
        });
        _documentTypeField?.didChange(item.name);
      },
      displayText: (item) => item.name ?? '',
    );
  }

  void _openCompanySheet(
      BuildContext context, List<TaxCompanyResponseItem> companies) {
    if (companies.isEmpty) {
      showMessage(context, 'Không có dữ liệu công ty', type: SnackBarType.error);
      return;
    }
    openSelectBottomSheet<TaxCompanyResponseItem>(
      context: context,
      title: 'Tên công ty',
      items: companies,
      onSelected: (item) {
        setState(() {
          _selectedCompanyId = item.id;
        });
        _companyField?.didChange(item.name);
      },
      displayText: (item) => item.name ?? '',
    );
  }

  void _openReceiverSheet(
      BuildContext context, List<UserResponse> receivers) {
    if (receivers.isEmpty) {
      showMessage(context, 'Không có danh sách người nhận', type: SnackBarType.error);
      return;
    }
    openSelectBottomSheet<UserResponse>(
      context: context,
      title: 'Người nhận',
      items: receivers,
      onSelected: (item) {
        setState(() {
          _selectedReceiverId = item.id;
        });
        _receiverField?.didChange('${item.code} - ${item.fullName}');
      },
      displayText: (item) => '${item.code ?? ''} - ${item.fullName ?? ''}',
    );
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();

    final formState = _formKey.currentState;
    if (formState == null) return;

    final isCompanyValid = _selectedCompanyId != null;
    final isDocTypeValid = _selectedDocumentTypeId != null;
    final isReceiverValid = _selectedReceiverId != null;

    if (!isCompanyValid) {
      formState.fields['tax_company']?.validate();
    }
    if (!isDocTypeValid) {
      formState.fields['document_type']?.validate();
    }
    if (!isReceiverValid) {
      formState.fields['employee_receiver']?.validate();
    }

    if (!isCompanyValid || !isDocTypeValid || !isReceiverValid) {
      showMessage(context, 'Vui lòng điền đầy đủ thông tin bắt buộc', type: SnackBarType.error);
      return;
    }

    // Contract type: patch value vào form trước khi saveAndValidate.
    // Fallback về 'Gốc' nếu field.value rỗng (FormChoiceGroup chưa sync).
    final rawContractType = formState.value['contract_type'] as String?;
    final contractType = (rawContractType == null || rawContractType.isEmpty)
        ? 'Gốc'
        : rawContractType;
    formState.patchValue({'contract_type': contractType});

    if (!formState.saveAndValidate()) {
      showMessage(context, 'Vui lòng điền đầy đủ thông tin bắt buộc', type: SnackBarType.error);
      return;
    }

    final values = formState.value;
    final documentName = (values['document_name'] as String? ?? '').trim();
    final quantityStr = '${values['document_quantity'] ?? ''}'.trim();
    final documentQuantity = int.tryParse(quantityStr);
    final folderPath = (values['folder_path'] as String? ?? '').trim();

    if (documentQuantity == null || documentQuantity <= 0) {
      showMessage(context, 'Số lượng phải lớn hơn 0', type: SnackBarType.error);
      return;
    }
    if (documentName.isEmpty) {
      showMessage(context, 'Vui lòng nhập tên văn bản', type: SnackBarType.error);
      return;
    }
    if (_hasScanFile && folderPath.isEmpty) {
      showMessage(context, 'Vui lòng nhập đường dẫn file scan', type: SnackBarType.error);
      return;
    }

    bloc.add(ContractRegistrationEvent.submitContract(
      registedDate: values['registed_date'] as DateTime? ?? DateTime.now(),
      taxCompanyId: _selectedCompanyId ?? 0,
      documentTypeId: _selectedDocumentTypeId ?? 0,
      contractType: contractType,
      employeeReceiverId: _selectedReceiverId ?? 0,
      documentQuantity: documentQuantity,
      documentName: documentName,
      isScan: values['is_scan'] ?? false,
      folderPath: _hasScanFile ? folderPath : null,
    ));
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<ContractRegistrationBloc, ContractRegistrationState>(
      listenWhen: (prev, curr) =>
          prev.submitSuccess != curr.submitSuccess ||
          prev.message != curr.message,
      listener: (context, state) {
        if ((state.message ?? '').isNotEmpty) {
          showMessage(
            context,
            state.message!,
            type: state.submitSuccess
                ? SnackBarType.success
                : SnackBarType.error,
          );
        }
        if (state.submitSuccess) {
          bloc.add(const ContractRegistrationEvent.init(reloadForEmail: true));
          context.pop(true);
        }
      },
          child: BaseScaffold(
            appBar: AppBarCommon(
              title: const Text('Tạo hợp đồng'),
            ),
            body: BlocBuilder<ContractRegistrationBloc, ContractRegistrationState>(
              buildWhen: (prev, curr) =>
                  prev.taxCompanies != curr.taxCompanies ||
                  prev.documentTypes != curr.documentTypes ||
                  prev.receivers != curr.receivers ||
                  prev.isSubmitting != curr.isSubmitting,
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: FormBuilder(
                        key: _formKey,
                        child: ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            FormCard(
                              title: 'Thông tin hợp đồng',
                              child: Column(
                                children: [
                                  FormDateTimePicker(
                                    nameForm: 'registed_date',
                                    nameTimePicker: 'registed_date_picker',
                                    label: 'Ngày đăng ký',
                                    icon: Icons.calendar_today,
                                    inputType: InputType.date,
                                    format: DateFormat('dd/MM/yyyy'),
                                    initialValue: DateTime.now(),
                                    firstDate: DateTime.now().subtract(
                                      const Duration(days: 365),
                                    ),
                                    lastDate: DateTime.now().add(
                                      const Duration(days: 365),
                                    ),
                                    isRequired: true,
                                    validator: FormBuilderValidators.required(
                                      errorText: 'Vui lòng chọn ngày đăng ký',
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  FormInputField(
                                    nameForm: 'tax_company',
                                    nameTextField: 'tax_company_display',
                                    label: 'Tên công ty',
                                    icon: Icons.business,
                                    readOnly: true,
                                    isRequired: true,
                                    onTap: () =>
                                        _openCompanySheet(context, state.taxCompanies),
                                    onFieldCreated: (f) => _companyField = f,
                                    validator: (value) {
                                      if (_selectedCompanyId == null) {
                                        return 'Vui lòng chọn công ty';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  FormInputField(
                                    nameForm: 'document_type',
                                    nameTextField: 'document_type_display',
                                    label: 'Loại hồ sơ',
                                    icon: Icons.folder_outlined,
                                    readOnly: true,
                                    isRequired: true,
                                    onTap: () =>
                                        _openDocumentTypeSheet(context, state.documentTypes),
                                    onFieldCreated: (f) => _documentTypeField = f,
                                    validator: (value) {
                                      if (_selectedDocumentTypeId == null) {
                                        return 'Vui lòng chọn loại hồ sơ';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  FormChoiceGroup<String>(
                                    name: 'contract_type',
                                    label: 'Loại văn bản',
                                    icon: Icons.description_outlined,
                                    isRequired: true,
                                    initialValue: 'Gốc',
                                    options: const [
                                      FormChoiceOption(value: 'Gốc', label: 'Gốc'),
                                      FormChoiceOption(value: 'Sao y', label: 'Sao y'),
                                      FormChoiceOption(value: 'Treo', label: 'Treo'),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  FormInputField(
                                    nameForm: 'employee_receiver',
                                    nameTextField: 'employee_receiver_display',
                                    label: 'Người nhận',
                                    isRequired: true,
                                    validator: (value) {
                                      if (_selectedReceiverId == null) {
                                        return 'Vui lòng chọn người nhận';
                                      }
                                      return null;
                                    },
                                    icon: Icons.person_outline,
                                    readOnly: true,
                                    onTap: () =>
                                        _openReceiverSheet(context, state.receivers),
                                    onFieldCreated: (f) => _receiverField = f,
                                  ),
                                  const SizedBox(height: 16),
                                  FormInputField(
                                    nameForm: 'document_quantity',
                                    nameTextField: 'document_quantity_display',
                                    label: 'Số lượng',
                                    icon: Icons.tag,
                                    initialValue: '1',
                                    keyboardType: TextInputType.number,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                        errorText: 'Vui lòng nhập số lượng',
                                      ),
                                      FormBuilderValidators.numeric(
                                        errorText: 'Số lượng phải là số',
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(height: 16),
                                  FormInputField(
                                    nameForm: 'document_name',
                                    nameTextField: 'document_name_display',
                                    label: 'Tên văn bản',
                                    icon: Icons.article_outlined,
                                    isRequired: true,
                                    validator: FormBuilderValidators.required(
                                      errorText: 'Vui lòng nhập tên văn bản',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            FormCard(
                              title: 'File scan',
                              child: Column(
                                children: [
                                  FormBuilderCheckbox(
                                    name: 'is_scan',
                                    title: const Text('Có đường dẫn file scan'),
                                    initialValue: false,
                                    onChanged: (value) {
                                      setState(() {
                                        _hasScanFile = value ?? false;
                                      });
                                    },
                                  ),
                                  if (_hasScanFile) ...[
                                    const SizedBox(height: 12),
                                    FormInputField(
                                      nameForm: 'folder_path',
                                      nameTextField: 'folder_path_display',
                                      label: 'Đường dẫn file scan',
                                      icon: Icons.link,
                                      validator: (value) {
                                        if (_hasScanFile &&
                                            (value == null || value.trim().isEmpty)) {
                                          return 'Vui lòng nhập đường dẫn file scan';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: FormActions(
                        mode: FormActionMode.add,
                        onSubmit: _onSubmit,
                        onCancel: () => context.pop(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        BlocBuilder<ContractRegistrationBloc, ContractRegistrationState>(
          buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
          builder: (context, state) {
            if (!state.isSubmitting) return const SizedBox.shrink();
            return Positioned.fill(
              child: AbsorbPointer(
                child: Container(
                  color: Colors.black.withValues(alpha: 0.45),
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
    );
  }
}
