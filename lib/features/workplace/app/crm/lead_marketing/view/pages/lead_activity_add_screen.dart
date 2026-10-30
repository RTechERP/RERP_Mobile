import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/lead_marketing_model.dart';
import '../bloc/lead_marketing_bloc.dart';

/// Màn ghi hoạt động cho một phiếu lead.
///
/// Gọi `POST /Lead/save-activity` với:
/// - `ActivityType`: mã loại nhóm được chọn (bắt buộc).
/// - `ActivityDate`: thời gian thực hiện (bắt buộc, mặc định hiện tại).
/// - `Content`: nội dung (bắt buộc).
/// - `Result`: kết quả.
/// - `NextAction`: bước tiếp theo.
/// - `NextActionDate`: ngày hẹn.
class LeadActivityAddScreen extends StatefulWidget {
  const LeadActivityAddScreen({
    super.key,
    required this.leadId,
    this.leadCode,
  });

  /// ID phiếu lead được ghi hoạt động.
  final int leadId;

  /// Mã phiếu lead — hiển thị trên tiêu đề.
  final String? leadCode;

  @override
  State<LeadActivityAddScreen> createState() => _LeadActivityAddScreenState();
}

class _LeadActivityAddScreenState
    extends
        BaseShareState<
          LeadActivityAddScreen,
          LeadMarketingEvent,
          LeadMarketingState,
          LeadMarketingBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Field ẩn chứa ID loại nhóm đã chọn.
  final _typeIdFieldName = 'lead_activity_type_id';

  /// Đã xử lý kết quả ghi hoạt động hiện tại chưa.
  bool _submitResultHandled = false;

  /// Đã mặc định "Loại nhóm" bằng item đầu tiên của danh sách chưa.
  bool _typeDefaultApplied = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const LeadMarketingEvent.loadActivityTypes());
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<LeadMarketingBloc, LeadMarketingState>(
          listenWhen: (previous, current) =>
              previous.activityStatus != current.activityStatus ||
              previous.activityTypes != current.activityTypes,
          listener: (context, state) {
            // Danh sách loại nhóm về → mặc định chọn item đầu tiên.
            _applyDefaultType(state);

            if (state.activityStatus == BaseStateStatus.success) {
              if (_submitResultHandled) return;
              _submitResultHandled = true;
              showMessage(
                context,
                state.activityMessage ?? 'Ghi hoạt động thành công!',
                type: SnackBarType.success,
              );
              bloc.add(const LeadMarketingEvent.clearActivityState());
              // Tải lại danh sách để phiếu vừa ghi hoạt động cập nhật ngay.
              bloc.add(const LeadMarketingEvent.refresh());
              context.pop(true);
            } else if (state.activityStatus == BaseStateStatus.failed) {
              if (_submitResultHandled) return;
              _submitResultHandled = true;
              showMessage(
                context,
                state.activityMessage ?? 'Ghi hoạt động thất bại',
                type: SnackBarType.error,
              );
              bloc.add(const LeadMarketingEvent.clearActivityState());
            }
          },
          builder: (context, state) {
            final code = (widget.leadCode ?? '').trim();
            return BaseScaffold(
              appBar: AppBarCommon(
                title: Text(
                  code.isEmpty ? 'Ghi hoạt động' : 'Ghi hoạt động - $code',
                ),
                onBackTap: () => context.pop(),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: FormBuilder(
                      key: _formKey,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                        child: FormCard(
                          title: 'Thông tin hoạt động',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTypeField(state),
                              const SizedBox(height: 12),
                              _buildActivityDateField(),
                              const SizedBox(height: 12),
                              _buildContentField(),
                              const SizedBox(height: 12),
                              _buildResultField(),
                              const SizedBox(height: 12),
                              _buildNextActionField(),
                              const SizedBox(height: 12),
                              _buildNextActionDateField(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: FormActions(
                      mode: FormActionMode.add,
                      submitText: 'Lưu',
                      submitEnabled:
                          state.activityStatus != BaseStateStatus.loading,
                      onSubmit: () => _handleSubmit(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        /// Overlay loading khi đang ghi hoạt động.
        BlocBuilder<LeadMarketingBloc, LeadMarketingState>(
          buildWhen: (p, c) => p.activityStatus != c.activityStatus,
          builder: (context, state) {
            if (state.activityStatus != BaseStateStatus.loading) {
              return const SizedBox.shrink();
            }
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

  /// Ô chọn loại nhóm — bắt buộc.
  Widget _buildTypeField(LeadMarketingState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderField<String>(
          name: _typeIdFieldName,
          initialValue: '',
          builder: (_) => const SizedBox.shrink(),
        ),
        GestureDetector(
          onTap: () => _pickType(state),
          child: AbsorbPointer(
            child: FormInputField(
              nameForm: 'lead_activity_type_text',
              nameTextField: 'lead_activity_type_text_field',
              label: 'Loại nhóm',
              icon: Icons.group_outlined,
              readOnly: true,
              isRequired: true,
              validator: FormBuilderValidators.required(
                errorText: 'Vui lòng chọn loại nhóm',
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Ô chọn thời gian thực hiện — bắt buộc, mặc định là hiện tại.
  Widget _buildActivityDateField() {
    final now = DateTime.now();
    return FormDateTimePicker(
      nameForm: 'lead_activity_date',
      nameTimePicker: 'lead_activity_date_picker',
      label: 'Thời gian',
      icon: Icons.schedule_outlined,
      inputType: InputType.both,
      format: DateFormat('dd/MM/yyyy HH:mm'),
      initialValue: now,
      initialDate: now,
      isRequired: true,
      validator: FormBuilderValidators.required(
        errorText: 'Vui lòng chọn thời gian',
      ),
    );
  }

  /// Ô nhập nội dung — bắt buộc.
  Widget _buildContentField() {
    return FormInputField(
      nameForm: 'lead_activity_content',
      nameTextField: 'lead_activity_content_field',
      label: 'Nội dung',
      icon: Icons.description_outlined,
      autoExpand: true,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      isRequired: true,
      validator: FormBuilderValidators.required(
        errorText: 'Vui lòng nhập nội dung',
      ),
    );
  }

  /// Ô nhập kết quả — không bắt buộc.
  Widget _buildResultField() {
    return FormInputField(
      nameForm: 'lead_activity_result',
      nameTextField: 'lead_activity_result_field',
      label: 'Kết quả',
      icon: Icons.check_circle_outline,
      autoExpand: true,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
    );
  }

  /// Ô nhập bước tiếp theo — không bắt buộc.
  Widget _buildNextActionField() {
    return FormInputField(
      nameForm: 'lead_activity_next_action',
      nameTextField: 'lead_activity_next_action_field',
      label: 'Bước tiếp theo',
      icon: Icons.flag_outlined,
      autoExpand: true,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
    );
  }

  /// Ô chọn ngày hẹn — không bắt buộc.
  Widget _buildNextActionDateField() {
    final now = DateTime.now();
    return FormDateTimePicker(
      nameForm: 'lead_activity_next_action_date',
      nameTimePicker: 'lead_activity_next_action_date_picker',
      label: 'Hẹn ngày',
      icon: Icons.event_outlined,
      inputType: InputType.date,
      format: DateFormat('dd/MM/yyyy'),
      initialDate: now,
    );
  }

  /// Mặc định "Loại nhóm" bằng item đầu tiên trong danh sách từ API.
  ///
  /// Chỉ mặc định 1 lần — nếu người dùng tự chọn loại nhóm khác thì không bị
  /// ghi đè khi danh sách được tải lại.
  void _applyDefaultType(LeadMarketingState state) {
    if (_typeDefaultApplied) return;
    if (state.activityTypes.isEmpty) return;

    final type = state.activityTypes.first;
    final id = type.id;
    if (id == null) return;

    _typeDefaultApplied = true;
    _setSelectValue('lead_activity_type_text', (type.mainIndex ?? '').trim());
    _setHiddenValue(_typeIdFieldName, id.toString());
  }

  /// Mở bottom sheet chọn loại nhóm.
  Future<void> _pickType(LeadMarketingState state) async {
    final items = state.activityTypes;
    if (items.isEmpty) {
      showMessage(
        context,
        'Chưa có danh sách loại nhóm',
        type: SnackBarType.info,
      );
      return;
    }

    await openSelectBottomSheet<LeadActivityType>(
      context: context,
      title: 'Chọn loại nhóm',
      items: items,
      displayText: (item) => (item.mainIndex ?? '').trim(),
      hintText: 'Tìm loại nhóm...',
      onSelected: (item) {
        _setSelectValue('lead_activity_type_text', (item.mainIndex ?? '').trim());
        _setHiddenValue(_typeIdFieldName, (item.id ?? 0).toString());
      },
    );
  }

  /// Validate form rồi gửi sự kiện ghi hoạt động.
  void _handleSubmit() {
    FocusScope.of(context).unfocus();

    final formState = _formKey.currentState;
    if (formState == null) return;
    if (!formState.saveAndValidate()) {
      showMessage(
        context,
        'Vui lòng điền đầy đủ các trường bắt buộc',
        type: SnackBarType.error,
      );
      return;
    }

    final values = formState.value;

    // Cho phép xử lý kết quả mới (sau lần lưu trước đã được xử lý rồi).
    _submitResultHandled = false;

    bloc.add(
      LeadMarketingEvent.saveActivity(
        payload: {
          'ID': 0,
          'ActivityType': _intValue(values['lead_activity_type_id']),
          'ActivityDate': _formatDateTime(values['lead_activity_date']),
          'Content': _text(values['lead_activity_content']),
          'Result': _text(values['lead_activity_result']),
          'NextAction': _text(values['lead_activity_next_action']),
          'NextActionDate': _formatDateTime(
            values['lead_activity_next_action_date'],
          ),
          'LeadID': widget.leadId,
        },
      ),
    );
  }

  /// Đọc giá trị form dạng chuỗi, bỏ khoảng trắng thừa.
  String _text(Object? value) => (value ?? '').toString().trim();

  /// Đọc giá trị form dạng số nguyên.
  int _intValue(Object? value) {
    if (value is int) return value;
    return int.tryParse((value ?? '').toString().trim()) ?? 0;
  }

  /// Đưa giá trị hiển thị vào cả 2 field của [FormInputField].
  ///
  /// [FormInputField] đăng ký 2 field cùng validator: `nameForm` (giá trị
  /// hiển thị) và `nameTextField` (field text bên trong). Form validate duyệt
  /// cả 2 nên phải cập nhật đồng thời, nếu không form sẽ luôn báo lỗi dù
  /// đã có giá trị.
  void _setSelectValue(String textFieldName, Object? value) {
    final form = _formKey.currentState;
    form?.fields[textFieldName]?.didChange(value);
    form?.fields['${textFieldName}_field']?.didChange(value);
  }

  /// Ghi giá trị vào field ẩn chứa id.
  void _setHiddenValue(String name, String value) {
    _formKey.currentState?.fields[name]?.didChange(value);
  }

  /// Định dạng ngày giờ theo chuẩn ISO mà API mong đợi
  /// (`yyyy-MM-ddTHH:mm:ss`).
  ///
  /// Trả về null khi chưa chọn ngày để BE nhận null thay vì chuỗi rỗng.
  String? _formatDateTime(Object? value) {
    if (value is! DateTime) return null;
    final d = value;
    return '${d.year.toString().padLeft(4, '0')}-'
        '${d.month.toString().padLeft(2, '0')}-'
        '${d.day.toString().padLeft(2, '0')}T'
        '${d.hour.toString().padLeft(2, '0')}:'
        '${d.minute.toString().padLeft(2, '0')}:'
        '${d.second.toString().padLeft(2, '0')}';
  }
}
