import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/form_helper.dart';
import '../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../common/utils/formatter/thousands_input_formatter.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/lead_marketing_model.dart';
import '../bloc/lead_marketing_bloc.dart';
import '../widgets/lead_marketing_source_label.dart';

/// Màn tạo phiếu lead mới cho CRM.
///
/// Chia form thành 3 khối theo trình tự tự nhiên của người dùng:
/// 1. Thông tin doanh nghiệp — ai là khách hàng, họ thuộc lĩnh vực nào.
/// 2. Người liên hệ — ai là người mình sẽ gọi.
/// 3. Nhu cầu & phân loại — họ cần gì, đáng giá bao nhiêu, ai phụ trách.
///
/// Toàn bộ danh mục chọn được tải sẵn ở màn danh sách nên khi mở form này
/// người dùng không phải chờ mạng.
class LeadMarketingAddScreen extends StatefulWidget {
  const LeadMarketingAddScreen({super.key});

  @override
  State<LeadMarketingAddScreen> createState() => _LeadMarketingAddScreenState();
}

class _LeadMarketingAddScreenState
    extends
        BaseShareState<
          LeadMarketingAddScreen,
          LeadMarketingEvent,
          LeadMarketingState,
          LeadMarketingBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Ngày thu thập mặc định là hôm nay.
  late final DateTime _today;

  /// Danh sách field bắt buộc, theo thứ tự hiển thị trên form.
  ///
  /// Dùng làm `priorityFields` khi focus ô lỗi đầu tiên để form luôn nhảy
  /// về field bắt buộc bị thiếu theo đúng thứ tự người dùng đang nhìn.
  static const _requiredFields = <String>[
    'lead_customer_text',
    'lead_po_type_text',
    'lead_contact_name',
    'lead_collected_date',
    'lead_source_text',
  ];

  /// Ngành nghề có mở được bottom sheet để tự chọn không.
  ///
  /// API chi tiết khách hàng trả `CustomerSpecializationID`; nếu null thì
  /// người dùng được phép tự chọn. Các trường còn lại chỉ nhận từ API.
  bool _canPickSpecialization = false;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _today = DateTime(now.year, now.month, now.day);

    // Deep link vào thẳng màn add (không qua màn danh sách) thì danh mục
    // chưa được tải → trigger load để các bottom sheet có dữ liệu.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (bloc.state.customers.isEmpty || bloc.state.poTypes.isEmpty) {
        bloc.add(const LeadMarketingEvent.loadFormOptions());
      }
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocConsumer<LeadMarketingBloc, LeadMarketingState>(
      listenWhen: (previous, current) =>
          previous.customerDetailStatus != current.customerDetailStatus ||
          previous.customerIndustries != current.customerIndustries ||
          previous.customerSpecializations != current.customerSpecializations ||
          previous.provinces != current.provinces,
      listener: (context, state) {
        // Chỉ fill khi đã có chi tiết khách hàng. Danh mục có thể về sau
        // chi tiết → listener fill lại khi danh mục thay đổi.
        if (state.customerDetailStatus == BaseStateStatus.success) {
          _fillFromCustomerDetail(state);
        }
      },
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Tạo phiếu Lead'),
            onBackTap: () => context.pop(),
          ),
          body: Column(
            children: [
              Expanded(
                child: FormBuilder(
                  key: _formKey,
                  // Dùng SingleChildScrollView thay vì ListView: ListView build
                  // lazy nên field nằm ngoài viewport sẽ bị dispose và mất
                  // trạng thái validate (viền đỏ) khi vuốt qua lại.
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCompanySection(state),
                        const SizedBox(height: 12),
                        _buildContactSection(),
                        const SizedBox(height: 12),
                        _buildDemandSection(state),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FormActions(
                  mode: FormActionMode.add,
                  submitText: 'Lưu',
                  onSubmit: () => _handleSubmit(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Fill sẵn thông tin doanh nghiệp từ chi tiết khách hàng.
  ///
  /// Chi tiết khách hàng có sẵn `CustomerIndustriesID` (lĩnh vực),
  /// `CustomerSpecializationID` (ngành nghề), `Province` (tỉnh/thành) và
  /// `Address` (địa chỉ) → map sang id/tên tương ứng trong danh mục đang
  /// có rồi patch vào form, giúp người dùng không phải chọn lại.
  void _fillFromCustomerDetail(LeadMarketingState state) {
    final detail = state.customerDetail;
    if (detail == null) return;

    final patch = <String, dynamic>{};

    // Lĩnh vực.
    final industryId = detail.customerIndustriesId;
    final industryMatches = industryId == null
        ? const <LeadCustomerIndustry>[]
        : state.customerIndustries.where((i) => i.id == industryId).toList();
    final industry = industryMatches.isEmpty ? null : industryMatches.first;
    patch['lead_industry_id'] = industry?.id?.toString() ?? '';
    _putText(
      patch,
      'lead_industry_text',
      (industry?.industriesNameVi ?? '').trim(),
    );

    // Ngành nghề.
    final specializationId = detail.customerSpecializationId;
    final specializationMatches = specializationId == null
        ? const <LeadCustomerSpecialization>[]
        : state.customerSpecializations
              .where((s) => s.id == specializationId)
              .toList();
    final specialization = specializationMatches.isEmpty
        ? null
        : specializationMatches.first;
    patch['lead_specialization_id'] = specialization?.id?.toString() ?? '';
    _putText(
      patch,
      'lead_specialization_text',
      (specialization?.name ?? '').trim(),
    );

    // Ngành nghề chỉ mở được bottom sheet khi API không trả giá trị.
    final canPick = specializationId == null;
    if (canPick != _canPickSpecialization) {
      setState(() => _canPickSpecialization = canPick);
    }

    // Tỉnh/thành — API trả tên, danh mục trả id nên cần tra theo tên.
    final provinceName = (detail.province ?? '').trim();
    final provinceMatches = state.provinces
        .where(
          (p) =>
              (p.provinceName ?? '').trim().toLowerCase() ==
              provinceName.toLowerCase(),
        )
        .toList();
    final province = provinceMatches.isEmpty ? null : provinceMatches.first;
    patch['lead_province_id'] = province?.id?.toString() ?? '';
    _putText(patch, 'lead_province_text', provinceName);

    // Địa chỉ.
    _putText(patch, 'lead_address', (detail.address ?? '').trim());

    // Chờ field đã mount rồi mới patch, tránh patchValue bị miss.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _formKey.currentState?.patchValue(patch);
    });
  }

  /// Khối 1: thông tin doanh nghiệp.
  Widget _buildCompanySection(LeadMarketingState state) {
    return FormCard(
      title: 'Thông tin doanh nghiệp',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Field ẩn chứa id khách hàng đã chọn.
          const _HiddenField('lead_customer_id'),
          GestureDetector(
            onTap: _pickCustomer,
            child: AbsorbPointer(
              child: FormInputField(
                nameForm: 'lead_customer_text',
                nameTextField: 'lead_customer_text_field',
                label: 'Khách hàng',
                icon: Icons.business_outlined,
                readOnly: true,
                isRequired: true,
                validator: _requiredValidator('khách hàng'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const _HiddenField('lead_po_type_id'),
          GestureDetector(
            onTap: _pickPoType,
            child: AbsorbPointer(
              child: FormInputField(
                nameForm: 'lead_po_type_text',
                nameTextField: 'lead_po_type_text_field',
                label: 'Nhóm hàng',
                icon: Icons.category_outlined,
                readOnly: true,
                isRequired: true,
                validator: _requiredValidator('nhóm hàng'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          FormChoiceGroup<String>(
            name: 'lead_customer_type',
            label: 'Loại khách hàng',
            icon: Icons.people_alt_outlined,
            columns: 4,
            // Mặc định là "Không có".
            initialValue: LeadCustomerType.none.value.toString(),
            options: [
              for (final type in LeadCustomerType.values)
                FormChoiceOption(
                  value: type.value.toString(),
                  label: type.label,
                  selectedColor: AppColors.primaryERP,
                ),
            ],
          ),
          const SizedBox(height: 12),
          const _HiddenField('lead_industry_id'),
          FormInputField(
            nameForm: 'lead_industry_text',
            nameTextField: 'lead_industry_text_field',
            label: 'Lĩnh vực',
            icon: Icons.domain_outlined,
            // Chỉ nhận giá trị từ API chi tiết khách hàng → không cho mở sheet.
            readOnly: true,
            enabled: false,
          ),
          const SizedBox(height: 12),
          const _HiddenField('lead_specialization_id'),
          // Ngành nghề: API có trả giá trị thì khoá (xám), API trả null thì
          // cho phép mở bottom sheet để người dùng tự chọn.
          GestureDetector(
            onTap: _canPickSpecialization ? _pickSpecialization : null,
            child: AbsorbPointer(
              child: FormInputField(
                nameForm: 'lead_specialization_text',
                nameTextField: 'lead_specialization_text_field',
                label: 'Ngành nghề',
                icon: Icons.factory_outlined,
                readOnly: true,
                enabled: _canPickSpecialization,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const _HiddenField('lead_province_id'),
          FormInputField(
            nameForm: 'lead_province_text',
            nameTextField: 'lead_province_text_field',
            label: 'Tỉnh/Thành',
            icon: Icons.location_on_outlined,
            // Chỉ nhận giá trị từ API chi tiết khách hàng → không cho mở sheet.
            readOnly: true,
            enabled: false,
          ),
          const SizedBox(height: 12),
          FormInputField(
            nameForm: 'lead_address',
            nameTextField: 'lead_address_field',
            label: 'Địa chỉ',
            icon: Icons.home_work_outlined,
            maxLines: 2,
            autoExpand: true,
            // Chỉ nhận giá trị từ API chi tiết khách hàng.
            readOnly: true,
            enabled: false,
          ),
        ],
      ),
    );
  }

  /// Khối 2: người liên hệ.
  Widget _buildContactSection() {
    return FormCard(
      title: 'Người liên hệ',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormInputField(
            nameForm: 'lead_contact_name',
            nameTextField: 'lead_contact_name_field',
            label: 'Họ tên',
            icon: Icons.person_outline,
            isRequired: true,
            validator: _requiredValidator('họ tên'),
          ),
          const SizedBox(height: 12),
          FormInputField(
            nameForm: 'lead_contact_position',
            nameTextField: 'lead_contact_position_field',
            label: 'Chức vụ',
            icon: Icons.badge_outlined,
          ),
          const SizedBox(height: 12),
          FormInputField(
            nameForm: 'lead_contact_phone',
            nameTextField: 'lead_contact_phone_field',
            label: 'Số điện thoại',
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            validator: (v) {
              final value = (v ?? '').trim();
              if (value.isEmpty) return null;
              if (!RegExp(r'^[0-9+\s]{8,15}$').hasMatch(value)) {
                return 'Số điện thoại không hợp lệ';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          FormInputField(
            nameForm: 'lead_contact_email',
            nameTextField: 'lead_contact_email_field',
            label: 'Email',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              final value = (v ?? '').trim();
              if (value.isEmpty) return null;
              if (!RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$').hasMatch(value)) {
                return 'Email không hợp lệ';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  /// Khối 3: nhu cầu & phân loại.
  Widget _buildDemandSection(LeadMarketingState state) {
    return FormCard(
      title: 'Nhu cầu & phân loại',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormDateTimePicker(
            nameForm: 'lead_collected_date',
            nameTimePicker: 'lead_collected_date_picker',
            label: 'Ngày thu thập',
            icon: Icons.event_outlined,
            inputType: InputType.date,
            format: DateFormat('dd/MM/yyyy'),
            initialValue: _today,
            initialDate: _today,
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng chọn ngày thu thập',
            ),
          ),
          const SizedBox(height: 12),
          const _HiddenField('lead_source_id'),
          GestureDetector(
            onTap: _pickSource,
            child: AbsorbPointer(
              child: FormInputField(
                nameForm: 'lead_source_text',
                nameTextField: 'lead_source_text_field',
                label: 'Nguồn lead',
                icon: Icons.campaign_outlined,
                readOnly: true,
                isRequired: true,
                validator: _requiredValidator('nguồn lead'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          FormInputField(
            nameForm: 'lead_campaign_name',
            nameTextField: 'lead_campaign_name_field',
            label: 'Chiến dịch',
            icon: Icons.flag_outlined,
          ),
          const SizedBox(height: 12),
          FormChoiceGroup<int>(
            name: 'lead_rating',
            label: 'Đánh giá',
            icon: Icons.star_outline_rounded,
            columns: 4,
            // Mặc định là "Không có".
            initialValue: 0,
            options: const [
              FormChoiceOption(
                value: 0,
                label: 'Trống',
                selectedColor: AppColors.gray,
              ),
              FormChoiceOption(
                value: 1,
                label: 'Thấp',
                selectedColor: AppColors.gray,
              ),
              FormChoiceOption(
                value: 2,
                label: 'T/bình',
                selectedColor: AppColors.orangeA500,
              ),
              FormChoiceOption(
                value: 3,
                label: 'Cao',
                selectedColor: AppColors.primaryERP,
              ),
            ],
          ),
          const SizedBox(height: 12),
          FormInputField(
            nameForm: 'lead_estimated_value',
            nameTextField: 'lead_estimated_value_field',
            label: 'Giá trị PO dự kiến',
            icon: Icons.payments_outlined,
            keyboardType: TextInputType.number,
            inputFormatters: [ThousandsInputFormatter()],
            suffixIcon: const Icon(
              Icons.attach_money,
              size: 20,
              color: AppColors.hintText,
            ),
          ),
          const SizedBox(height: 12),
          FormDateTimePicker(
            nameForm: 'lead_follow_up_date',
            nameTimePicker: 'lead_follow_up_date_picker',
            label: 'Hẹn liên hệ',
            icon: Icons.schedule_outlined,
            inputType: InputType.date,
            format: DateFormat('dd/MM/yyyy'),
            initialDate: _today,
          ),
          const SizedBox(height: 12),
          FormInputField(
            nameForm: 'lead_product_interest',
            nameTextField: 'lead_product_interest_field',
            label: 'Sản phẩm quan tâm',
            icon: Icons.inventory_2_outlined,
          ),
          const SizedBox(height: 12),
          const _HiddenField('lead_marketing_employee_id'),
          GestureDetector(
            onTap: _pickMarketingEmployee,
            child: AbsorbPointer(
              child: FormInputField(
                nameForm: 'lead_marketing_employee_text',
                nameTextField: 'lead_marketing_employee_text_field',
                label: 'NV Marketing phụ trách',
                icon: Icons.support_agent_outlined,
                readOnly: true,
              ),
            ),
          ),
          const SizedBox(height: 12),
          FormInputField(
            nameForm: 'lead_need_description',
            nameTextField: 'lead_need_description_field',
            label: 'Mô tả nhu cầu',
            icon: Icons.description_outlined,
            maxLines: 4,
            autoExpand: true,
          ),
          const SizedBox(height: 12),
          FormFilePicker(
            name: 'lead_files',
            label: 'File đính kèm',
            icon: Icons.attach_file,
            allowMultiple: true,
            allowedExtensions: const [
              'pdf',
              'doc',
              'docx',
              'xls',
              'xlsx',
              'png',
              'jpg',
              'jpeg',
              'gif',
              'zip',
              'rar',
            ],
            hintText: 'Hỗ trợ PDF, Word, Excel, ảnh, Zip',
          ),
          const SizedBox(height: 12),
          FormInputField(
            nameForm: 'lead_note',
            nameTextField: 'lead_note_field',
            label: 'Ghi chú',
            icon: Icons.sticky_note_2_outlined,
            maxLines: 3,
            autoExpand: true,
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // Bottom-sheet pickers
  // ===========================================================================

  /// Mở danh sách khách hàng.
  Future<void> _pickCustomer() async {
    final items = bloc.state.customers;
    if (items.isEmpty) {
      showMessage(
        context,
        'Chưa có danh sách khách hàng',
        type: SnackBarType.info,
      );
      return;
    }

    await openSelectBottomSheet<LeadCustomer>(
      context: context,
      title: 'Chọn khách hàng',
      items: items,
      displayText: _customerLabel,
      hintText: 'Tìm khách hàng...',
      onSelected: (customer) {
        _setSelectValue('lead_customer_text', _customerLabel(customer));
        _setHiddenValue('lead_customer_id', customer.id?.toString() ?? '');

        // Chọn khách hàng → tải chi tiết để fill lĩnh vực/ngành nghề/tỉnh.
        final id = customer.id;
        if (id == null) return;
        bloc.add(LeadMarketingEvent.loadCustomerDetail(id: id));
      },
    );
  }

  /// Mở danh sách nhóm hàng.
  Future<void> _pickPoType() async {
    final items = bloc.state.poTypes;
    if (items.isEmpty) {
      showMessage(
        context,
        'Chưa có danh sách nhóm hàng',
        type: SnackBarType.info,
      );
      return;
    }

    await openSelectBottomSheet<LeadPoType>(
      context: context,
      title: 'Chọn nhóm hàng',
      items: items,
      displayText: _poTypeLabel,
      hintText: 'Tìm nhóm hàng...',
      onSelected: (poType) {
        _setSelectValue('lead_po_type_text', _poTypeLabel(poType));
        _setHiddenValue('lead_po_type_id', poType.id?.toString() ?? '');
      },
    );
  }

  /// Mở danh sách ngành nghề (chỉ dùng khi API không trả giá trị).
  Future<void> _pickSpecialization() async {
    final items = bloc.state.customerSpecializations;
    if (items.isEmpty) {
      showMessage(
        context,
        'Chưa có danh sách ngành nghề',
        type: SnackBarType.info,
      );
      return;
    }

    await openSelectBottomSheet<LeadCustomerSpecialization>(
      context: context,
      title: 'Chọn ngành nghề',
      items: items,
      displayText: _specializationLabel,
      hintText: 'Tìm ngành nghề...',
      onSelected: (item) {
        _setSelectValue('lead_specialization_text', _specializationLabel(item));
        _setHiddenValue('lead_specialization_id', item.id?.toString() ?? '');
      },
    );
  }

  /// Mở danh sách nguồn lead.
  Future<void> _pickSource() async {
    final items = bloc.state.sources;
    if (items.isEmpty) {
      showMessage(
        context,
        'Chưa có danh sách nguồn lead',
        type: SnackBarType.info,
      );
      return;
    }

    await openSelectBottomSheet<LeadSource>(
      context: context,
      title: 'Chọn nguồn lead',
      items: items,
      displayText: leadSourceLabel,
      hintText: 'Tìm nguồn lead...',
      onSelected: (source) {
        _setSelectValue('lead_source_text', leadSourceLabel(source));
        _setHiddenValue('lead_source_id', source.id?.toString() ?? '');
      },
    );
  }

  /// Mở danh sách nhân viên marketing.
  Future<void> _pickMarketingEmployee() async {
    final items = bloc.state.marketingEmployees;
    if (items.isEmpty) {
      showMessage(
        context,
        'Chưa có danh sách NV Marketing',
        type: SnackBarType.info,
      );
      return;
    }

    await openSelectBottomSheet<LeadEmployee>(
      context: context,
      title: 'Chọn NV Marketing',
      items: items,
      displayText: _employeeLabel,
      hintText: 'Tìm NV Marketing...',
      onSelected: (employee) {
        _setSelectValue(
          'lead_marketing_employee_text',
          _employeeLabel(employee),
        );
        _setHiddenValue(
          'lead_marketing_employee_id',
          employee.id?.toString() ?? '',
        );
      },
    );
  }

  // ===========================================================================
  // Helpers
  // ===========================================================================

  /// Validator bắt buộc cho các ô nhập/ô chọn.
  ///
  /// Trả về thông báo lỗi khi giá trị rỗng, ngược lại trả null.
  FormFieldValidator<String> _requiredValidator(String label) {
    return FormBuilderValidators.required(
      errorText: 'Vui lòng nhập/chọn $label',
    );
  }

  /// Đưa giá trị hiển thị vào cả 2 field của [FormInputField].
  ///
  /// [FormInputField] đăng ký 2 field cùng validator: `nameForm` (giá trị
  /// hiển thị) và `nameTextField` (field text bên trong). Form validate duyệt
  /// cả 2 nên phải cập nhật đồng thời, nếu không form sẽ luôn báo lỗi dù
  /// đã có giá trị.
  void _putText(
    Map<String, dynamic> patch,
    String textFieldName,
    String value,
  ) {
    patch[textFieldName] = value;
    patch['${textFieldName}_field'] = value;
  }

  /// Ghi giá trị vào ô chọn.
  ///
  /// [FormInputField] đăng ký 2 field cùng validator: `nameForm` (giá trị
  /// hiển thị) và `nameTextField` (field text bên trong). Form validate duyệt
  /// cả 2 nên phải cập nhật đồng thời, nếu không form sẽ luôn báo lỗi dù
  /// người dùng đã chọn.
  void _setSelectValue(String textFieldName, String value) {
    final form = _formKey.currentState;
    form?.fields[textFieldName]?.didChange(value);
    form?.fields['${textFieldName}_field']?.didChange(value);
  }

  /// Ghi giá trị vào field ẩn chứa id.
  void _setHiddenValue(String name, String value) {
    _formKey.currentState?.fields[name]?.didChange(value);
  }

  /// Nhãn hiển thị của khách hàng: `Mã - Tên`.
  String _customerLabel(LeadCustomer customer) {
    final name = (customer.customerName ?? '').trim();
    final code = (customer.customerCode ?? '').trim();
    if (name.isEmpty) return code.isEmpty ? '—' : code;
    return code.isEmpty ? name : '$code - $name';
  }

  /// Nhãn hiển thị của nhóm hàng.
  String _poTypeLabel(LeadPoType poType) {
    final name = (poType.mainIndex ?? '').trim();
    return name.isEmpty ? 'Nhóm ${poType.id}' : name;
  }

  /// Nhãn hiển thị của ngành nghề.
  String _specializationLabel(LeadCustomerSpecialization item) {
    final name = (item.name ?? '').trim();
    return name.isEmpty ? 'Ngành nghề ${item.id}' : name;
  }

  /// Nhãn hiển thị của nhân viên: `Mã - Tên`.
  String _employeeLabel(LeadEmployee employee) {
    final code = (employee.code ?? '').trim();
    final name = (employee.fullName ?? '').trim();
    if (code.isEmpty && name.isEmpty) return '—';
    if (code.isEmpty) return name;
    if (name.isEmpty) return code;
    return '$code - $name';
  }

  /// Kiểm tra form rồi gửi sự kiện tạo phiếu lead.
  ///
  /// API tạo phiếu chưa chốt nên hiện tại chỉ validate và báo lại giá trị đã
  /// nhập, phần gửi API sẽ nối tiếp khi có endpoint.
  void _handleSubmit() {
    FocusScope.of(context).unfocus();

    final formState = _formKey.currentState;
    if (formState == null) return;
    if (!formState.saveAndValidate()) {
      // Cuộn tới và focus ô đầu tiên còn thiếu để người dùng biết cần
      // hoàn thiện field nào (saveAndValidate chỉ focus, không cuộn).
      FormHelper.focusFirstError(
        formState: formState,
        priorityFields: _requiredFields,
      );
      showMessage(
        context,
        'Vui lòng điền đầy đủ các trường bắt buộc',
        type: SnackBarType.error,
      );
      return;
    }

    final values = formState.value;
    debugPrint('[LeadAdd] form values: $values');

    showMessage(context, 'Phiếu lead đã được tạo', type: SnackBarType.success);
  }
}

/// Field ẩn chứa id của mục đã chọn (dùng khi gửi API).
class _HiddenField extends StatelessWidget {
  const _HiddenField(this.name);

  /// Tên field trong FormBuilder.
  final String name;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: name,
      initialValue: '',
      builder: (_) => const SizedBox.shrink(),
    );
  }
}
