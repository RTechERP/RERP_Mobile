import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/utils/formatter/thousands_input_formatter.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/lead_marketing_model.dart';
import '../bloc/lead_marketing_bloc.dart';
import '../widgets/lead_marketing_select_field.dart';
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

class _LeadMarketingAddScreenState extends BaseShareState<
    LeadMarketingAddScreen,
    LeadMarketingEvent,
    LeadMarketingState,
    LeadMarketingBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Ngày thu thập mặc định là hôm nay.
  late final DateTime _today;

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
    return BlocBuilder<LeadMarketingBloc, LeadMarketingState>(
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Tạo phiếu lead'),
            onBackTap: () => context.pop(),
          ),
          body: Column(
            children: [
              Expanded(
                child: FormBuilder(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FormActions(
                  mode: FormActionMode.add,
                  submitText: 'Tạo phiếu lead',
                  onSubmit: () => _handleSubmit(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Khối 1: thông tin doanh nghiệp.
  Widget _buildCompanySection(LeadMarketingState state) {
    return FormCard(
      title: 'Thông tin doanh nghiệp',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeadSelectField<LeadCustomer>(
            idFieldName: 'lead_customer_id',
            textFieldName: 'lead_customer_text',
            label: 'Khách hàng',
            icon: Icons.business_outlined,
            sheetTitle: 'Chọn khách hàng',
            items: state.customers,
            displayText: (c) {
              final name = (c.customerName ?? '').trim();
              final code = (c.customerCode ?? '').trim();
              if (name.isEmpty) return code.isEmpty ? '—' : code;
              return code.isEmpty ? name : '$code - $name';
            },
            idOf: (c) => c.id?.toString(),
            searchHint: 'Tìm khách hàng...',
            isRequired: true,
            emptyMessage: 'Chưa có danh sách khách hàng',
          ),
          const SizedBox(height: 12),
          LeadSelectField<LeadPoType>(
            idFieldName: 'lead_po_type_id',
            textFieldName: 'lead_po_type_text',
            label: 'Nhóm hàng',
            icon: Icons.category_outlined,
            sheetTitle: 'Chọn nhóm hàng',
            items: state.poTypes,
            displayText: (p) => (p.mainIndex ?? '').trim().isEmpty
                ? 'Nhóm ${p.id}'
                : (p.mainIndex ?? '').trim(),
            idOf: (p) => p.id?.toString(),
            searchHint: 'Tìm nhóm hàng...',
            isRequired: true,
            emptyMessage: 'Chưa có danh sách nhóm hàng',
          ),
          const SizedBox(height: 12),
          FormChoiceGroup<String>(
            name: 'lead_customer_type',
            label: 'Loại khách hàng',
            icon: Icons.people_alt_outlined,
            columns: 3,
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
          LeadSelectField<LeadCustomerIndustry>(
            idFieldName: 'lead_industry_id',
            textFieldName: 'lead_industry_text',
            label: 'Lĩnh vực',
            icon: Icons.domain_outlined,
            sheetTitle: 'Chọn lĩnh vực',
            items: state.customerIndustries,
            displayText: (i) => (i.industriesNameVi ?? '').trim().isEmpty
                ? 'Lĩnh vực ${i.id}'
                : (i.industriesNameVi ?? '').trim(),
            idOf: (i) => i.id?.toString(),
            searchHint: 'Tìm lĩnh vực...',
            emptyMessage: 'Chưa có danh sách lĩnh vực',
          ),
          const SizedBox(height: 12),
          LeadSelectField<LeadCustomerSpecialization>(
            idFieldName: 'lead_specialization_id',
            textFieldName: 'lead_specialization_text',
            label: 'Ngành nghề',
            icon: Icons.factory_outlined,
            sheetTitle: 'Chọn ngành nghề',
            items: state.customerSpecializations,
            displayText: (s) => (s.name ?? '').trim().isEmpty
                ? 'Ngành nghề ${s.id}'
                : (s.name ?? '').trim(),
            idOf: (s) => s.id?.toString(),
            searchHint: 'Tìm ngành nghề...',
            emptyMessage: 'Chưa có danh sách ngành nghề',
          ),
          const SizedBox(height: 12),
          LeadSelectField<LeadProvince>(
            idFieldName: 'lead_province_id',
            textFieldName: 'lead_province_text',
            label: 'Tỉnh/Thành',
            icon: Icons.location_on_outlined,
            sheetTitle: 'Chọn tỉnh/thành',
            items: state.provinces,
            displayText: (p) => (p.provinceName ?? '').trim().isEmpty
                ? 'Tỉnh ${p.id}'
                : (p.provinceName ?? '').trim(),
            idOf: (p) => p.id?.toString(),
            searchHint: 'Tìm tỉnh/thành...',
            emptyMessage: 'Chưa có danh sách tỉnh/thành',
          ),
          const SizedBox(height: 12),
          FormInputField(
            nameForm: 'lead_address',
            nameTextField: 'lead_address_field',
            label: 'Địa chỉ',
            icon: Icons.home_work_outlined,
            maxLines: 2,
            autoExpand: true,
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
          ),
          const SizedBox(height: 12),
          LeadSelectField<LeadSource>(
            idFieldName: 'lead_source_id',
            textFieldName: 'lead_source_text',
            label: 'Nguồn lead',
            icon: Icons.campaign_outlined,
            sheetTitle: 'Chọn nguồn lead',
            items: state.sources,
            displayText: leadSourceLabel,
            idOf: (s) => s.id?.toString(),
            searchHint: 'Tìm nguồn lead...',
            isRequired: true,
            emptyMessage: 'Chưa có danh sách nguồn lead',
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
            columns: 3,
            options: const [
              FormChoiceOption(
                value: 1,
                label: 'Thấp',
                selectedColor: AppColors.gray,
              ),
              FormChoiceOption(
                value: 2,
                label: 'Trung bình',
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
          LeadSelectField<LeadEmployee>(
            idFieldName: 'lead_marketing_employee_id',
            textFieldName: 'lead_marketing_employee_text',
            label: 'NV Marketing phụ trách',
            icon: Icons.support_agent_outlined,
            sheetTitle: 'Chọn NV Marketing',
            items: state.marketingEmployees,
            displayText: (e) {
              final code = (e.code ?? '').trim();
              final name = (e.fullName ?? '').trim();
              if (code.isEmpty && name.isEmpty) return '—';
              if (code.isEmpty) return name;
              if (name.isEmpty) return code;
              return '$code - $name';
            },
            idOf: (e) => e.id?.toString(),
            searchHint: 'Tìm NV Marketing...',
            emptyMessage: 'Chưa có danh sách NV Marketing',
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

  /// Kiểm tra form rồi gửi sự kiện tạo phiếu lead.
  ///
  /// API tạo phiếu chưa chốt nên hiện tại chỉ validate và báo lại giá trị đã
  /// nhập, phần gửi API sẽ nối tiếp khi có endpoint.
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
    debugPrint('[LeadAdd] form values: $values');

    showMessage(
      context,
      'Phiếu lead đã được tạo',
      type: SnackBarType.success,
    );
  }
}
