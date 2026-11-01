import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/form_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../di/injection.dart';
import '../../data/datasource/models/lead_source_model.dart';
import '../bloc/lead_source_bloc.dart';

/// Màn hình thêm/sửa Nguồn Lead.
class LeadSourceAddScreen extends StatefulWidget {
  final LeadSourceItem? source;

  const LeadSourceAddScreen({super.key, this.source});

  @override
  State<LeadSourceAddScreen> createState() => _LeadSourceAddScreenState();
}

class _LeadSourceAddScreenState extends State<LeadSourceAddScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late final LeadSourceBloc _bloc;
  bool _isSubmitting = false;

  bool get _isEdit => widget.source != null;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<LeadSourceBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Sửa nguồn Lead' : 'Thêm nguồn Lead'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocConsumer<LeadSourceBloc, LeadSourceState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state.saveStatus == BaseStateStatus.loading) {
            setState(() {
              _isSubmitting = true;
            });
          } else if (state.saveStatus == BaseStateStatus.success) {
            setState(() {
              _isSubmitting = false;
            });
            if (state.saveMessage != null) {
              context.showMessage(state.saveMessage!);
            }
            _bloc.add(const LeadSourceEvent.clearSaveState());
            context.pop();
          } else if (state.saveStatus == BaseStateStatus.failed) {
            setState(() {
              _isSubmitting = false;
            });
            if (state.saveMessage != null) {
              context.showMessage(state.saveMessage!);
            }
            _bloc.add(const LeadSourceEvent.clearSaveState());
          }
        },
        builder: (context, state) {
          return FormBuilder(
            key: _formKey,
            initialValue: {
              'code': widget.source?.code ?? '',
              'name': widget.source?.name ?? '',
              'sourceGroup': widget.source?.sourceGroup ?? 1,
              'stt': widget.source?.stt?.toString() ?? '',
              'note': widget.source?.note ?? '',
            },
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormCard(
                          child: Column(
                            children: [
                              FormInputField(
                                nameForm: 'code',
                                nameTextField: 'code_field',
                                label: 'Mã nguồn',
                                isRequired: true,
                                icon: Icons.code,
                                validator: FormBuilderValidators.required(
                                  errorText: 'Vui lòng nhập mã nguồn',
                                ),
                              ),
                              const SizedBox(height: 16),
                              FormInputField(
                                nameForm: 'name',
                                nameTextField: 'name_field',
                                label: 'Tên nguồn',
                                isRequired: true,
                                icon: Icons.label,
                                validator: FormBuilderValidators.required(
                                  errorText: 'Vui lòng nhập tên nguồn',
                                ),
                              ),
                              const SizedBox(height: 16),
                              FormChoiceGroup<int>(
                                name: 'sourceGroup',
                                label: 'Nhóm nguồn',
                                icon: Icons.group_work,
                                isRequired: true,
                                columns: 2,
                                options: const [
                                  FormChoiceOption(value: 1, label: 'Marketing'),
                                  FormChoiceOption(value: 2, label: 'Sales'),
                                ],
                              ),
                              const SizedBox(height: 16),
                              FormInputField(
                                nameForm: 'stt',
                                nameTextField: 'stt_field',
                                label: 'STT',
                                isRequired: false,
                                icon: Icons.numbers,
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(height: 16),
                              FormInputField(
                                nameForm: 'note',
                                nameTextField: 'note_field',
                                label: 'Ghi chú',
                                isRequired: false,
                                icon: Icons.note,
                                maxLines: 3,
                                autoExpand: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: FormActions(
                    mode: _isEdit ? FormActionMode.edit : FormActionMode.add,
                    onCancel: () => context.pop(),
                    onSubmit: _isSubmitting ? null : _onSubmit,
                    onSave: _isSubmitting ? null : _onSubmit,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSubmit() {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      FormHelper.focusFirstError(
        formState: _formKey.currentState!,
        priorityFields: const ['code', 'name', 'sourceGroup'],
      );
      return;
    }

    final formData = _formKey.currentState!.value;

    final sttText = (formData['stt'] as String? ?? '').trim();
    final sttValue = sttText.isNotEmpty ? int.tryParse(sttText) : null;

    final source = LeadSourceItem(
      id: widget.source?.id ?? 0,
      code: formData['code'] as String,
      name: formData['name'] as String,
      sourceGroup: formData['sourceGroup'] as int,
      stt: sttValue,
      note: formData['note'] as String?,
    );

    _bloc.add(LeadSourceEvent.save(source));
  }
}
