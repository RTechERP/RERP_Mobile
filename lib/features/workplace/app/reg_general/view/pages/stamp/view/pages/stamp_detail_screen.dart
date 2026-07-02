import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/app_colors.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/stamp_model.dart';
import '../bloc/stamp_bloc.dart';

class StampDetailScreen extends StatefulWidget {
  final StampRoutePayload payload;

  const StampDetailScreen({super.key, required this.payload});

  @override
  State<StampDetailScreen> createState() => _StampDetailScreenState();
}

class _StampDetailScreenState
    extends BaseState<StampDetailScreen, StampEvent, StampState, StampBloc> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (widget.payload.item?.id != null) {
        bloc.add(StampEvent.initDetail(id: widget.payload.item!.id!));
      }
    });
  }

  @override
  bool listenWhen(StampState previous, StampState current) {
    return previous.deleteSuccess != current.deleteSuccess ||
        previous.message != current.message;
  }

  @override
  void listener(BuildContext context, StampState state) {
    if (state.deleteSuccess) {
      showMessage(context, 'Xóa thành công', type: SnackBarType.success);
      bloc.add(const StampEvent.clearDeleteState());
      context.pop(true);
      return;
    }
    if (state.status == BaseStateStatus.failed &&
        (state.message ?? '').isNotEmpty) {
      showMessage(context, state.message!, type: SnackBarType.error);
      bloc.add(const StampEvent.clearDeleteState());
    }
  }

  Color _getStatusColor(int? status) {
    switch (status) {
      case 1:
        return AppColors.success;
      case 2:
        return AppColors.alert;
      default:
        return AppColors.warning;
    }
  }

  String _getStatusText(int? status) {
    switch (status) {
      case 1:
        return 'Đã duyệt';
      case 2:
        return 'Đã hủy';
      default:
        return 'Chờ duyệt';
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<StampBloc, StampState>(
      bloc: bloc,
      builder: (context, state) {
        final detail = state.detailData ?? widget.payload.detail;
        final tracking =
            state.tracking ??
            detail?.tracking ??
            state.detailItem ??
            widget.payload.item ??
            const StampItem();
        final employeeName =
            state.detailEmployee?.fullName ??
            detail?.employee?.fullName ??
            tracking.employeeName;
        final departmentName =
            state.detailDepartment?.name ??
            detail?.department?.name ??
            tracking.departmentName;
        final statusColor = _getStatusColor(tracking.status);
        final documentTypeName =
            state.documentTypeName?.trim().isNotEmpty == true
            ? state.documentTypeName
            : tracking.documentTypeName;
        final sealFormat = state.sealRegulationName?.trim().isNotEmpty == true
            ? state.sealRegulationName
            : tracking.sealNameText;
        final taxCompanyName = state.taxCompanyName?.trim().isNotEmpty == true
            ? state.taxCompanyName
            : tracking.taxCompanyText;
        final employeeSignName =
            state.employeeSignName?.trim().isNotEmpty == true
            ? state.employeeSignName
            : tracking.employeeSignName;
        final hydratedEditItem = tracking.copyWith(
          employeeName: employeeName,
          departmentName: departmentName,
          documentTypeName: documentTypeName,
          employeeSignName: employeeSignName,
          taxCompanyText: taxCompanyName,
          sealNameText: sealFormat,
        );

        return BaseScaffold(
          backgroundColor: const Color(0xFFF6F8FC),
          appBar: AppBarCommon(
            title: Text('Chi tiết đăng ký dấu', style: AppStyles.headingTitle2),
            onBackTap: () => context.pop(),
          ),
          body: state.isDetailLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _HeroHeader(
                              documentName: tracking.documentName,
                              documentTypeName: documentTypeName,
                              sealFormat: sealFormat,
                              statusText: _getStatusText(tracking.status),
                              statusColor: statusColor,
                              registerDate: tracking.registerDate,
                              id: tracking.id,
                              deadline: tracking.deadline,
                            ),
                            const SizedBox(height: 16),
                            _SectionCard(
                              title: 'Thông tin đã đăng ký',
                              children: [
                                _InfoRow(
                                  label: 'Tên nhân viên',
                                  value: employeeName,
                                ),
                                _InfoRow(
                                  label: 'Bộ phận',
                                  value: departmentName,
                                ),
                                _InfoRow(
                                  label: 'Người ký chính',
                                  value: employeeSignName,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _InfoRow(
                                        label: 'Số lượng bản',
                                        value: tracking.documentQuantity
                                            ?.toString(),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: _InfoRow(
                                        label: 'Số tờ/bản',
                                        value: tracking.documentTotalPage
                                            ?.toString(),
                                      ),
                                    ),
                                  ],
                                ),

                                _InfoRow(
                                  label: 'Tên công ty',
                                  value: taxCompanyName,
                                  isMultiline: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: FormActions(
                        mode: FormActionMode.edit,
                        onCancel: () => context.pop(),
                        onSave: () => _openEdit(context, hydratedEditItem),
                        saveText: 'Sửa',
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  String? _maybeFormatDate(DateTime? date) {
    if (date == null) return null;
    return _formatDate(date);
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _openEdit(BuildContext context, StampItem item) async {
    if (item.id == null) return;
    final reload = await context.push<bool?>(
      RouteNames.stampAdd,
      extra: StampRoutePayload(
        item: item,
        detail: bloc.state.detailData ?? widget.payload.detail,
        employees: bloc.state.employees,
        sealRegulations: bloc.state.sealRegulations,
        documentTypes: bloc.state.documentTypes,
        taxCompanies: bloc.state.taxCompanies,
      ),
    );
    if (!mounted) return;
    if (reload == true) {
      context.pop(true);
    }
  }

  Future<void> _showDeleteConfirmation(
    BuildContext context,
    StampItem item,
  ) async {
    final confirmed = await DialogService.showConfirmDelete(context: context);
    if (!mounted || !confirmed || item.id == null) return;
    bloc.add(StampEvent.deleteStamp(id: item.id!));
  }
}

class _HeroHeader extends StatelessWidget {
  const _HeroHeader({
    required this.documentName,
    required this.documentTypeName,
    required this.sealFormat,
    required this.statusText,
    required this.statusColor,
    required this.registerDate,
    required this.id,
    this.deadline,
  });

  final String? documentName;
  final String? documentTypeName;
  final String? sealFormat;
  final String statusText;
  final Color statusColor;
  final DateTime? registerDate;
  final DateTime? deadline;
  final int? id;

  @override
  Widget build(BuildContext context) {
    const cardBackground = Colors.white;
    const primaryText = Color(0xFF0F172A);
    const secondaryText = Color(0xFF64748B);
    const borderColor = Color(0xFFE2E8F0);
    const accentBlueBg = Color(0xFFE0F2FE);
    const accentBlueText = Color(0xFF0369A1);
    const accentPurpleBg = Color(0xFFF3E8FF);
    const accentPurpleText = Color(0xFF7E22CE);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cardBackground,
        border: Border.all(color: borderColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x120F172A),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  documentName?.trim().isNotEmpty == true
                      ? documentName!
                      : 'Chưa có tên văn bản',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: primaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.35,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: statusColor.withValues(alpha: 0.20),
                  ),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: accentBlueBg,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Loại văn bản',
                        style: TextStyle(
                          color: secondaryText,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        documentTypeName?.trim().isNotEmpty == true
                            ? documentTypeName!
                            : '--',
                        style: const TextStyle(
                          color: accentBlueText,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: accentPurpleBg,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Quy cách đóng dấu',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: secondaryText,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        sealFormat?.trim().isNotEmpty == true
                            ? sealFormat!
                            : '--',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: accentPurpleText,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  label: 'Ngày đăng ký',
                  value: registerDate != null
                      ? _formatDate(registerDate!)
                      : '--',
                  iconColor: const Color(0xFF0284C7),
                  labelColor: secondaryText,
                  valueColor: primaryText,
                  backgroundColor: const Color(0xFFF8FAFC),
                  borderColor: borderColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _InfoItem(
                  label: 'Đóng dấu gấp',
                  value: deadline != null ? _formatDate(deadline!) : '--',
                  iconColor: const Color(0xFFEA580C),
                  labelColor: secondaryText,
                  valueColor: primaryText,
                  backgroundColor: const Color(0xFFFFF7ED),
                  borderColor: const Color(0xFFFED7AA),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    required this.label,
    required this.value,
    required this.iconColor,
    required this.labelColor,
    required this.valueColor,
    required this.backgroundColor,
    required this.borderColor,
  });

  final String label;
  final String value;
  final Color iconColor;
  final Color labelColor;
  final Color valueColor;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: labelColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    color: valueColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderChip extends StatelessWidget {
  const _HeaderChip({
    required this.icon,
    required this.text,
    required this.colors,
  });

  final IconData icon;
  final String text;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 16, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                height: 1.35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE8ECF4)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 18,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textMain,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.isMultiline = false,
    this.showDivider = true,
  });

  final String label;
  final String? value;
  final bool isMultiline;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final displayValue = (value ?? '').trim().isEmpty
        ? 'Chưa cập nhật'
        : value!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondaryColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            displayValue,
            maxLines: isMultiline ? null : 2,
            overflow: isMultiline ? null : TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              height: 1.45,
              fontWeight: FontWeight.w600,
              color: AppColors.textMain,
            ),
          ),
          if (showDivider) ...[
            const SizedBox(height: 10),
            const Divider(height: 1),
          ],
        ],
      ),
    );
  }
}
