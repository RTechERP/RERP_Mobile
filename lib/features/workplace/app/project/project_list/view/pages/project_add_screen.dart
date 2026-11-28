import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/bloc/bloc_status.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../../../di/injection.dart';
import '../../data/datasource/model/project_list_model.dart';
import '../bloc/project_list_bloc.dart';
import '../widgets/project_priority_sheet.dart';

/// Màn hình tạo dự án - thu thập thông tin dự án mới.
///
/// Dùng chung [ProjectListBloc] với màn danh sách nên toàn bộ dữ liệu
/// lookup (khách hàng, kiểu dự án, trạng thái, hãng, lĩnh vực, nhân sự,
/// PM) đã được tải sẵn. Các field dropdown mở `openSelectBottomSheet`
/// để chọn, nhân sự được nhóm theo phòng ban.
///
/// Một số field được disable nhưng vẫn hiển thị dữ liệu:
/// - Mã dự án: sinh tự động qua API `get-project-code-modal`.
/// - Lĩnh vực khách hàng & Lĩnh vực End User: map theo lĩnh vực của
///   khách hàng đã chọn.
/// - Mức ưu tiên: chọn trong sheet cây cha - con, lấy từ API
///   `get-project-priority-modal`.
class ProjectAddScreen extends StatelessWidget {
  const ProjectAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ProjectListBloc>()..add(const ProjectListEvent.reloadLookups()),
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

  /// Tên field cho FormBuilder - dùng để truy xuất qua `formState.value`.
  static final _f = _FieldNames();

  /// Validator chung cho các trường required.
  static final FormFieldValidator<dynamic> _requiredValidator =
      FormBuilderValidators.required(errorText: 'Vui lòng không để trống');

  /// Khách hàng đang chọn - dùng để map lĩnh vực và sinh mã dự án.
  CustomerItem? _selectedCustomer;

  /// Kiểu dự án đang chọn - dùng để sinh mã dự án.
  ///
  /// Mặc định là phần tử đầu tiên của [kProjectTypeOptions] ("Dự án").
  ProjectTypeOption? _selectedTypeOption = kProjectTypeOptions.first;

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

  /// Cập nhật giá trị của một field trong FormBuilder.
  ///
  /// Bỏ qua nếu giá trị không đổi để tránh đánh dấu field dirty vô ích.
  void _setFieldValue(String fieldName, String? value) {
    final field = _formKey.currentState?.fields[fieldName];
    if (field == null) return;
    if (field.value == value) return;
    field.didChange(value);
  }

  /// Tạo 1 field picker dạng dropdown hiển thị bằng `FormInputField` +
  /// bottom sheet. Data lấy từ [ProjectListBloc.state] tương ứng.
  Widget _pickerField<T>({
    required String fieldName,
    required String label,
    required IconData icon,
    required bool isRequired,
    required List<T> options,
    required String Function(T) displayText,
    required String sheetTitle,
    String Function(T)? groupBy,
    void Function(T value)? onSelected,
    String? initialValue,
  }) {
    return GestureDetector(
      onTap: () async {
        await _openPicker<T>(
          title: sheetTitle,
          items: options,
          displayText: displayText,
          groupBy: groupBy,
          onSelected: (value) {
            _setFieldValue(fieldName, displayText(value));
            onSelected?.call(value);
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
          initialValue: initialValue,
          validator: isRequired
              ? (v) => v == null || v.trim().isEmpty
                    ? 'Vui lòng chọn $label'
                    : null
              : null,
        ),
      ),
    );
  }

  /// Tạo 1 field chỉ đọc - không cho chọn/nhập nhưng vẫn hiển thị dữ liệu.
  ///
  /// Dùng component có sẵn [FormReadonlyField] của project: nền xám,
  /// [IgnorePointer] chặn tương tác chuột và `readOnly` chặn gõ bàn phím.
  Widget _readonlyField({
    required String fieldName,
    required String label,
    required IconData icon,
    String? value,
    bool isRequired = false,
  }) {
    return _ReadonlyField(
      /// Key theo giá trị để field được dựng lại khi giá trị thay đổi.
      key: ValueKey('$fieldName-${value ?? ''}'),
      fieldName: fieldName,
      label: label,
      icon: icon,
      value: value,
      isRequired: isRequired,
    );
  }

  /// Mở sheet chọn giá trị. Nếu có [groupBy] thì nhóm theo phòng ban.
  Future<void> _openPicker<T>({
    required String title,
    required List<T> items,
    required String Function(T) displayText,
    required void Function(T) onSelected,
    String Function(T)? groupBy,
  }) async {
    if (items.isEmpty) {
      context.showMessage(
        'Danh sách lựa chọn chưa sẵn sàng, đang tải lại...',
        type: SnackBarType.info,
      );
      context.read<ProjectListBloc>().add(
        const ProjectListEvent.reloadLookups(),
      );
      return;
    }

    if (groupBy != null) {
      await openSelectBottomSheetGrouped<T>(
        context: context,
        title: title,
        items: items,
        groupBy: groupBy,
        displayText: displayText,
        onSelected: onSelected,
      );
      return;
    }

    await openSelectBottomSheet<T>(
      context: context,
      title: title,
      items: items,
      displayText: displayText,
      onSelected: onSelected,
    );
  }

  /// Mở sheet chọn mức ưu tiên dạng cây cha - con.
  ///
  /// Khi bấm "Lưu" trong sheet, tổng điểm ưu tiên được truyền ra ngoài và
  /// hiển thị ở ô "Mức ưu tiên".
  ///
  /// Mỗi lần mở là một lần chọn mới - không giữ lại các mốc đã tick lần
  /// trước, nên không cộng dồn vào giá trị cũ.
  Future<void> _openPrioritySheet(
    List<ProjectPriorityType> priorityTypes,
  ) async {
    if (priorityTypes.isEmpty) {
      context.showMessage(
        'Danh sách mức ưu tiên chưa sẵn sàng, đang tải lại...',
        type: SnackBarType.info,
      );
      context.read<ProjectListBloc>().add(
        const ProjectListEvent.reloadLookups(),
      );
      return;
    }

    await openProjectPrioritySheet(
      context: context,
      items: priorityTypes,
      onConfirm: (selectedIds, total) {
        _setFieldValue(
          _f.priority,
          total == 0 ? null : formatPriorityValue(total),
        );
      },
    );
  }

  /// Xử lý khi chọn khách hàng.
  ///
  /// Map lĩnh vực khách hàng và lĩnh vực End User theo lĩnh vực của khách
  /// hàng đã chọn (giống nhau), đồng thời gán End User theo khách hàng và
  /// sinh lại mã dự án.
  void _onCustomerSelected(CustomerItem customer) {
    setState(() => _selectedCustomer = customer);

    _applyIndustryValues(context.read<ProjectListBloc>().state.industries);

    /// End User mặc định theo khách hàng đã chọn.
    _setFieldValue(_f.endUserId, customer.displayLabel);

    // Đổi khách hàng thì mã dự án cũ không còn đúng.
    context.read<ProjectListBloc>().add(
      const ProjectListEvent.clearGeneratedCode(),
    );
    _setFieldValue(_f.projectCode, null);

    _generateProjectCode();
  }

  /// Tên lĩnh vực của khách hàng (map từ `CustomerIndustriesID`).
  String? _industryNameOf(
    CustomerItem customer,
    List<CustomerIndustry> industries,
  ) {
    final id = customer.industriesId;
    if (id == null) return null;
    for (final i in industries) {
      if (i.id == id) return i.nameVI;
    }
    return null;
  }

  /// Gán lại lĩnh vực khách hàng và lĩnh vực End User vào form.
  ///
  /// Cả hai field dùng chung giá trị lĩnh vực của khách hàng đã chọn.
  /// Cần chạy lại khi danh sách lĩnh vực tải về muộn, vì lúc đó map từ
  /// `CustomerIndustriesID` mới có kết quả.
  void _applyIndustryValues(List<CustomerIndustry> industries) {
    final customer = _selectedCustomer;
    if (customer == null) return;

    final industry = _industryNameOf(customer, industries);
    _setFieldValue(_f.customerBusinessFieldId, industry);
    _setFieldValue(_f.endUserBusinessFieldId, industry);
  }

  /// Xử lý khi chọn kiểu dự án - sinh lại mã dự án.
  void _onProjectTypeSelected(ProjectTypeOption typeOption) {
    setState(() => _selectedTypeOption = typeOption);

    context.read<ProjectListBloc>().add(
      const ProjectListEvent.clearGeneratedCode(),
    );
    _setFieldValue(_f.projectCode, null);

    _generateProjectCode();
  }

  /// Gọi API sinh mã dự án tự động.
  ///
  /// Mã mới được đưa vào state và gán vào field qua listener của
  /// `BlocConsumer`. Chỉ cần khách hàng đã chọn - `projectType` lấy từ kiểu
  /// dự án nếu có, không có thì API vẫn sinh được mã.
  void _generateProjectCode() {
    final customer = _selectedCustomer;
    if (customer == null) return;

    final shortName = (customer.shortName ?? '').trim();
    if (shortName.isEmpty) {
      context.showMessage(
        'Khách hàng chưa có tên viết tắt nên không thể sinh mã dự án',
        type: SnackBarType.error,
      );
      return;
    }

    context.read<ProjectListBloc>().add(
      ProjectListEvent.generateProjectCode(
        customerShortName: shortName,
        projectType: _selectedTypeOption?.id ?? 0,
      ),
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

    /// `FormReadonlyField` không có slot validator nên mã dự án (sinh tự động)
    /// được kiểm tra thủ công.
    final code = formState.instantValue[_f.projectCode] as String?;
    if (code == null || code.trim().isEmpty) {
      context.showMessage(
        'Chưa sinh được mã dự án, vui lòng chọn khách hàng và kiểu dự án',
        type: SnackBarType.error,
      );
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

    return BlocConsumer<ProjectListBloc, ProjectListState>(
      listenWhen: (prev, curr) =>
          prev.generatedProjectCode != curr.generatedProjectCode ||
          prev.industries != curr.industries ||
          (prev.status != curr.status && curr.status == BaseStateStatus.failed),
      listener: (context, state) {
        /// Lookup lĩnh vực có thể tải về sau khi người dùng đã chọn khách
        /// hàng - cần map lại để các field lĩnh vực hiển thị đúng.
        _applyIndustryValues(state.industries);

        final code = state.generatedProjectCode;
        if (code != null && code.isNotEmpty) {
          _setFieldValue(_f.projectCode, code);
          return;
        }
        if (state.status == BaseStateStatus.failed && state.message != null) {
          context.showMessage(state.message!, type: SnackBarType.error);
        }
      },
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Tạo dự án'),
            onBackTap: () => context.pop(),
          ),

          /// [Column] thay vì [Stack]: FormActions nằm dưới [ListView] nên không
          /// overlay lên ô nhập. Nếu dùng [Stack] + [Positioned], khi bàn phím
          /// mở [ListView] cuộn ô nhập xuống sát đáy và bị thanh nút trắng
          /// đè lên, không nhìn thấy nội dung đang gõ.
          body: Column(
            children: [
              Expanded(
                child: FormBuilder(
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
                            BlocSelector<
                              ProjectListBloc,
                              ProjectListState,
                              List<CustomerItem>
                            >(
                              selector: (s) => s.customers,
                              builder: (context, customers) =>
                                  _pickerField<CustomerItem>(
                                    fieldName: _f.customerId,
                                    label: 'Khách hàng',
                                    icon: Icons.business,
                                    isRequired: true,
                                    options: customers,
                                    displayText: (e) => e.displayLabel,
                                    sheetTitle: 'Chọn khách hàng',
                                    onSelected: _onCustomerSelected,
                                  ),
                            ),

                            /// Lĩnh vực khách hàng - disable, map theo khách hàng.
                            _readonlyField(
                              fieldName: _f.customerBusinessFieldId,
                              label: 'Lĩnh vực khách hàng',
                              icon: Icons.category_outlined,
                              value: _selectedCustomer == null
                                  ? null
                                  : _industryNameOf(
                                      _selectedCustomer!,
                                      state.industries,
                                    ),
                            ),

                            BlocSelector<
                              ProjectListBloc,
                              ProjectListState,
                              List<CustomerItem>
                            >(
                              selector: (s) => s.customers,
                              builder: (context, customers) =>
                                  _pickerField<CustomerItem>(
                                    fieldName: _f.endUserId,
                                    label: 'End User',
                                    icon: Icons.account_circle_outlined,
                                    isRequired: true,
                                    options: customers,
                                    displayText: (e) => e.displayLabel,
                                    sheetTitle: 'Chọn End User',
                                  ),
                            ),

                            /// Lĩnh vực End User - disable, dùng chung giá trị lĩnh
                            /// vực của khách hàng đã chọn.
                            _readonlyField(
                              fieldName: _f.endUserBusinessFieldId,
                              label: 'Lĩnh vực End User',
                              icon: Icons.category_outlined,
                              value: _selectedCustomer == null
                                  ? null
                                  : _industryNameOf(
                                      _selectedCustomer!,
                                      state.industries,
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
                            /// Mã dự án - disable, sinh tự động qua API.
                            _readonlyField(
                              fieldName: _f.projectCode,
                              label: 'Mã dự án',
                              icon: Icons.qr_code,
                              isRequired: true,
                              value: state.generatedProjectCode,
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
                            /// Kiểu dự án - danh sách cố định, ID theo thứ tự
                            /// là tham số `projectType` khi sinh mã dự án.
                            /// Mặc định là phần tử đầu tiên ("Dự án").
                            _pickerField<ProjectTypeOption>(
                              fieldName: _f.projectType,
                              label: 'Kiểu dự án',
                              icon: Icons.workspaces_outlined,
                              isRequired: true,
                              options: kProjectTypeOptions,
                              displayText: (e) => e.name,
                              sheetTitle: 'Chọn kiểu dự án',
                              onSelected: _onProjectTypeSelected,
                              initialValue: kProjectTypeOptions.first.name,
                            ),
                            BlocSelector<
                              ProjectListBloc,
                              ProjectListState,
                              List<FirmBase>
                            >(
                              selector: (s) => s.firms,
                              builder: (context, firms) =>
                                  _pickerField<FirmBase>(
                                    fieldName: _f.brandId,
                                    label: 'Hãng',
                                    icon: Icons.branding_watermark_outlined,
                                    isRequired: false,
                                    options: firms,
                                    displayText: (e) => e.name ?? '',
                                    sheetTitle: 'Chọn hãng',
                                  ),
                            ),
                            BlocSelector<
                              ProjectListBloc,
                              ProjectListState,
                              List<ProjectTypeBase>
                            >(
                              selector: (s) => s.projectTypeBases,
                              builder: (context, types) =>
                                  _pickerField<ProjectTypeBase>(
                                    fieldName: _f.categoryId,
                                    label: 'Loại',
                                    icon: Icons.style_outlined,
                                    isRequired: false,
                                    options: types,
                                    displayText: (e) => e.name ?? '',
                                    sheetTitle: 'Chọn loại',
                                  ),
                            ),
                            BlocSelector<
                              ProjectListBloc,
                              ProjectListState,
                              List<ProjectStatusItem>
                            >(
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

                            /// Mức ưu tiên - bấm vào mở sheet chọn dạng cây
                            /// cha - con, hiển thị tổng điểm ưu tiên.
                            BlocSelector<
                              ProjectListBloc,
                              ProjectListState,
                              List<ProjectPriorityType>
                            >(
                              selector: (s) => s.priorityTypes,
                              builder: (context, priorityTypes) =>
                                  GestureDetector(
                                    onTap: () =>
                                        _openPrioritySheet(priorityTypes),
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        readOnly: true,
                                        nameForm: _f.priority,
                                        nameTextField: '${_f.priority}_tf',
                                        label: 'Mức ưu tiên',
                                        icon: Icons.priority_high,
                                        suffixIcon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppColors.gray,
                                        ),
                                      ),
                                    ),
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
                            BlocSelector<
                              ProjectListBloc,
                              ProjectListState,
                              List<UserItem>
                            >(
                              selector: (s) => s.users,
                              builder: (context, users) =>
                                  _pickerField<UserItem>(
                                    fieldName: _f.saleId,
                                    label: 'Sale',
                                    icon: Icons.support_agent,
                                    isRequired: true,
                                    options: users,
                                    displayText: (e) =>
                                        '${e.code ?? ''} - ${e.fullName ?? ''}'
                                            .trim(),
                                    sheetTitle: 'Chọn Sale',
                                    groupBy: (e) =>
                                        (e.departmentName ?? '').trim(),
                                  ),
                            ),
                            BlocSelector<
                              ProjectListBloc,
                              ProjectListState,
                              List<UserItem>
                            >(
                              selector: (s) => s.users,
                              builder: (context, users) =>
                                  _pickerField<UserItem>(
                                    fieldName: _f.technicalId,
                                    label: 'Kỹ thuật',
                                    icon: Icons.engineering,
                                    isRequired: true,
                                    options: users,
                                    displayText: (e) =>
                                        '${e.code ?? ''} - ${e.fullName ?? ''}'
                                            .trim(),
                                    sheetTitle: 'Chọn Kỹ thuật',
                                    groupBy: (e) =>
                                        (e.departmentName ?? '').trim(),
                                  ),
                            ),
                            BlocSelector<
                              ProjectListBloc,
                              ProjectListState,
                              List<PmItem>
                            >(
                              selector: (s) => s.pms,
                              builder: (context, pms) => _pickerField<PmItem>(
                                fieldName: _f.pmId,
                                label: 'PM',
                                icon: Icons.person_outline,
                                isRequired: true,
                                options: pms,
                                displayText: (e) =>
                                    '${e.code ?? ''} - ${e.fullName ?? ''}'
                                        .trim(),
                                sheetTitle: 'Chọn PM',
                                groupBy: (e) => (e.departmentName ?? '').trim(),
                              ),
                            ),

                            /// PIC - người dùng tự nhập.
                            FormInputField(
                              icon: Icons.person_pin_circle_outlined,
                              nameForm: _f.pic,
                              nameTextField: '${_f.pic}_tf',
                              label: 'PIC',
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
                              label: 'Ngày gửi dự án',
                              isRequired: true,
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
                              label: 'Ngày gửi báo giá',
                              isRequired: true,
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
                              label: 'Ngày PO',
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
                              label: 'Ngày kết thúc',
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
                              label: 'Ngày gửi phương án',
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
                              label: 'Ngày gửi báo giá',
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
                              label: 'Ngày PO',
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
                              label: 'Ngày kết thúc',
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
                              autoExpand: true,
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                            ),
                            FormInputField(
                              icon: Icons.info_outline,
                              nameForm: _f.currentState,
                              nameTextField: '${_f.currentState}_tf',
                              label: 'Hiện trạng',
                              autoExpand: true,
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Thanh nút nằm dưới form, không overlay lên [ListView].
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: FormActions(mode: FormActionMode.add, onSubmit: _submit),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Field chỉ đọc của FormBuilder.
///
/// Dùng component có sẵn [FormReadonlyField] của project: nền xám,
/// [IgnorePointer] chặn tương tác chuột và `readOnly` chặn gõ bàn phím.
///
/// [FormReadonlyField] hiển thị `field.value` của FormBuilder và bên trong
/// dùng `TextFormField(initialValue: ...)` - `initialValue` chỉ có tác dụng
/// lần đầu field được dựng. Vì vậy widget này được đặt `key` theo giá trị:
/// mỗi khi giá trị đổi, field cũ bị thay bằng field mới, đồng thời giá trị
/// cũ được xoá khỏi FormBuilder trước để field mới nhận đúng giá trị khi
/// đăng ký.
class _ReadonlyField extends StatefulWidget {
  final String fieldName;
  final String label;
  final IconData icon;
  final String? value;
  final bool isRequired;

  const _ReadonlyField({
    super.key,
    required this.fieldName,
    required this.label,
    required this.icon,
    this.value,
    this.isRequired = false,
  });

  @override
  State<_ReadonlyField> createState() => _ReadonlyFieldState();
}

class _ReadonlyFieldState extends State<_ReadonlyField> {
  @override
  void initState() {
    super.initState();

    /// Xoá giá trị cũ khỏi FormBuilder trước khi field mới đăng ký, nếu
    /// không field mới sẽ giữ giá trị cũ và hiển thị sai.
    FormBuilder.of(context)?.removeInternalFieldValue(widget.fieldName);
  }

  @override
  Widget build(BuildContext context) {
    return FormReadonlyField(
      name: widget.fieldName,
      label: widget.isRequired ? null : widget.label,

      /// Dấu `*` màu đỏ giống `formInputDecoration` của các field nhập liệu.
      labelWidget: widget.isRequired
          ? Text.rich(
              TextSpan(
                text: widget.label,
                children: const [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            )
          : null,
      icon: widget.icon,
      initialValue: widget.value,
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
  final pic = 'project_pic';

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
