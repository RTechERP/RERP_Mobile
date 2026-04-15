// Date: 15/04/2026 - Dev: admin
// Nội dung/Chức năng: Màn hình chi tiết đăng ký văn phòng phẩm - xem thông tin, trạng thái duyệt, danh sách VPP

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../data/datasource/models/stationery_model.dart';
import '../bloc/stationery_bloc.dart';
import '../widgets/stationery_detail_card.dart';

/// Màn hình chi tiết đăng ký văn phòng phẩm.
///
/// Nhận [StationeryItem] từ route extra, load chi tiết từ API.
class StationeryDetailScreen extends StatefulWidget {
  const StationeryDetailScreen({super.key, required this.item});

  final StationeryItem item;

  @override
  State<StationeryDetailScreen> createState() => _StationeryDetailScreenState();
}

class _StationeryDetailScreenState
    extends
        BaseState<
          StationeryDetailScreen,
          StationeryEvent,
          StationeryState,
          StationeryBloc
        > {
  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  static final DateFormat _dateTimeFormat = DateFormat('HH:mm - dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    bloc.loadDetail(widget.item);
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<StationeryBloc, StationeryState>(
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Chi tiết đăng ký VPP'),
            onBackTap: () => onBack(context),
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, StationeryState state) {
    if (state.status == BaseStateStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card thông tin người đăng ký & trạng thái
          _buildInfoCard(context),

          const SizedBox(height: 16),

          // Card trạng thái duyệt
          _buildApprovalCard(context),

          const SizedBox(height: 16),

          // Danh sách VPP
          if (state.stationeryDetail.isNotEmpty) ...[
            _buildSupplySection(context, state),
          ],
        ],
      ),
    );
  }

  /// Card thông tin người đăng ký.
  Widget _buildInfoCard(BuildContext context) {
    final item = widget.item;
    final dateRequestDisplay = item.dateRequest != null
        ? _dateFormat.format(item.dateRequest!)
        : '-';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Icon(
                  Icons.person_outline,
                  color: AppColors.primaryERP,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.userName ?? '-',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.departmentName ?? '-',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.gray,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              _StatusBadge(
                label: _approvalLabel(item),
                color: _approvalColor(item),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(color: AppColors.borderColor, height: 1),
          const SizedBox(height: 12),
          _InfoLine(
            icon: Icons.calendar_today_outlined,
            label: 'Ngày đăng ký',
            value: dateRequestDisplay,
          ),
          const SizedBox(height: 8),
          _InfoLine(
            icon: Icons.badge_outlined,
            label: 'Mã nhân viên',
            value: '${item.employeeIdRequest ?? '-'}',
          ),
        ],
      ),
    );
  }

  /// Card trạng thái duyệt (TBP + Admin).
  Widget _buildApprovalCard(BuildContext context) {
    final item = widget.item;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trạng thái phê duyệt',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 14),

          // Duyệt TBP
          _ApprovalRow(
            label: 'Trưởng phòng (TBP)',
            approverName: item.fullNameApproved ?? 'Chưa duyệt',
            dateApprove: item.dateApproved != null
                ? _dateTimeFormat.format(item.dateApproved!)
                : '-',
            isApproved: item.isApproved ?? false,
          ),

          const SizedBox(height: 12),
          Divider(color: AppColors.borderColor, height: 1),
          const SizedBox(height: 12),

          // Duyệt Admin
          _ApprovalRow(
            label: 'Quản trị (Admin)',
            approverName: item.adminApprovedId != null
                ? 'Đã duyệt'
                : 'Chưa duyệt',
            dateApprove: item.dateAdminApproved != null
                ? _dateTimeFormat.format(item.dateAdminApproved!)
                : '-',
            isApproved: item.isAdminApproved ?? false,
          ),
        ],
      ),
    );
  }

  /// Section danh sách VPP (dùng fake data tạm thời).
  Widget _buildSupplySection(BuildContext context, StationeryState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Danh sách văn phòng phẩm',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        ...state.stationeryDetail.asMap().entries.map((entry) {
          return StationeryDetailCard(item: entry.value, index: entry.key);
        }),
      ],
    );
  }

  String _approvalLabel(StationeryItem item) {
    if (item.isAdminApproved == true) return 'Đã duyệt';
    if (item.isApproved == true) return 'TBP duyệt';
    return 'Chờ duyệt';
  }

  Color _approvalColor(StationeryItem item) {
    if (item.isAdminApproved == true) return AppColors.success;
    if (item.isApproved == true) return AppColors.stateInfoColor;
    return AppColors.warning;
  }
}

/// Dòng phê duyệt: label + người duyệt + thời gian + icon.
class _ApprovalRow extends StatelessWidget {
  const _ApprovalRow({
    required this.label,
    required this.approverName,
    required this.dateApprove,
    required this.isApproved,
  });

  final String label;
  final String approverName;
  final String dateApprove;
  final bool isApproved;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isApproved ? Icons.check_circle : Icons.pending_outlined,
          size: 20,
          color: isApproved ? AppColors.success : AppColors.gray,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.gray,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                approverName,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Ngày duyệt',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.gray,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              dateApprove,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Label trạng thái.
class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.55)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

/// Dòng thông tin label + value.
class _InfoLine extends StatelessWidget {
  const _InfoLine({
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
        Icon(icon, size: 16, color: AppColors.gray),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.gray,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
