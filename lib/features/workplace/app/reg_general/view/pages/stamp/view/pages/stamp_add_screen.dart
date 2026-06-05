import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/stamp_model.dart';
import '../bloc/stamp_bloc.dart';

class StampAddScreen extends StatefulWidget {
  final StampItem? editItem;

  const StampAddScreen({super.key, this.editItem});

  @override
  State<StampAddScreen> createState() => _StampAddScreenState();
}

class _StampAddScreenState
    extends BaseState<StampAddScreen, StampEvent, StampState, StampBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _documentNameController = TextEditingController();
  final _signerController = TextEditingController();
  final _quantityController = TextEditingController(text: '1');
  final _pagesPerCopyController = TextEditingController(text: '0');
  final _documentTypeController = TextEditingController();
  final _companyController = TextEditingController();
  final _sealTypeController = TextEditingController();

  DateTime? _registerDate;
  DateTime? _urgentDeadline;

  bool get _isEditMode => widget.editItem != null;

  @override
  void initState() {
    super.initState();
    _registerDate = widget.editItem?.registerDate ?? DateTime.now();
    _urgentDeadline = widget.editItem?.deadline;

    _documentNameController.text = widget.editItem?.documentName ?? '';
    _signerController.text = widget.editItem?.employeeSignName ?? '';
    _quantityController.text = (widget.editItem?.documentQuantity ?? 1)
        .toString();
    _pagesPerCopyController.text = (widget.editItem?.documentTotalPage ?? 1)
        .toString();
    _documentTypeController.text = widget.editItem?.documentTypeName ?? '';
    _companyController.text = widget.editItem?.taxCompanyText ?? '';
    _sealTypeController.text = widget.editItem?.sealNameText ?? '';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_isEditMode && widget.editItem?.id != null) {
        bloc.add(StampEvent.initEdit(id: widget.editItem!.id!));
      } else {
        bloc.add(const StampEvent.initAdd());
      }
    });
  }

  @override
  void dispose() {
    _documentNameController.dispose();
    _signerController.dispose();
    _quantityController.dispose();
    _pagesPerCopyController.dispose();
    _documentTypeController.dispose();
    _companyController.dispose();
    _sealTypeController.dispose();
    super.dispose();
  }

  @override
  bool listenWhen(StampState previous, StampState current) {
    return previous.submitSuccess != current.submitSuccess ||
        previous.isSubmitting != current.isSubmitting ||
        previous.message != current.message ||
        previous.documentTypeName != current.documentTypeName ||
        previous.employeeSignName != current.employeeSignName ||
        previous.taxCompanyName != current.taxCompanyName ||
        previous.sealRegulationName != current.sealRegulationName ||
        previous.documentName != current.documentName ||
        previous.documentQuantity != current.documentQuantity ||
        previous.documentTotalPage != current.documentTotalPage;
  }

  @override
  void listener(BuildContext context, StampState state) {
    _documentTypeController.text = state.documentTypeName ?? '';
    _signerController.text = state.employeeSignName ?? '';
    _companyController.text = state.taxCompanyName ?? '';
    _sealTypeController.text = state.sealRegulationName ?? '';

    if (_isEditMode) {
      if ((state.documentName ?? '') != _documentNameController.text) {
        _documentNameController.text = state.documentName ?? '';
      }
      if ((state.documentQuantity?.toString() ?? '1') !=
          _quantityController.text) {
        _quantityController.text = state.documentQuantity?.toString() ?? '1';
      }
      if ((state.documentTotalPage?.toString() ?? '') !=
          _pagesPerCopyController.text) {
        _pagesPerCopyController.text =
            state.documentTotalPage?.toString() ?? '';
      }
    }

    if (state.submitSuccess) {
      showMessage(
        context,
        _isEditMode
            ? 'Cập nhật đăng ký dấu thành công'
            : 'Đăng ký dấu thành công',
        type: SnackBarType.success,
      );
      context.pop(true);
      return;
    }
    if (state.status == BaseStateStatus.failed &&
        (state.message ?? '').isNotEmpty) {
      showMessage(context, state.message!, type: SnackBarType.error);
    }
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final registerDate =
        _formKey.currentState?.fields['stamp_register_date_form']?.value
            as DateTime?;
    final isUrgent =
        _formKey.currentState?.fields['stamp_is_urgent']?.value as bool? ??
        false;
    final deadline =
        _formKey.currentState?.fields['stamp_deadline_form']?.value
            as DateTime?;

    if (registerDate != null) {
      bloc.add(StampEvent.changeRegisterDate(registerDate));
    }
    bloc.add(StampEvent.changeUrgent(isUrgent));
    bloc.add(StampEvent.changeDeadline(isUrgent ? deadline : null));
    bloc.add(
      StampEvent.changeDocumentName(_documentNameController.text.trim()),
    );
    bloc.add(
      StampEvent.changeDocumentQuantity(
        int.tryParse(_quantityController.text.trim()) ?? 1,
      ),
    );
    bloc.add(
      StampEvent.changeDocumentTotalPage(
        int.parse(_pagesPerCopyController.text.trim()),
      ),
    );
    bloc.add(StampEvent.submitStamp());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<StampBloc, StampState>(
      bloc: bloc,
      buildWhen: (previous, current) =>
          previous.isFormOptionsLoading != current.isFormOptionsLoading ||
          previous.employees != current.employees ||
          previous.documentTypes != current.documentTypes ||
          previous.taxCompanies != current.taxCompanies ||
          previous.sealRegulations != current.sealRegulations ||
          previous.status != current.status ||
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            title: Text(
              _isEditMode ? 'Sửa đăng ký đóng dấu' : 'Thêm đăng ký đóng dấu',
            ),
            onBackTap: () => context.pop(),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormCard(
                          child: Column(
                            children: [
                              FormDateTimePicker(
                                nameForm: 'stamp_register_date_form',
                                nameTimePicker: 'stamp_register_date_picker',
                                label: 'Ngày đăng ký',
                                icon: Icons.calendar_today_outlined,
                                inputType: InputType.date,
                                format: DateFormat('dd/MM/yyyy'),
                                initialValue: _registerDate,
                                isRequired: true,
                                validator: (v) {
                                  if (v == null) {
                                    return 'Vui lòng chọn ngày đăng ký';
                                  }
                                  return null;
                                },
                                onChanged: (v) {
                                  setState(() {
                                    _registerDate = v;
                                  });
                                },
                              ),
                              const SizedBox(height: 12),
                              FormCheckbox(
                                name: 'stamp_is_urgent',
                                initialValue:
                                    widget.editItem?.isUrgent ?? false,
                                title: const Text(
                                  'Đóng dấu gấp',
                                  style: TextStyle(fontSize: 14),
                                ),
                                onChanged: (_) => setState(() {}),
                              ),
                              if ((_formKey
                                          .currentState
                                          ?.fields['stamp_is_urgent']
                                          ?.value
                                      as bool?) ??
                                  (widget.editItem?.isUrgent ?? false)) ...[
                                const SizedBox(height: 12),
                                FormDateTimePicker(
                                  nameForm: 'stamp_deadline_form',
                                  nameTimePicker: 'stamp_deadline_picker',
                                  label: 'Ngày giờ cần đóng dấu',
                                  icon: Icons.access_time_outlined,
                                  inputType: InputType.both,
                                  format: DateFormat('dd/MM/yyyy HH:mm'),
                                  initialValue: _urgentDeadline,
                                  isRequired: true,
                                  validator: (v) {
                                    final isUrgent =
                                        (_formKey
                                                .currentState
                                                ?.fields['stamp_is_urgent']
                                                ?.value
                                            as bool?) ??
                                        false;
                                    if (isUrgent && v == null) {
                                      return 'Vui lòng chọn ngày giờ đóng dấu gấp';
                                    }
                                    return null;
                                  },
                                  onChanged: (v) {
                                    setState(() {
                                      _urgentDeadline = v;
                                    });
                                  },
                                ),
                              ],
                              const SizedBox(height: 12),
                              FormInputField(
                                readOnly: true,
                                nameForm: 'stamp_signer_form',
                                nameTextField: 'stamp_signer_tf',
                                label: 'Người ký chính',
                                icon: Icons.person_outline,
                                controller: _signerController,
                                initialValue: _signerController.text,
                                onTap: state.isFormOptionsLoading
                                    ? null
                                    : () => _openSignerSheet(state),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: FormInputField(
                                      nameForm: 'stamp_quantity_form',
                                      nameTextField: 'stamp_quantity_tf',
                                      label: 'S/lượng bản',
                                      icon: Icons.numbers_outlined,
                                      keyboardType: TextInputType.number,
                                      controller: _quantityController,
                                      initialValue: _quantityController.text,
                                      isRequired: true,
                                      validator: (v) {
                                        if (v == null || v.trim().isEmpty) {
                                          return 'Nhập số lượng bản';
                                        }
                                        final value = int.tryParse(v.trim());
                                        if (value == null || value <= 0) {
                                          return 'Phải lớn hơn 0';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: FormInputField(
                                      nameForm: 'stamp_pages_per_copy_form',
                                      nameTextField: 'stamp_pages_per_copy_tf',
                                      label: 'Số tờ/bản',
                                      icon: Icons.description_outlined,
                                      keyboardType: TextInputType.number,
                                      controller: _pagesPerCopyController,
                                      initialValue:
                                          _pagesPerCopyController.text,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              FormInputField(
                                readOnly: true,
                                nameForm: 'stamp_document_type_form',
                                nameTextField: 'stamp_document_type_tf',
                                label: 'Loại văn bản',
                                icon: Icons.article_outlined,
                                controller: _documentTypeController,
                                initialValue: _documentTypeController.text,
                                isRequired: true,
                                onTap: state.isFormOptionsLoading
                                    ? null
                                    : () => _openDocumentTypeSheet(state),
                                validator: (v) {
                                  if (v == null || v.trim().isEmpty) {
                                    return 'Vui lòng chọn loại văn bản';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              FormInputField(
                                nameForm: 'stamp_document_name_form',
                                nameTextField: 'stamp_document_name_tf',
                                label: 'Tên văn bản',
                                icon: Icons.edit_note_outlined,
                                controller: _documentNameController,
                                initialValue: _documentNameController.text,
                                isRequired: true,
                                autoExpand: true,
                                validator: (v) {
                                  if (v == null || v.trim().isEmpty) {
                                    return 'Vui lòng nhập tên văn bản';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              FormInputField(
                                readOnly: true,
                                nameForm: 'stamp_company_form',
                                nameTextField: 'stamp_company_tf',
                                label: 'Tên công ty',
                                icon: Icons.business_outlined,
                                controller: _companyController,
                                initialValue: _companyController.text,
                                isRequired: true,
                                onTap: state.isFormOptionsLoading
                                    ? null
                                    : () => _openCompanySheet(state),
                                validator: (v) {
                                  if (v == null || v.trim().isEmpty) {
                                    return 'Vui lòng chọn tên công ty';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              FormInputField(
                                readOnly: true,
                                nameForm: 'stamp_seal_type_form',
                                nameTextField: 'stamp_seal_type_tf',
                                label: 'Quy cách đóng dấu',
                                icon: Icons.approval_outlined,
                                controller: _sealTypeController,
                                initialValue: _sealTypeController.text,
                                isRequired: true,
                                onTap: state.isFormOptionsLoading
                                    ? null
                                    : () => _openSealTypeSheet(state),
                                validator: (v) {
                                  if (v == null || v.trim().isEmpty) {
                                    return 'Vui lòng chọn quy cách đóng dấu';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              FormFilePicker(
                                name: 'stamp_attachment_files',
                                label: 'Thêm file đính kèm',
                                icon: Icons.attach_file_outlined,
                                allowMultiple: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: FormActions(
                  mode: _isEditMode ? FormActionMode.edit : FormActionMode.add,
                  onCancel: () => context.pop(),
                  onSave: _onSubmit,
                  onSubmit: _onSubmit,
                  saveText: 'Cập nhật',
                  submitText: state.isFormOptionsLoading
                      ? 'Đang tải...'
                      : 'Lưu',
                  submitEnabled: !state.isFormOptionsLoading,
                  saveEnabled: !state.isFormOptionsLoading,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _openSignerSheet(StampState state) async {
    await openSelectBottomSheet<AssignerStampItem>(
      context: context,
      title: 'Chọn người ký chính',
      items: state.employees,
      displayText: (item) => item.fullName ?? '',
      hintText: 'Tìm người ký...',
      onSelected: (item) {
        bloc.add(
          StampEvent.changeEmployeeSign(id: item.id, name: item.fullName),
        );
        _formKey.currentState?.fields['stamp_signer_form']?.didChange(
          item.fullName ?? '',
        );
      },
    );
  }

  Future<void> _openDocumentTypeSheet(StampState state) async {
    await openSelectBottomSheet<DocumentStampItem>(
      context: context,
      title: 'Chọn loại văn bản',
      items: state.documentTypes,
      displayText: (item) => item.name ?? '',
      hintText: 'Tìm loại văn bản...',
      onSelected: (item) {
        bloc.add(StampEvent.changeDocumentType(id: item.id, name: item.name));
        _formKey.currentState?.fields['stamp_document_type_form']?.didChange(
          item.name ?? '',
        );
      },
    );
  }

  Future<void> _openCompanySheet(StampState state) async {
    await openSelectBottomSheet<CompanyStampItem>(
      context: context,
      title: 'Chọn công ty',
      items: state.taxCompanies,
      displayText: (item) => item.name ?? '',
      hintText: 'Tìm công ty...',
      onSelected: (item) {
        bloc.add(StampEvent.changeTaxCompany(id: item.id, name: item.name));
        _formKey.currentState?.fields['stamp_company_form']?.didChange(
          item.name ?? '',
        );
      },
    );
  }

  Future<void> _openSealTypeSheet(StampState state) async {
    await openSelectBottomSheet<SealItem>(
      context: context,
      title: 'Chọn quy cách đóng dấu',
      items: state.sealRegulations,
      displayText: (item) => item.sealName ?? '',
      hintText: 'Tìm quy cách đóng dấu...',
      onSelected: (item) {
        bloc.add(
          StampEvent.changeSealRegulation(id: item.id, name: item.sealName),
        );
        _formKey.currentState?.fields['stamp_seal_type_form']?.didChange(
          item.sealName ?? '',
        );
      },
    );
  }
}
