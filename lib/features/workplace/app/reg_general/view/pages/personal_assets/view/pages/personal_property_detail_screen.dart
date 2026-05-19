// Date: 15/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình chi tiết biên bản bàn giao / thu hồi tài sản

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/personal_asset_model.dart';
import '../bloc/personal_asset_bloc.dart';

class PersonalPropertyDetailScreen extends StatefulWidget {
  const PersonalPropertyDetailScreen({
    super.key,
    required this.item,
  });

  final PersonalPropertyItem item;

  @override
  State<PersonalPropertyDetailScreen> createState() =>
      _PersonalPropertyDetailScreenState();
}

class _PersonalPropertyDetailScreenState
    extends State<PersonalPropertyDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PersonalAssetBloc>().add(
            PersonalAssetEvent.fetchPropertyDetail(
              assetId: widget.item.assetId ?? 0,
              assetCategory: widget.item.assetCategory ?? 0,
            ),
          );
    });
  }

  _ApproveStatus _headerStatus() {
    final personal = widget.item.isApprovedPersonalProperty ?? false;
    final accountant = widget.item.isApproveAccountant ?? false;

    if (personal && accountant) {
      return _ApproveStatus('Đã duyệt', AppColors.stateSuccessColor);
    }
    if (personal) {
      return _ApproveStatus('Chờ Kế toán', AppColors.stateWarningColor);
    }
    return _ApproveStatus('Chờ duyệt', AppColors.stateInfoColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.heading, size: 20),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Chi tiết biên bản',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.heading,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: AppColors.borderColor, height: 1),
        ),
      ),
      body: BlocBuilder<PersonalAssetBloc, PersonalAssetState>(
        builder: (context, state) {
          final details = state.propertyDetailItems;
          final loading = state.isDetailLoading;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Header: Thông tin biên bản ---
                _HeaderCard(
                  item: widget.item,
                  headerStatus: _headerStatus(),
                  departmentId: state.departmentId,
                  onApprove: (approveType) {
                    context.read<PersonalAssetBloc>().add(
                          PersonalAssetEvent.approveProperty(
                            deliverId: widget.item.deliverId ?? 0,
                            assetId: widget.item.assetId ?? 0,
                            approveType: approveType,
                          ),
                        );
                  },
                  isApproving: state.isApproving,
                ),
                const SizedBox(height: 16),

                // --- Chi tiết cấp phát ---
                _AssetDetailSection(
                  title: 'Chi tiết cấp phát: ${widget.item.assetCode}',
                  items: details,
                  isLoading: loading,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Header Card - Thông tin biên bản bàn giao
// ---------------------------------------------------------------------------

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({
    required this.item,
    required this.headerStatus,
    required this.onApprove,
    required this.isApproving,
    required this.departmentId,
  });

  final PersonalPropertyItem item;
  final _ApproveStatus headerStatus;
  final void Function(int approveType) onApprove;
  final bool isApproving;
  final int? departmentId;

  static final _dateFmt = DateFormat('dd/MM/yyyy');

  String _formatDate(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.heading.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // --- Mã biên bản + Trạng thái ---
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.description_rounded,
                    color: AppColors.primaryERP,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.assetCode ?? '',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.heading,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.assetCategoryText ?? '—',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: headerStatus.color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: headerStatus.color.withValues(alpha: 0.4),
                      width: 0.8,
                    ),
                  ),
                  child: Text(
                    headerStatus.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: headerStatus.color,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: AppColors.borderColor),

          // --- Thông tin giao/nhận ---
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.person_outline,
                  label: 'Người giao',
                  value: item.deliverName ?? '—',
                ),
                _InfoRow(
                  icon: Icons.work_outline,
                  label: 'Chức vụ',
                  value: item.possitionDeliver ?? '—',
                ),
                _InfoRow(
                  icon: Icons.business_outlined,
                  label: 'Phòng giao',
                  value: item.departmentDeliver ?? '—',
                ),
                _InfoRow(
                  icon: Icons.person_pin_circle_outlined,
                  label: 'Người nhận',
                  value: item.receiverName ?? '—',
                ),
                _InfoRow(
                  icon: Icons.work,
                  label: 'Chức vụ',
                  value: item.possitionReceiver ?? '—',
                ),
                _InfoRow(
                  icon: Icons.business,
                  label: 'Phòng nhận',
                  value: item.departmentReceiver ?? '—',
                ),
                _InfoRow(
                  icon: Icons.calendar_today_outlined,
                  label: 'Ngày bàn giao',
                  value: _formatDate(item.implementationDate),
                ),
                if (item.assetNote != null && item.assetNote!.isNotEmpty)
                  _InfoRow(
                    icon: Icons.note_outlined,
                    label: 'Lý do',
                    value: item.assetNote!,
                  ),
              ],
            ),
          ),

          const Divider(height: 1, color: AppColors.borderColor),

          // --- Trạng thái duyệt ---
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Trạng thái duyệt',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _ApproveChip(
                      label: 'Bản thân',
                      isApproved: item.isApprovedPersonalProperty ?? false,
                      isApproving: isApproving,
                      showButton: !(item.isApprovedPersonalProperty ?? false),
                      onApprove: () => onApprove(1),
                    ),
                    const SizedBox(width: 10),
                    _ApproveChip(
                      label: 'HR',
                      isApproved: item.isApproved ?? false,
                      isApproving: isApproving,
                      showButton: departmentId == 6 && !(item.isApproved ?? false),
                      onApprove: () => onApprove(3),
                    ),
                    const SizedBox(width: 10),
                    _ApproveChip(
                      label: 'Kế toán',
                      isApproved: item.isApproveAccountant ?? false,
                      isApproving: isApproving,
                      showButton:
                          departmentId == 5 && !(item.isApproveAccountant ?? false),
                      onApprove: () => onApprove(2),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Approve Chip
// ---------------------------------------------------------------------------

class _ApproveChip extends StatelessWidget {
  const _ApproveChip({
    required this.label,
    required this.isApproved,
    required this.isApproving,
    required this.showButton,
    required this.onApprove,
  });

  final String label;
  final bool isApproved;
  final bool isApproving;
  final bool showButton;
  final VoidCallback onApprove;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: isApproved
              ? AppColors.stateSuccessColor.withValues(alpha: 0.08)
              : AppColors.bgCard,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isApproved
                ? AppColors.stateSuccessColor.withValues(alpha: 0.3)
                : AppColors.borderColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  isApproved ? Icons.check_circle : Icons.pending_outlined,
                  size: 16,
                  color: isApproved ? AppColors.stateSuccessColor : AppColors.gray,
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color:
                          isApproved ? AppColors.stateSuccessColor : AppColors.heading,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            if (showButton) ...[
              const SizedBox(height: 6),
              SizedBox(
                height: 26,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: isApproving ? null : onApprove,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    minimumSize: Size.zero,
                    side:
                        const BorderSide(color: AppColors.primaryERP, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: isApproving
                      ? const SizedBox(
                          width: 12,
                          height: 12,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primaryERP,
                          ),
                        )
                      : const Text(
                          'Duyệt',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryERP,
                          ),
                        ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Info Row
// ---------------------------------------------------------------------------

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.gray),
          const SizedBox(width: 10),
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, color: AppColors.gray),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.heading,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Asset Detail Section
// ---------------------------------------------------------------------------

class _AssetDetailSection extends StatelessWidget {
  const _AssetDetailSection({
    required this.title,
    required this.items,
    required this.isLoading,
  });

  final String title;
  final List<DetailPersonalPropertyItem> items;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Section title ---
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.primaryERP,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                ),
              ),
              if (items.isNotEmpty) ...[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${items.length}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryERP,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),

        if (isLoading)
          _LoadingItem()
        else if (items.isEmpty)
          _EmptyItem()
        else
          ...items.map((e) => _AssetDetailCard(item: e)),
      ],
    );
  }
}

class _LoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.primaryERP,
        ),
      ),
    );
  }
}

class _EmptyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: const Center(
        child: Text(
          'Không có chi tiết tài sản',
          style: TextStyle(fontSize: 13, color: AppColors.gray),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Asset Detail Card
// ---------------------------------------------------------------------------

class _AssetDetailCard extends StatelessWidget {
  const _AssetDetailCard({required this.item});

  final DetailPersonalPropertyItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: Column(
        children: [
          // --- Header ---
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryERP.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '${item.stt}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondaryERP,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.tsAssetName ?? '—',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.heading,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (item.tsCodeNcc != null)
                        Text(
                          item.tsCodeNcc!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.gray,
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.stateInfoColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'x${item.quantity}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.stateInfoColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: AppColors.borderColor),

          // --- Info rows ---
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                _SubInfoRow(
                  icon: Icons.straighten_rounded,
                  label: 'Đơn vị',
                  value: item.unitName ?? '—',
                ),
                const SizedBox(height: 8),
                _SubInfoRow(
                  icon: Icons.circle,
                  label: 'Tình trạng',
                  value: item.status ?? '—',
                ),
                if (item.note != null && item.note!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  _SubInfoRow(
                    icon: Icons.note_outlined,
                    label: 'Ghi chú',
                    value: item.note!,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SubInfoRow extends StatelessWidget {
  const _SubInfoRow({
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
        const SizedBox(width: 8),
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(fontSize: 12.5, color: AppColors.gray),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Approve Status
// ---------------------------------------------------------------------------

class _ApproveStatus {
  const _ApproveStatus(this.label, this.color);
  final String label;
  final Color color;
}
