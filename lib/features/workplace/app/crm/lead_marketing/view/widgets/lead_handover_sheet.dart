import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/lead_marketing_model.dart';
import '../bloc/lead_marketing_bloc.dart';

/// Kết quả chọn trong bottom sheet bàn giao lead cho Leader Sale.
class LeadHandoverSelection {
  /// ID Leader Sale nhận bàn giao.
  final int leaderEmployeeId;

  /// ID Admin Sale được giao để xử lý.
  final int adminSaleId;

  /// Ghi chú gửi kèm cho Leader Sale.
  final String note;

  const LeadHandoverSelection({
    required this.leaderEmployeeId,
    required this.adminSaleId,
    required this.note,
  });
}

/// Bottom sheet bàn giao phiếu lead cho Leader Sale.
///
/// Cho phép chọn Leader Sale nhận bàn giao, Admin Sale xử lý và nhập ghi chú.
/// Khi chọn Leader Sale, bloc gọi API `admin-sale-id` để lấy Admin Sale tương
/// ứng rồi map vào danh sách Admin Sale.
class LeadHandoverSheet extends StatefulWidget {
  /// Mở bottom sheet bàn giao.
  ///
  /// Trả về thông tin đã chọn, `null` nếu người dùng huỷ.
  static Future<LeadHandoverSelection?> show(
    BuildContext context, {
    required LeadMarketingBloc bloc,
    String? leadCode,
    String? companyName,
  }) {
    return showModalBottomSheet<LeadHandoverSelection>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => BlocProvider<LeadMarketingBloc>.value(
        value: bloc,
        child: LeadHandoverSheet(
          leadCode: leadCode,
          companyName: companyName,
        ),
      ),
    );
  }

  /// Mã phiếu lead hiển thị trên sheet.
  final String? leadCode;

  /// Tên công ty của phiếu lead.
  final String? companyName;

  const LeadHandoverSheet({
    super.key,
    this.leadCode,
    this.companyName,
  });

  @override
  State<LeadHandoverSheet> createState() => _LeadHandoverSheetState();
}

class _LeadHandoverSheetState extends State<LeadHandoverSheet> {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Leader Sale đã chọn.
  LeadEmployee? _leader;

  /// Admin Sale đã chọn.
  LeadEmployee? _admin;

  @override
  Widget build(BuildContext context) {
    final code = (widget.leadCode ?? '').trim();
    final company = (widget.companyName ?? '').trim();

    return BlocConsumer<LeadMarketingBloc, LeadMarketingState>(
      listenWhen: (previous, current) =>
          previous.adminSaleId != current.adminSaleId,
      listener: (context, state) {
        final adminSaleId = state.adminSaleId;
        if (adminSaleId == null) return;

        // API trả về ID Admin Sale → map sang người trong danh sách để hiển thị.
        final matches =
            state.saleAdmins.where((admin) => admin.id == adminSaleId).toList();
        if (matches.isEmpty) return;

        setState(() => _admin = matches.first);
      },
      builder: (context, state) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.85,
          ),
          child: Padding(
            // Nới chiều cao sheet khi bàn phím mở để ô nhập không bị che.
            padding: EdgeInsets.only(
              bottom: MediaQuery.viewInsetsOf(context).bottom,
            ),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: 44,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.gray.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildHeader(code, company),
                  const SizedBox(height: 16),
                  Flexible(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FormBuilder(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const _SectionLabel(
                              icon: Icons.groups_2_outlined,
                              label: 'Leader Sale nhận bàn giao',
                            ),
                            const SizedBox(height: 8),
                            _SelectField(
                              icon: Icons.groups_2_outlined,
                              placeholder: 'Chọn Leader Sale',
                              value: _employeeLabel(_leader),
                              onTap: () => _pickLeader(state.saleLeaders),
                            ),
                            const SizedBox(height: 18),
                            const _SectionLabel(
                              icon: Icons.admin_panel_settings_outlined,
                              label: 'Admin Sale',
                            ),
                            const SizedBox(height: 8),
                            _SelectField(
                              icon: Icons.admin_panel_settings_outlined,
                              placeholder: 'Chọn Admin Sale',
                              value: _employeeLabel(_admin),
                              onTap: () => _pickAdmin(state.saleAdmins),
                            ),
                            const SizedBox(height: 18),
                            const _SectionLabel(
                              icon: Icons.edit_note_outlined,
                              label: 'Ghi chú cho Leader Sale',
                            ),
                            const SizedBox(height: 8),
                            FormInputField(
                              nameForm: 'lead_handover_note',
                              nameTextField: 'lead_handover_note_field',
                              label: 'Nội dung ghi chú',
                              icon: Icons.edit_note,
                              maxLines: 4,
                              autoExpand: true,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              maxLength: 500,
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _buildFooter(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Header: icon + tiêu đề + thông tin phiếu lead.
  Widget _buildHeader(String code, String company) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.swap_horiz_rounded,
                  size: 20,
                  color: AppColors.primaryERP,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bàn giao lead cho leader Sale',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.enableText,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Chọn người nhận bàn giao và ghi chú kèm theo',
                      style: TextStyle(
                        fontSize: 11.5,
                        color: AppColors.gray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close, color: AppColors.gray, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 14),
          FormLeftBorderCard(
            icon: Icons.assignment_outlined,
            iconColor: AppColors.secondaryERP,
            borderColor: AppColors.secondaryERP,
            backgroundColor: AppColors.secondaryERP.withValues(alpha: 0.08),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code.isEmpty ? 'Lead' : 'Lead:$code',
                  style: AppStyles.body2.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.neutralText,
                  ),
                ),
                if (company.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    company,
                    style: AppStyles.body2.copyWith(
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Footer: nút huỷ bỏ + xác nhận bàn giao.
  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppColors.borderColor, width: 0.6),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: AppColors.borderColor,
                  width: 1.2,
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Huỷ bỏ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.enableText,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _onConfirm,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.swap_horiz_rounded, size: 18),
                  SizedBox(width: 6),
                  Text(
                    'Xác nhận bàn giao',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Mở danh sách Leader Sale để chọn.
  Future<void> _pickLeader(List<LeadEmployee> leaders) async {
    if (leaders.isEmpty) {
      _showInfo('Chưa có danh sách Leader Sale');
      return;
    }

    await openSelectBottomSheet<LeadEmployee>(
      context: context,
      title: 'Chọn Leader Sale nhận bàn giao',
      items: leaders,
      displayText: _employeeLabel,
      hintText: 'Tìm Leader Sale...',
      onSelected: (leader) {
        setState(() {
          _leader = leader;
          // Đổi Leader Sale → Admin Sale cũng có thể đổi theo.
          _admin = null;
        });

        // Lấy Admin Sale tương ứng với Leader Sale vừa chọn.
        final leaderId = leader.id;
        if (leaderId == null) return;
        context.read<LeadMarketingBloc>().add(
              LeadMarketingEvent.loadAdminSaleId(leaderSaleId: leaderId),
            );
      },
    );
  }

  /// Mở danh sách Admin Sale để chọn.
  Future<void> _pickAdmin(List<LeadEmployee> admins) async {
    if (admins.isEmpty) {
      _showInfo('Chưa có danh sách Admin Sale');
      return;
    }

    await openSelectBottomSheet<LeadEmployee>(
      context: context,
      title: 'Chọn Admin Sale',
      items: admins,
      displayText: _employeeLabel,
      hintText: 'Tìm Admin Sale...',
      onSelected: (admin) => setState(() => _admin = admin),
    );
  }

  /// Xác nhận bàn giao — trả về thông tin đã chọn cho màn danh sách.
  void _onConfirm() {
    final state = _formKey.currentState;
    if (!(state?.saveAndValidate() ?? false)) return;

    final leaderId = _leader?.id;
    final adminId = _admin?.id;
    if (leaderId == null || adminId == null) {
      _showInfo('Vui lòng chọn Leader Sale và Admin Sale');
      return;
    }

    final note = state!.value['lead_handover_note']?.toString() ?? '';
    Navigator.of(context).pop(
      LeadHandoverSelection(
        leaderEmployeeId: leaderId,
        adminSaleId: adminId,
        note: note,
      ),
    );
  }

  /// Nhãn hiển thị của nhân viên: `Mã - Tên`.
  String _employeeLabel(LeadEmployee? employee) {
    if (employee == null) return '';
    final code = (employee.code ?? '').trim();
    final name = (employee.fullName ?? '').trim();
    if (code.isEmpty && name.isEmpty) return '—';
    if (code.isEmpty) return name;
    if (name.isEmpty) return code;
    return '$code - $name';
  }

  /// Hiển thị thông báo nhắc nhở.
  void _showInfo(String message) {
    context.showMessage(message, type: SnackBarType.info);
  }
}

/// Nhãn nhóm tiêu chí.
class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15, color: AppColors.secondaryERP),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w700,
            color: AppColors.heading,
          ),
        ),
      ],
    );
  }
}

/// Một dòng chọn: icon + placeholder / giá trị đã chọn, chạm để mở picker.
class _SelectField extends StatelessWidget {
  const _SelectField({
    required this.icon,
    required this.placeholder,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String placeholder;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasValue = value.isNotEmpty;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: hasValue
                ? AppColors.primaryERP.withValues(alpha: 0.08)
                : AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: hasValue
                  ? AppColors.primaryERP.withValues(alpha: 0.4)
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: hasValue ? AppColors.primaryERP : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 16,
                  color: hasValue ? Colors.white : AppColors.gray,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  hasValue ? value : placeholder,
                  style: TextStyle(
                    fontSize: 13.5,
                    color: hasValue ? AppColors.enableText : AppColors.gray,
                    fontWeight:
                        hasValue ? FontWeight.w600 : FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (hasValue)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(
                    Icons.edit_outlined,
                    size: 16,
                    color: AppColors.primaryERP.withValues(alpha: 0.7),
                  ),
                )
              else
                const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.gray,
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
