import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../../../di/injection.dart';
import '../../app/project_add/data/datasource/model/project_lookup_model.dart';
import '../../app/project_add/view/bloc/project_add_bloc.dart';

/// Màn hình tạo dự án - thu thập thông tin dự án mới.
///
/// Khi mở, screen sẽ tự gọi `ProjectAddBloc.loadAll()` để load song song
/// 10 API lookup (hãng, khách hàng, loại dự án, PM, trạng thái, ...).
/// Các danh sách này hiển thị trong bottom sheet khi user bấm vào
/// field dropdown (pattern `FormInputField(readOnly) + GestureDetector`).
class ProjectAddScreen extends StatelessWidget {
  const ProjectAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProjectAddBloc>()..add(const ProjectAddEvent.loadAll()),
      child: const _ProjectAddView(),
    );
  }
}

class _ProjectAddView extends StatefulWidget {
  const _ProjectAddView();

  @override
  State<_ProjectAddView> createState() => _ProjectAddViewState();
}

class _ProjectAddViewState extends State<_ProjectAddView> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _df = DateFormat('dd/MM/yyyy');

  /// Khoảng cách giữa các field trong cùng một `FormCard`.
  static const double _gap = 16;

  /// Khoảng cách giữa các `FormCard`.
  static const double _cardGap = 16;

  /// Tên field cho FormBuilder — dùng để truy xuất qua `formState.value`.
  static final _f = _FieldNames();

  /// Validator chung cho các trường required.
  static final FormFieldValidator<dynamic> _requiredValidator =
      FormBuilderValidators.required(
    errorText: 'Vui lòng không để trống',
  );

  /// Chèn SizedBox(height: [_gap]) giữa các widget con để các field không dính sát nhau.
  List<Widget> _spaced(List<Widget> children) {
    if (children.isEmpty) return const [];
    final result = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0) result.add(const SizedBox(height: _gap));
      result.add(children[i]);
    }
    return result;
  }

  /// Tạo 1 field picker dạng dropdown hiển thị bằng `FormInputField` +
  /// bottom sheet. Data lấy từ [ProjectAddBloc.state] tương ứng.
  Widget _pickerField<T>({
    required String fieldName,
    required String label,
    required IconData icon,
    required bool isRequired,
    required List<T> options,
    required String Function(T) displayText,
    required String sheetTitle,
  }) {
    return BlocBuilder<ProjectAddBloc, ProjectAddState>(
      buildWhen: (prev, curr) {
        // Chỉ rebuild khi danh sách liên quan thay đổi.
        if (T == FirmBase) return prev.firms != curr.firms;
        if (T == CustomerItem) return prev.customers != curr.customers;
        if (T == ProjectTypeBase) {
          return prev.projectTypes != curr.projectTypes;
        }
        if (T == PmItem) return prev.pms != curr.pms;
        if (T == ProjectStatusItem) {
          return prev.statuses != curr.statuses;
        }
        if (T == CustomerIndustry) {
          return prev.industries != curr.industries;
        }
        return false;
      },
      builder: (context, _) {
        return GestureDetector(
          onTap: () async {
            await openSelectBottomSheet<T>(
              context: context,
              title: sheetTitle,
              items: options,
              displayText: displayText,
              onSelected: (value) {
                final form = _formKey.currentState;
                form?.fields[fieldName]?.didChange(displayText(value));
              },
            );
          },
          child: AbsorbPointer(
            child: FormInputField(
              readOnly: true,
              nameForm: fieldName,
              nameTextField: '${fieldName}_tf',
              label: label,
              icon: icon,
              isRequired: isRequired,
              validator: isRequired
                  ? (v) => v == null || v.trim().isEmpty
                      ? 'Vui lòng chọn $label'
                      : null
                  : null,
            ),
          ),
        );
      },
    );
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    final formState = _formKey.currentState;
    if (formState == null) return;

    final isValid = formState.saveAndValidate();
    if (!isValid) {
      FormHelper.focusFirstError(formState: formState);
      return;
    }

    final values = formState.value;

    // Gọi API tạo dự án ở đây (chưa có trong task này).
    debugPrint('ProjectAdd values: $values');

    if (!mounted) return;
    context.showMessage('Lưu dự án thành công', type: SnackBarType.success);
    context.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final initialDate = DateTime.now();

    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Tạo dự án'),
        onBackTap: () => context.pop(),
      ),
      body: Stack(
        children: [
          FormBuilder(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              children: [
                /// ===== THÔNG TIN KHÁCH HÀNG =====
                FormCard(
                  title: 'Thông tin khách hàng',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _spaced([
                      BlocSelector<ProjectAddBloc, ProjectAddState,
                          List<CustomerItem>>(
                        selector: (s) => s.customers,
                        builder: (context, customers) =>
                            _pickerField<CustomerItem>(
                          fieldName: _f.customerId,
                          label: 'Khách hàng',
                          icon: Icons.business,
                          isRequired: true,
                          options: customers,
                          displayText: (e) =>
                              '${e.code ?? ''} - ${e.name ?? ''}',
                          sheetTitle: 'Chọn khách hàng',
                        ),
                      ),
                      BlocSelector<ProjectAddBloc, ProjectAddState,
                          List<CustomerIndustry>>(
                        selector: (s) => s.industries,
                        builder: (context, industries) =>
                            _pickerField<CustomerIndustry>(
                          fieldName: _f.customerBusinessFieldId,
                          label: 'Lĩnh vực khách hàng',
                          icon: Icons.category_outlined,
                          isRequired: false,
                          options: industries,
                          displayText: (e) => e.nameVI ?? '',
                          sheetTitle: 'Chọn lĩnh vực',
                        ),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(height: _cardGap),

                /// ===== MÃ & TÊN DỰ ÁN =====
                FormCard(
                  title: 'Mã & tên dự án',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _spaced([
                      FormInputField(
                        icon: Icons.qr_code,
                        nameForm: _f.projectCode,
                        nameTextField: '${_f.projectCode}_tf',
                        label: 'Mã dự án',
                        isRequired: true,
                        validator: _requiredValidator,
                      ),
                      FormDateTimePicker(
                        icon: Icons.calendar_today,
                        nameForm: _f.createdDate,
                        nameTimePicker: '${_f.createdDate}_picker',
                        label: 'Ngày tạo',
                        inputType: InputType.date,
                        initialValue: initialDate,
                        initialDate: initialDate,
                        firstDate: DateTime(initialDate.year - 5),
                        lastDate: DateTime(initialDate.year + 5),
                        format: _df,
                      ),
                      FormInputField(
                        icon: Icons.assignment,
                        nameForm: _f.projectName,
                        nameTextField: '${_f.projectName}_tf',
                        label: 'Tên dự án',
                        isRequired: true,
                        validator: _requiredValidator,
                      ),
                    ]),
                  ),
                ),
                const SizedBox(height: _cardGap),

                /// ===== PHÂN LOẠI DỰ ÁN =====
                FormCard(
                  title: 'Phân loại dự án',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _spaced([
                      BlocSelector<ProjectAddBloc, ProjectAddState,
                          List<ProjectTypeBase>>(
                        selector: (s) => s.projectTypes,
                        builder: (context, types) =>
                            _pickerField<ProjectTypeBase>(
                          fieldName: _f.projectType,
                          label: 'Kiểu dự án',
                          icon: Icons.workspaces_outlined,
                          isRequired: true,
                          options: types,
                          displayText: (e) => e.name ?? '',
                          sheetTitle: 'Chọn kiểu dự án',
                        ),
                      ),
                      BlocSelector<ProjectAddBloc, ProjectAddState,
                          List<FirmBase>>(
                        selector: (s) => s.firms,
                        builder: (context, firms) => _pickerField<FirmBase>(
                          fieldName: _f.brandId,
                          label: 'Hãng',
                          icon: Icons.branding_watermark_outlined,
                          isRequired: false,
                          options: firms,
                          displayText: (e) => e.name ?? '',
                          sheetTitle: 'Chọn hãng',
                        ),
                      ),
                      BlocSelector<ProjectAddBloc, ProjectAddState,
                          List<CustomerIndustry>>(
                        selector: (s) => s.industries,
                        builder: (context, industries) =>
                            _pickerField<CustomerIndustry>(
                          fieldName: _f.categoryId,
                          label: 'Loại',
                          icon: Icons.style_outlined,
                          isRequired: false,
                          options: industries,
                          displayText: (e) => e.nameVI ?? '',
                          sheetTitle: 'Chọn loại',
                        ),
                      ),
                      BlocSelector<ProjectAddBloc, ProjectAddState,
                          List<ProjectStatusItem>>(
                        selector: (s) => s.statuses,
                        builder: (context, statuses) =>
                            _pickerField<ProjectStatusItem>(
                          fieldName: _f.projectStatus,
                          label: 'Trạng thái',
                          icon: Icons.flag_outlined,
                          isRequired: false,
                          options: statuses,
                          displayText: (e) => e.name ?? '',
                          sheetTitle: 'Chọn trạng thái',
                        ),
                      ),
                      BlocSelector<ProjectAddBloc, ProjectAddState,
                          List<ProjectTypeBase>>(
                        selector: (s) => s.projectTypes,
                        builder: (context, types) =>
                            _pickerField<ProjectTypeBase>(
                          fieldName: _f.priority,
                          label: 'Mức ưu tiên',
                          icon: Icons.priority_high,
                          isRequired: true,
                          options: types,
                          displayText: (e) => e.name ?? '',
                          sheetTitle: 'Chọn mức ưu tiên',
                        ),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(height: _cardGap),

                /// ===== NGƯỜI PHỤ TRÁCH =====
                FormCard(
                  title: 'Người phụ trách',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _spaced([
                      BlocSelector<ProjectAddBloc, ProjectAddState,
                          List<PmItem>>(
                        selector: (s) => s.pms,
                        builder: (context, pms) => _pickerField<PmItem>(
                          fieldName: _f.saleId,
                          label: 'Sale',
                          icon: Icons.support_agent,
                          isRequired: true,
                          options: pms,
                          displayText: (e) =>
                              '${e.code ?? ''} - ${e.fullName ?? ''}',
                          sheetTitle: 'Chọn Sale',
                        ),
                      ),
                      BlocSelector<ProjectAddBloc, ProjectAddState,
                          List<PmItem>>(
                        selector: (s) => s.pms,
                        builder: (context, pms) => _pickerField<PmItem>(
                          fieldName: _f.technicalId,
                          label: 'Technical',
                          icon: Icons.engineering,
                          isRequired: true,
                          options: pms,
                          displayText: (e) =>
                              '${e.code ?? ''} - ${e.fullName ?? ''}',
                          sheetTitle: 'Chọn Technical',
                        ),
                      ),
                      BlocSelector<ProjectAddBloc, ProjectAddState,
                          List<PmItem>>(
                        selector: (s) => s.pms,
                        builder: (context, pms) => _pickerField<PmItem>(
                          fieldName: _f.pmId,
                          label: 'PM',
                          icon: Icons.person_outline,
                          isRequired: true,
                          options: pms,
                          displayText: (e) =>
                              '${e.code ?? ''} - ${e.fullName ?? ''}',
                          sheetTitle: 'Chọn PM',
                        ),
                      ),
                      BlocSelector<ProjectAddBloc, ProjectAddState,
                          List<PmItem>>(
                        selector: (s) => s.pms,
                        builder: (context, pms) => _pickerField<PmItem>(
                          fieldName: _f.picId,
                          label: 'Người phụ trách PIC',
                          icon: Icons.badge_outlined,
                          isRequired: false,
                          options: pms,
                          displayText: (e) =>
                              '${e.code ?? ''} - ${e.fullName ?? ''}',
                          sheetTitle: 'Chọn PIC',
                        ),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(height: _cardGap),

                /// ===== THÔNG TIN END USER =====
                FormCard(
                  title: 'Thông tin End User',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _spaced([
                      BlocSelector<ProjectAddBloc, ProjectAddState,
                          List<PmItem>>(
                        selector: (s) => s.pms,
                        builder: (context, pms) => _pickerField<PmItem>(
                          fieldName: _f.endUserId,
                          label: 'End User',
                          icon: Icons.account_circle_outlined,
                          isRequired: true,
                          options: pms,
                          displayText: (e) =>
                              '${e.code ?? ''} - ${e.fullName ?? ''}',
                          sheetTitle: 'Chọn End User',
                        ),
                      ),
                      BlocSelector<ProjectAddBloc, ProjectAddState,
                          List<CustomerIndustry>>(
                        selector: (s) => s.industries,
                        builder: (context, industries) =>
                            _pickerField<CustomerIndustry>(
                          fieldName: _f.endUserBusinessFieldId,
                          label: 'Lĩnh vực End User',
                          icon: Icons.category_outlined,
                          isRequired: false,
                          options: industries,
                          displayText: (e) => e.nameVI ?? '',
                          sheetTitle: 'Chọn lĩnh vực End User',
                        ),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(height: _cardGap),

                /// ===== DỰ KIẾN =====
                FormCard(
                  title: 'Dự kiến',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _spaced([
                      FormDateTimePicker(
                        icon: Icons.send_outlined,
                        nameForm: _f.expectedPlanStart,
                        nameTimePicker: '${_f.expectedPlanStart}_picker',
                        label: 'Gửi dự án',
                        inputType: InputType.date,
                        initialDate: initialDate,
                        firstDate: DateTime(initialDate.year - 5),
                        lastDate: DateTime(initialDate.year + 5),
                        format: _df,
                      ),
                      FormDateTimePicker(
                        icon: Icons.request_quote_outlined,
                        nameForm: _f.expectedQuoteStart,
                        nameTimePicker: '${_f.expectedQuoteStart}_picker',
                        label: 'Gửi báo giá',
                        inputType: InputType.date,
                        initialDate: initialDate,
                        firstDate: DateTime(initialDate.year - 5),
                        lastDate: DateTime(initialDate.year + 5),
                        format: _df,
                      ),
                      FormDateTimePicker(
                        icon: Icons.receipt_long_outlined,
                        nameForm: _f.expectedPoStart,
                        nameTimePicker: '${_f.expectedPoStart}_picker',
                        label: 'PO',
                        inputType: InputType.date,
                        initialDate: initialDate,
                        firstDate: DateTime(initialDate.year - 5),
                        lastDate: DateTime(initialDate.year + 5),
                        format: _df,
                      ),
                      FormDateTimePicker(
                        icon: Icons.event_available_outlined,
                        nameForm: _f.expectedEnd,
                        nameTimePicker: '${_f.expectedEnd}_picker',
                        label: 'Kết thúc',
                        inputType: InputType.date,
                        initialDate: initialDate,
                        firstDate: DateTime(initialDate.year - 5),
                        lastDate: DateTime(initialDate.year + 5),
                        format: _df,
                      ),
                    ]),
                  ),
                ),
                const SizedBox(height: _cardGap),

                /// ===== THỰC TẾ =====
                FormCard(
                  title: 'Thực tế',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _spaced([
                      FormDateTimePicker(
                        icon: Icons.send_outlined,
                        nameForm: _f.actualPlanStart,
                        nameTimePicker: '${_f.actualPlanStart}_picker',
                        label: 'Gửi dự án',
                        inputType: InputType.date,
                        initialDate: initialDate,
                        firstDate: DateTime(initialDate.year - 5),
                        lastDate: DateTime(initialDate.year + 5),
                        format: _df,
                      ),
                      FormDateTimePicker(
                        icon: Icons.request_quote_outlined,
                        nameForm: _f.actualQuoteStart,
                        nameTimePicker: '${_f.actualQuoteStart}_picker',
                        label: 'Gửi báo giá',
                        inputType: InputType.date,
                        initialDate: initialDate,
                        firstDate: DateTime(initialDate.year - 5),
                        lastDate: DateTime(initialDate.year + 5),
                        format: _df,
                      ),
                      FormDateTimePicker(
                        icon: Icons.receipt_long_outlined,
                        nameForm: _f.actualPoStart,
                        nameTimePicker: '${_f.actualPoStart}_picker',
                        label: 'PO',
                        inputType: InputType.date,
                        initialDate: initialDate,
                        firstDate: DateTime(initialDate.year - 5),
                        lastDate: DateTime(initialDate.year + 5),
                        format: _df,
                      ),
                      FormDateTimePicker(
                        icon: Icons.event_available_outlined,
                        nameForm: _f.actualEnd,
                        nameTimePicker: '${_f.actualEnd}_picker',
                        label: 'Kết thúc',
                        inputType: InputType.date,
                        initialDate: initialDate,
                        firstDate: DateTime(initialDate.year - 5),
                        lastDate: DateTime(initialDate.year + 5),
                        format: _df,
                      ),
                    ]),
                  ),
                ),
                const SizedBox(height: _cardGap),

                /// ===== MÔ TẢ =====
                FormCard(
                  title: 'Mô tả',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _spaced([
                      FormInputField(
                        icon: Icons.description_outlined,
                        nameForm: _f.note,
                        nameTextField: '${_f.note}_tf',
                        label: 'Mô tả dự án',
                        maxLines: 3,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                      ),
                      FormInputField(
                        icon: Icons.info_outline,
                        nameForm: _f.currentState,
                        nameTextField: '${_f.currentState}_tf',
                        label: 'Hiện trạng',
                        maxLines: 3,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                      ),
                    ]),
                  ),
                ),

                /// Padding bottom để ListView cuộn qua khỏi FormActions
                /// khi FormActions overlay floating.
                const SizedBox(height: 80),
              ],
            ),
          ),

          /// Stack nút: FormActions ở dưới cùng, overlay trên form
          /// (form trong Stack trên scroll độc lập, nút cố định bottom).
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: FormActions(
                mode: FormActionMode.add,
                onSubmit: _submit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Gom tất cả tên field của FormBuilder vào một chỗ để tránh hard-code rải rác.
class _FieldNames {
  final customerId = 'project_customer_id';
  final customerBusinessFieldId = 'project_customer_business_field_id';

  final projectCode = 'project_code';
  final projectName = 'project_name';
  final createdDate = 'project_created_date';

  final projectType = 'project_type';
  final brandId = 'project_brand_id';
  final categoryId = 'project_category_id';
  final projectStatus = 'project_status';
  final priority = 'project_priority';

  final saleId = 'project_sale_id';
  final technicalId = 'project_technical_id';
  final pmId = 'project_pm_id';
  final picId = 'project_pic_id';

  final endUserId = 'project_end_user_id';
  final endUserBusinessFieldId = 'project_end_user_business_field_id';

  final expectedPlanStart = 'project_expected_plan_start';
  final expectedQuoteStart = 'project_expected_quote_start';
  final expectedPoStart = 'project_expected_po_start';
  final expectedEnd = 'project_expected_end';

  final actualPlanStart = 'project_actual_plan_start';
  final actualQuoteStart = 'project_actual_quote_start';
  final actualPoStart = 'project_actual_po_start';
  final actualEnd = 'project_actual_end';

  final note = 'project_note';
  final currentState = 'project_current_state';
}
