import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/app_bar_common.dart';
import '../../../../../../../../../common/app_theme/app_colors.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/form_actions.dart';
import '../../../../../../../../../common/widgets/form/form_date_time_picker.dart';
import '../../../../../../../../../common/widgets/form/form_file_picker.dart';
import '../bloc/idea_registration_bloc.dart';
import '../widgets/idea_detail_row_widget.dart';

class IdeaRegistrationAddScreen extends StatefulWidget {
  const IdeaRegistrationAddScreen({super.key});

  @override
  State<IdeaRegistrationAddScreen> createState() =>
      _IdeaRegistrationAddScreenState();
}

class _IdeaRegistrationAddScreenState
    extends
        BaseState<
          IdeaRegistrationAddScreen,
          IdeaRegistrationEvent,
          IdeaRegistrationState,
          IdeaRegistrationBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();
  List<PlatformFile> _selectedFiles = [];

  @override
  void initState() {
    super.initState();
    bloc.add(const IdeaRegistrationEvent.initAdd());
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final values = _formKey.currentState!.value;
    final dateStart = values['date_start'] as DateTime?;
    final dateEnd = values['date_end'] as DateTime?;

    if (dateStart == null) {
      context.showMessage(
        'Vui lòng chọn ngày bắt đầu',
        type: SnackBarType.error,
      );
      return;
    }
    if (dateEnd == null) {
      context.showMessage(
        'Vui lòng chọn ngày kết thúc',
        type: SnackBarType.error,
      );
      return;
    }
    if (bloc.state.catalogId == null) {
      context.showMessage(
        'Vui lòng chọn loại đề tài',
        type: SnackBarType.error,
      );
      return;
    }

    bloc.add(
      IdeaRegistrationEvent.submit(
        dateStart: dateStart,
        dateEnd: dateEnd,
        departmentId: bloc.state.departmentId,
        catalogId: bloc.state.catalogId,
        details: bloc.state.details,
      ),
    );
  }

  void _openDepartmentSheet() {
    FocusScope.of(context).unfocus();
    final items = bloc.state.departments;
    if (items.isEmpty) {
      context.showMessage('Chưa có phòng ban', type: SnackBarType.error);
      return;
    }

    openSelectBottomSheet(
      context: context,
      title: 'Chọn phòng ban phối hợp',
      items: items,
      onSelected: (item) {
        bloc.add(
          IdeaRegistrationEvent.changeDepartment(id: item.id, name: item.name),
        );
      },
      displayText: (item) => item.name,
    );
  }

  void _openCatalogSheet() {
    FocusScope.of(context).unfocus();
    final items = bloc.state.catalogs;
    if (items.isEmpty) {
      context.showMessage('Chưa có loại đề tài', type: SnackBarType.error);
      return;
    }

    openSelectBottomSheet(
      context: context,
      title: 'Chọn loại đề tài',
      items: items,
      onSelected: (item) {
        bloc.add(
          IdeaRegistrationEvent.changeCatalog(id: item.id, name: item.name),
        );
      },
      displayText: (item) => item.name ?? '',
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocConsumer<IdeaRegistrationBloc, IdeaRegistrationState>(
      listenWhen: (prev, curr) =>
          prev.submitSuccess != curr.submitSuccess ||
          prev.status != curr.status ||
          prev.message != curr.message,
      listener: (context, state) {
        if (state.submitSuccess) {
          context.showMessage(
            'Tạo ý tưởng thành công',
            type: SnackBarType.success,
          );
          context.pop(true);
          return;
        }
        if (state.status == BaseStateStatus.failed && state.message != null) {
          context.showMessage(state.message!, type: SnackBarType.error);
        }
      },
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Tạo ý tưởng cải tiến'),
            onBackTap: () => context.pop(),
          ),
          body: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildDateSection(state),
                      const SizedBox(height: 16),
                      _buildDepartmentAndCatalogSection(state),
                      const SizedBox(height: 16),
                      _buildDetailsSection(state),
                      const SizedBox(height: 16),
                      _buildFileSection(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: FormActions(
                    mode: FormActionMode.add,
                    submitText: 'Gửi ý tưởng',
                    onSubmit: _onSubmit,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //---(_Section)---//
  Widget _buildDateSection(IdeaRegistrationState state) {
    return Row(
      children: [
        Expanded(
          child: FormDateTimePicker(
            icon: Icons.calendar_today,
            nameForm: 'date_start',
            nameTimePicker: 'date_start_picker',
            label: 'Bắt đầu',
            inputType: InputType.date,
            format: DateFormat('dd/MM/yyyy'),
            isRequired: true,
            initialValue: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onChanged: (date) {
              bloc.add(IdeaRegistrationEvent.changeDateStart(date));
            },
            validator: (v) {
              if (v == null) return 'Chọn ngày';
              return null;
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: FormDateTimePicker(
            icon: Icons.event_available,
            nameForm: 'date_end',
            nameTimePicker: 'date_end_picker',
            label: 'Kết thúc',
            inputType: InputType.date,
            format: DateFormat('dd/MM/yyyy'),
            isRequired: true,
            initialValue: DateTime.now().add(const Duration(days: 30)),
            firstDate: state.dateStart ?? DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
            onChanged: (date) {
              bloc.add(IdeaRegistrationEvent.changeDateEnd(date));
            },
            validator: (v) {
              if (v == null) return 'Chọn ngày';
              final start = state.dateStart;
              if (start != null && v.isBefore(start)) {
                return 'Phải >= bắt đầu';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  //---(_Section)---//
  Widget _buildDepartmentAndCatalogSection(IdeaRegistrationState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Phòng ban & Loại đề tài',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
          ),
          const SizedBox(height: 12),
          // Phòng ban phối hợp
          _buildSelectField(
            label: 'Phòng ban phối hợp',
            icon: Icons.business,
            value: state.departmentName,
            onTap: _openDepartmentSheet,
          ),
          const SizedBox(height: 12),
          // Loại đề tài
          _buildSelectField(
            label: 'Loại đề tài',
            icon: Icons.category_outlined,
            value: state.catalogName,
            onTap: _openCatalogSheet,
            isRequired: true,
          ),
        ],
      ),
    );
  }

  /// Widget chọn đọc trực tiếp từ bloc state — không qua FormBuilderField.
  Widget _buildSelectField({
    required String label,
    required IconData icon,
    required String? value,
    required VoidCallback onTap,
    bool isRequired = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: isRequired ? '$label *' : label,
          prefixIcon: Icon(icon, size: 20),
          filled: true,
          fillColor: Colors.grey.shade50,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.grayColor[30]!),
          ),
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          value ?? label,
          style: TextStyle(
            color: value != null ? AppColors.black : AppColors.text,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  //---(_Section)---//
  Widget _buildDetailsSection(IdeaRegistrationState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Chi tiết ý tưởng',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
          ),
          const SizedBox(height: 12),
          ...List.generate(ideaDetailCategories.length, (i) {
            final detail = i < state.details.length
                ? state.details[i]
                : const IdeaDetailRow(description: '', note: null);
            return IdeaDetailRowWidget(
              index: i,
              categoryName: ideaDetailCategories[i],
              nameFormPrefix: 'idea_detail',
              initialDesc: detail.description,
              initialNote: detail.note,
              onDescChanged: (v) {
                bloc.add(
                  IdeaRegistrationEvent.updateDetail(
                    index: i,
                    description: v ?? '',
                    note: detail.note,
                  ),
                );
              },
              onNoteChanged: (v) {
                bloc.add(
                  IdeaRegistrationEvent.updateDetail(
                    index: i,
                    description: detail.description,
                    note: v,
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }

  //---(_Section)---//
  Widget _buildFileSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tệp đính kèm',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
          ),
          const SizedBox(height: 12),
          FormFilePicker(
            name: 'attachments',
            label: 'Chọn tệp',
            icon: Icons.attach_file,
            allowMultiple: true,
            onChanged: (files) {
              setState(() {
                _selectedFiles = files;
              });
            },
          ),
          if (_selectedFiles.isNotEmpty) ...[
            const Divider(),
            ..._selectedFiles.asMap().entries.map((entry) {
              final file = entry.value;
              return ListTile(
                key: ValueKey(file.name),
                leading: const Icon(
                  Icons.insert_drive_file_outlined,
                  color: AppColors.primaryERP,
                ),
                title: Text(
                  file.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: file.size > 0
                    ? Text(_formatFileSize(file.size))
                    : null,
                trailing: IconButton(
                  icon: const Icon(Icons.close, size: 18),
                  onPressed: () {
                    setState(() {
                      _selectedFiles.removeAt(entry.key);
                    });
                  },
                ),
                dense: true,
                contentPadding: EdgeInsets.zero,
              );
            }),
          ],
        ],
      ),
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
