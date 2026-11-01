import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/lead_sale_model.dart';
import '../bloc/lead_sale_bloc.dart';

/// Kết quả chọn trong dialog phân công lead.
class LeadSaleAssignSelection {
  /// ID nhân viên sale được phân công.
  final int saleEmployeeId;

  /// Ghi chú gửi kèm khi phân công.
  final String note;

  const LeadSaleAssignSelection({
    required this.saleEmployeeId,
    required this.note,
  });
}

/// Dialog phân công phiếu lead cho nhân viên sale.
///
/// Danh sách nhân viên lấy từ state `assignableSales` của [LeadSaleBloc]
/// (`GET /Lead/get-sale-employees?onlyAssignable=true`). Bắt buộc chọn nhân
/// viên sale, ghi chú không bắt buộc.
class LeadSaleAssignDialog extends StatefulWidget {
  /// Mở dialog phân công.
  ///
  /// Trả về nhân viên + ghi chú đã chọn, `null` nếu người dùng huỷ.
  static Future<LeadSaleAssignSelection?> show(
    BuildContext context, {
    required LeadSaleBloc bloc,
    String? leadCode,
    String? companyName,
  }) {
    return showDialog<LeadSaleAssignSelection>(
      context: context,
      builder: (_) => BlocProvider<LeadSaleBloc>.value(
        value: bloc,
        child: LeadSaleAssignDialog(
          leadCode: leadCode,
          companyName: companyName,
        ),
      ),
    );
  }

  /// Mã phiếu lead hiển thị trên dialog.
  final String? leadCode;

  /// Tên công ty của phiếu lead.
  final String? companyName;

  const LeadSaleAssignDialog({super.key, this.leadCode, this.companyName});

  @override
  State<LeadSaleAssignDialog> createState() => _LeadSaleAssignDialogState();
}

class _LeadSaleAssignDialogState extends State<LeadSaleAssignDialog> {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Nhân viên sale đã chọn.
  LeadSaleEmployee? _sale;

  /// Đã bấm xác nhận nhưng chưa chọn nhân viên → hiện lỗi dưới ô chọn.
  bool _showSaleError = false;

  static const Color _accentColor = Color(0xFF0288D1);

  @override
  Widget build(BuildContext context) {
    final code = (widget.leadCode ?? '').trim();
    final company = (widget.companyName ?? '').trim();

    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: BlocBuilder<LeadSaleBloc, LeadSaleState>(
        buildWhen: (previous, current) =>
            previous.assignableSales != current.assignableSales ||
            previous.assignableSalesStatus != current.assignableSalesStatus,
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 14),
                  _buildLeadInfo(code, company),
                  const SizedBox(height: 18),
                  _buildSaleLabel(),
                  const SizedBox(height: 8),
                  _buildSaleField(state),
                  if (_showSaleError && _sale == null) ...[
                    const SizedBox(height: 6),
                    const Text(
                      'Vui lòng chọn nhân viên Sale',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.stateErrorColor,
                      ),
                    ),
                  ],
                  const SizedBox(height: 18),
                  FormInputField(
                    nameForm: 'lead_assign_note',
                    nameTextField: 'lead_assign_note_field',
                    label: 'Ghi chú',
                    icon: Icons.edit_note,
                    maxLines: 4,
                    autoExpand: true,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLength: 500,
                  ),
                  const SizedBox(height: 16),
                  _buildActions(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Header: icon + tiêu đề + nút đóng.
  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _accentColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.person_add_alt_1_outlined,
            size: 20,
            color: _accentColor,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            'Phân công nhân viên Sale',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColors.enableText,
            ),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close, color: AppColors.gray, size: 20),
        ),
      ],
    );
  }

  /// Thông tin phiếu lead: mã phiếu + công ty.
  Widget _buildLeadInfo(String code, String company) {
    return FormLeftBorderCard(
      icon: Icons.assignment_outlined,
      iconColor: _accentColor,
      borderColor: _accentColor,
      backgroundColor: _accentColor.withValues(alpha: 0.08),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            code.isEmpty ? 'Lead' : 'Lead: $code',
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
    );
  }

  /// Nhãn ô chọn nhân viên sale kèm dấu `*` bắt buộc.
  Widget _buildSaleLabel() {
    return const Text.rich(
      TextSpan(
        text: 'Nhân viên Sale',
        style: TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w700,
          color: AppColors.heading,
        ),
        children: [
          TextSpan(
            text: ' *',
            style: TextStyle(color: AppColors.stateErrorColor),
          ),
        ],
      ),
    );
  }

  /// Ô chọn nhân viên sale — chạm để mở danh sách tìm kiếm.
  Widget _buildSaleField(LeadSaleState state) {
    final isLoading = state.assignableSalesStatus == BaseStateStatus.loading;
    final label = _employeeLabel(_sale);
    final hasValue = label.isNotEmpty;
    final hasError = _showSaleError && _sale == null;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : () => _pickSale(state),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: hasValue
                ? _accentColor.withValues(alpha: 0.08)
                : AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: hasError
                  ? AppColors.stateErrorColor
                  : hasValue
                  ? _accentColor.withValues(alpha: 0.4)
                  : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.badge_outlined,
                size: 18,
                color: hasValue ? _accentColor : AppColors.gray,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  isLoading
                      ? 'Đang tải danh sách...'
                      : hasValue
                      ? label
                      : 'Chọn nhân viên Sale',
                  style: TextStyle(
                    fontSize: 13.5,
                    color: hasValue ? AppColors.enableText : AppColors.gray,
                    fontWeight: hasValue ? FontWeight.w600 : FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isLoading)
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
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

  /// Nút huỷ bỏ + phân công.
  Widget _buildActions() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.borderColor, width: 1.2),
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
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: _accentColor,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: _onConfirm,
            icon: const Icon(Icons.check_rounded, size: 18),
            label: const Text(
              'Phân công',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }

  /// Mở danh sách nhân viên sale để chọn.
  ///
  /// Danh sách rỗng (tải lỗi hoặc API không trả) → tải lại.
  Future<void> _pickSale(LeadSaleState state) async {
    final sales = state.assignableSales;
    if (sales.isEmpty) {
      context.read<LeadSaleBloc>().add(
        const LeadSaleEvent.loadAssignableSales(),
      );
      return;
    }

    await openSelectBottomSheet<LeadSaleEmployee>(
      context: context,
      title: 'Chọn nhân viên Sale',
      items: sales,
      displayText: _employeeLabel,
      hintText: 'Tìm nhân viên Sale...',
      onSelected: (sale) => setState(() => _sale = sale),
    );
  }

  /// Xác nhận phân công — bắt buộc đã chọn nhân viên sale.
  void _onConfirm() {
    final state = _formKey.currentState;
    if (!(state?.saveAndValidate() ?? false)) return;

    final saleId = _sale?.id;
    if (saleId == null) {
      setState(() => _showSaleError = true);
      return;
    }

    final note = state!.value['lead_assign_note']?.toString() ?? '';
    Navigator.of(
      context,
    ).pop(LeadSaleAssignSelection(saleEmployeeId: saleId, note: note.trim()));
  }

  /// Nhãn hiển thị của nhân viên: `Mã - Tên`.
  String _employeeLabel(LeadSaleEmployee? employee) {
    if (employee == null) return '';
    final code = (employee.code ?? '').trim();
    final name = (employee.fullName ?? '').trim();
    if (code.isEmpty) return name;
    if (name.isEmpty) return code;
    return '$code - $name';
  }
}
