import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/form_input_field.dart';
import '../../data/datasource/models/contract_registration_model.dart';
import '../bloc/contract_registration_bloc.dart';

/// Bottom sheet hiển thị thông tin hợp đồng + hành động duyệt / từ chối.
///
/// Dùng cho người nhận được đơn yêu cầu.
class ContractApprovalSheet extends StatefulWidget {
  const ContractApprovalSheet({super.key, required this.item});

  final ContractResponseItem item;

  @override
  State<ContractApprovalSheet> createState() => _ContractApprovalSheetState();
}

class _ContractApprovalSheetState extends State<ContractApprovalSheet> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isRejecting = false;
  String _rejectReason = '';

  static final _dateFmt = DateFormat('dd/MM/yyyy');

  String _formatDate(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  void _showRejectDialog(BuildContext context, ContractRegistrationBloc bloc) {
    showDialog<void>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Từ chối duyệt',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.heading,
            fontSize: 18,
          ),
        ),
        content: FormBuilder(
          key: _formKey,
          child: FormInputField(
            nameForm: 'reason_cancel',
            nameTextField: 'reason_cancel_field',
            label: 'Lý do từ chối',
            icon: Icons.cancel_outlined,
            maxLines: 3,
            isRequired: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Vui lòng nhập lý do từ chối';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogCtx).pop(),
            child: Text(
              'Huỷ',
              style: TextStyle(color: AppColors.gray),
            ),
          ),
          FilledButton(
            onPressed: () {
              if (_formKey.currentState?.saveAndValidate() ?? false) {
                _rejectReason = _formKey.currentState!.value['reason_cancel'] ?? '';
                Navigator.of(dialogCtx).pop();
                bloc.add(ContractRegistrationEvent.approveOrCancel(
                  id: widget.item.id ?? 0,
                  status: 2,
                  reasonCancel: _rejectReason.trim(),
                ));
              }
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.alert,
            ),
            child: const Text('Từ chối'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ContractRegistrationBloc>();
    final item = widget.item;

    return BlocListener<ContractRegistrationBloc, ContractRegistrationState>(
      listenWhen: (prev, curr) =>
          prev.isApproving != curr.isApproving ||
          prev.approveSuccess != curr.approveSuccess ||
          prev.message != curr.message,
      listener: (ctx, state) {
        if (state.isApproving) {
          setState(() => _isRejecting = true);
        }
        if (state.approveSuccess) {
          Navigator.of(context).pop();
          context.showMessage(
            state.message ?? 'Thao tác thành công',
            type: SnackBarType.success,
          );
          bloc.add(const ContractRegistrationEvent.init());
        }
        if (state.status == BaseStateStatus.failed && state.message != null) {
          setState(() => _isRejecting = false);
          context.showMessage(state.message!, type: SnackBarType.error);
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHandle(),
                const SizedBox(height: 12),
                _buildHeader(),
                const SizedBox(height: 16),
                _buildInfoGrid(item),
                const SizedBox(height: 20),
                _buildActions(context, bloc, item),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHandle() {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: AppColors.borderColor,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryERP.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.assignment_outlined,
            color: AppColors.primaryERP,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Xác nhận đăng ký',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: AppColors.heading,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Hợp đồng #${widget.item.id ?? '—'}',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.gray,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close, color: AppColors.gray),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  Widget _buildInfoGrid(ContractResponseItem item) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.documentName?.isNotEmpty == true
                ? item.documentName!
                : '—',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: AppColors.heading,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.person_outline, size: 15, color: AppColors.gray),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Người đăng ký',
                      style: TextStyle(fontSize: 10, color: AppColors.gray),
                    ),
                    Text(
                      item.employeeRegister ?? '—',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.heading,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _InfoCell(
                  icon: Icons.business_outlined,
                  label: 'Công ty thuế',
                  value: item.taxCompany ?? '—',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _InfoCell(
                  icon: Icons.folder_outlined,
                  label: 'Loại hồ sơ',
                  value: item.documentType ?? '—',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _InfoCell(
                  icon: Icons.calendar_today_outlined,
                  label: 'Ngày đăng ký',
                  value: _formatDate(item.registedDate),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _InfoCell(
                  icon: Icons.copy_outlined,
                  label: 'Số lượng',
                  value: '${item.documentQuantity ?? '—'} bản',
                ),
              ),
            ],
          ),
          if (item.contractType?.isNotEmpty == true) ...[
            const SizedBox(height: 10),
            _InfoCell(
              icon: Icons.description_outlined,
              label: 'Loại văn bản',
              value: item.contractType!,
            ),
          ],
          if (item.folderPath?.isNotEmpty == true) ...[
            const SizedBox(height: 10),
            _InfoCell(
              icon: Icons.link,
              label: 'Đường dẫn file',
              value: item.folderPath!,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildActions(
    BuildContext context,
    ContractRegistrationBloc bloc,
    ContractResponseItem item,
  ) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _showRejectDialog(context, bloc),
            icon: const Icon(Icons.cancel_outlined, size: 20),
            label: const Text('Từ chối'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.alert,
              side: const BorderSide(color: AppColors.alert, width: 1.5),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: BlocBuilder<ContractRegistrationBloc, ContractRegistrationState>(
            buildWhen: (p, c) => p.isApproving != c.isApproving,
            builder: (ctx, state) {
              return FilledButton.icon(
                onPressed: state.isApproving
                    ? null
                    : () {
                        bloc.add(ContractRegistrationEvent.approveOrCancel(
                          id: item.id ?? 0,
                          status: 1,
                          reasonCancel: '',
                        ));
                      },
                icon: state.isApproving && !_isRejecting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.check_circle_outline, size: 20),
                label: Text(state.isApproving && !_isRejecting
                    ? 'Đang xử lý...'
                    : 'Xác nhận'),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.stateSuccessColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _InfoCell extends StatelessWidget {
  const _InfoCell({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15, color: AppColors.gray),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 10, color: AppColors.gray),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.heading,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
