import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../reports/data/datasource/models/report_model.dart';
import '../../data/datasource/models/contract_registration_model.dart';
import '../bloc/contract_registration_bloc.dart';

class ContractRegistrationDetailScreen extends StatefulWidget {
  const ContractRegistrationDetailScreen({
    super.key,
    required this.item,
  });

  final ContractResponseItem item;

  @override
  State<ContractRegistrationDetailScreen> createState() =>
      _ContractRegistrationDetailScreenState();
}

class _ContractRegistrationDetailScreenState
    extends BaseState<
        ContractRegistrationDetailScreen,
        ContractRegistrationEvent,
        ContractRegistrationState,
        ContractRegistrationBloc> {
  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  final _formKey = GlobalKey<FormBuilderState>();
  bool _isEditMode = false;
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
    bloc.add(ContractRegistrationEvent.initDetail(id: widget.item.id ?? 0));
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

  String _formatDate(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFormat.format(d.toLocal());
  }

  String _approvalLabel(int? status) {
    switch (status) {
      case 1:
        return 'Đã xác nhận';
      case 2:
        return 'Từ chối';
      case 3:
        return 'Đã hủy';
      default:
        return 'Chờ duyệt';
    }
  }

  Color _approvalColor(int? status) {
    switch (status) {
      case 1:
        return AppColors.stateSuccessColor;
      case 2:
        return AppColors.alert;
      case 3:
        return AppColors.gray;
      default:
        return AppColors.warning;
    }
  }

  bool get _canEdit {
    if (widget.item.status == 1) return false;
    final currentUserId = bloc.state.currentUserId;
    final isReceiver = widget.item.employeeReciveId == currentUserId;
    return !isReceiver;
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<ContractRegistrationBloc, ContractRegistrationState>(
      listenWhen: (prev, curr) =>
          prev.updateSuccess != curr.updateSuccess ||
          prev.message != curr.message ||
          prev.isUpdating != curr.isUpdating,
      listener: (context, state) {
        if (state.updateSuccess) {
          showMessage(context, state.message ?? 'Cập nhật thành công', type: SnackBarType.success);
          Future.delayed(const Duration(milliseconds: 300), () {
            if (context.mounted) {
              final nav = Navigator.of(context);
              nav.pop(true);
            }
          });
        } else if (state.message != null && !state.updateSuccess && !state.isUpdating) {
          showMessage(context, state.message!, type: SnackBarType.error);
        }
      },
      child: BlocBuilder<ContractRegistrationBloc, ContractRegistrationState>(
        buildWhen: (prev, curr) =>
            prev.isDetailLoading != curr.isDetailLoading ||
            prev.isUpdating != curr.isUpdating ||
            prev.detail != curr.detail,
        builder: (context, state) {
          return Stack(
            children: [
              BaseScaffold(
                appBar: AppBarCommon(
                  title: Text(_isEditMode ? 'Sửa hợp đồng' : 'Chi tiết hợp đồng'),
                  onBackTap: () {
                    if (_isEditMode) {
                      setState(() => _isEditMode = false);
                    } else {
                      onBack(context);
                    }
                  },
                ),
                body: _isEditMode
                    ? _buildEditForm(context, state)
                    : _buildDetailView(context, state),
              ),
              if (state.isUpdating)
                Positioned.fill(
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
                ),
            ],
          );
        },
      ),
    );
  }

  //---(_Detail)---//
  Widget _buildDetailView(BuildContext context, ContractRegistrationState state) {
    if (state.isDetailLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final item = widget.item;
    final statusColor = _approvalColor(item.status);
    final statusLabel = _approvalLabel(item.status);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderCard(item, statusColor, statusLabel),
                const SizedBox(height: 16),
                _buildInfoCard(item),
                const SizedBox(height: 16),
                _buildScanCard(item),
              ],
            ),
          ),
        ),
        if (_canEdit)
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _startEditMode(state),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryERP,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sửa',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildHeaderCard(ContractResponseItem item, Color statusColor, String statusLabel) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.documentName?.isNotEmpty == true ? item.documentName! : '—',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: AppColors.heading,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: statusColor.withValues(alpha: 0.4), width: 1),
                ),
                child: Text(
                  statusLabel,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              if (item.documentType?.isNotEmpty == true)
                _buildChip(item.documentType!, AppColors.secondaryERP),
              if (item.contractType?.isNotEmpty == true)
                _buildChip(item.contractType!, AppColors.primaryERP),
              if (item.isScan == true)
                _buildChip('Đã scan', AppColors.stateInfoColor, icon: Icons.document_scanner_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, Color color, {IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 13, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(ContractResponseItem item) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thông tin hợp đồng',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
          ),
          const SizedBox(height: 14),
          _buildInfoRow(Icons.calendar_today_outlined, 'Ngày đăng ký', _formatDate(item.registedDate)),
          const SizedBox(height: 10),
          _buildInfoRow(Icons.business_outlined, 'Công ty thuế', item.taxCompany ?? '—'),
          const SizedBox(height: 10),
          _buildInfoRow(Icons.folder_outlined, 'Loại hồ sơ', item.documentType ?? '—'),
          const SizedBox(height: 10),
          _buildInfoRow(Icons.description_outlined, 'Loại văn bản', item.contractType ?? '—'),
          const SizedBox(height: 10),
          _buildInfoRow(Icons.assignment_ind_outlined, 'Người nhận', item.employeeRecive ?? '—'),
          const SizedBox(height: 10),
          _buildInfoRow(Icons.tag, 'Số lượng', '${item.documentQuantity ?? 1} bản'),
          const SizedBox(height: 10),
          _buildInfoRow(Icons.person_outline, 'Người đăng ký', item.employeeRegister ?? '—'),
          if (item.departmentName?.isNotEmpty == true) ...[
            const SizedBox(height: 10),
            _buildInfoRow(Icons.meeting_room_outlined, 'Phòng ban', item.departmentName ?? '—'),
          ],
        ],
      ),
    );
  }

  Widget _buildScanCard(ContractResponseItem item) {
    if (item.isScan != true || (item.folderPath ?? '').trim().isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.document_scanner_outlined, size: 20, color: AppColors.stateInfoColor),
              const SizedBox(width: 8),
              const Text(
                'File scan',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.heading,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            item.folderPath ?? '—',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.secondaryERP,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: AppColors.gray),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.gray,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.heading,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _startEditMode(ContractRegistrationState state) {
    final item = widget.item;
    setState(() {
      _isEditMode = true;
      _selectedCompanyId = item.taxCompanyId;
      _selectedDocumentTypeId = item.documentTypeId;
      _selectedReceiverId = item.employeeReciveId;
      _hasScanFile = item.isScan == true;
    });
    bloc.add(const ContractRegistrationEvent.initAdd());
  }

  //---(_Edit)---//
  Widget _buildEditForm(BuildContext context, ContractRegistrationState state) {
    final item = widget.item;
    final contractTypeValue = _mapContractTypeIdToString(item.contractTypeId);

    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ContractRegistrationBloc, ContractRegistrationState>(
            buildWhen: (prev, curr) =>
                prev.documentTypes != curr.documentTypes ||
                prev.taxCompanies != curr.taxCompanies ||
                prev.receivers != curr.receivers,
            builder: (context, st) {
              return FormBuilder(
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
                            initialValue: item.registedDate ?? DateTime.now(),
                            firstDate: DateTime.now().subtract(const Duration(days: 365)),
                            lastDate: DateTime.now().add(const Duration(days: 365)),
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
                            initialValue: item.taxCompany ?? '',
                            onTap: () => _openCompanySheet(context, st.taxCompanies),
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
                            initialValue: item.documentType ?? '',
                            onTap: () => _openDocumentTypeSheet(context, st.documentTypes),
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
                            initialValue: contractTypeValue,
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
                            initialValue: item.employeeRecive ?? '',
                            onTap: () => _openReceiverSheet(context, st.receivers),
                            onFieldCreated: (f) => _receiverField = f,
                          ),
                          const SizedBox(height: 16),
                          FormInputField(
                            nameForm: 'document_quantity',
                            nameTextField: 'document_quantity_display',
                            label: 'Số lượng',
                            icon: Icons.tag,
                            initialValue: '${item.documentQuantity ?? 1}',
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
                            initialValue: item.documentName ?? '',
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
                            initialValue: _hasScanFile,
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
                              initialValue: item.folderPath ?? '',
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
              );
            },
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => setState(() => _isEditMode = false),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.gray,
                      side: const BorderSide(color: AppColors.borderColor),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Huỷ',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: _onUpdateSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryERP,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Lưu',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onUpdateSubmit() {
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

    bloc.add(ContractRegistrationEvent.updateContract(
      id: widget.item.id ?? 0,
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

  String _mapContractTypeIdToString(int? id) {
    switch (id) {
      case 1:
        return 'Gốc';
      case 2:
        return 'Sao y';
      case 3:
        return 'Treo';
      default:
        return 'Gốc';
    }
  }
}
