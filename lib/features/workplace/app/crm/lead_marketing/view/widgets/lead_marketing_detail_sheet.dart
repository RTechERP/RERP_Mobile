import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/lead_marketing_model.dart';

/// Bottom sheet hiển thị chi tiết đầy đủ một phiếu lead.
class LeadMarketingDetailSheet extends StatelessWidget {
  const LeadMarketingDetailSheet({super.key, required this.item});

  /// Phiếu lead cần hiển thị chi tiết.
  final LeadMarketingItem item;

  static final _dateFmt = DateFormat('dd/MM/yyyy HH:mm');

  /// Mở bottom sheet chi tiết.
  static Future<void> show(BuildContext context, LeadMarketingItem item) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LeadMarketingDetailSheet(item: item),
    );
  }

  /// Định dạng ngày, trả về '-' nếu không hợp lệ.
  String _formatDate(String? value) {
    if (value == null || value.isEmpty) return '-';
    try {
      return _dateFmt.format(DateTime.parse(value).toLocal());
    } catch (_) {
      return value;
    }
  }

  /// Hiển thị giá trị hoặc '-' khi rỗng.
  String _orDash(String? value) {
    final trimmed = (value ?? '').trim();
    return trimmed.isEmpty ? '-' : trimmed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              children: [
                _buildSection(
                  title: 'Thông tin lead',
                  children: [
                    _detailRow('Mã lead', _orDash(item.leadCode)),
                    _detailRow('Loại lead', _orDash(item.leadTypeName)),
                    _detailRow('Nguồn', _orDash(item.leadSourceName)),
                    _detailRow('Chiến dịch', _orDash(item.campaignName)),
                    _detailRow('Ngày thu thập', _formatDate(item.collectedDate)),
                    _detailRow('Giai đoạn', _orDash(item.stageName)),
                    _detailRow('Đánh giá', _orDash(item.ratingName)),
                  ],
                ),
                const SizedBox(height: 16),
                _buildSection(
                  title: 'Khách hàng',
                  children: [
                    _detailRow(
                      'Tên công ty',
                      _orDash(
                        item.companyName ?? item.customerName,
                      ),
                    ),
                    _detailRow('Mã KH', _orDash(item.customerCode)),
                    _detailRow('MST', _orDash(item.taxCode)),
                    _detailRow('Loại KH', _orDash(item.customerType)),
                    _detailRow('Ngành nghề', _orDash(item.industryName)),
                    _detailRow('Lĩnh vực', _orDash(item.businessFieldName)),
                    _detailRow('Tỉnh/TP', _orDash(item.province)),
                    _detailRow('Địa chỉ', _orDash(item.address)),
                    _detailRow('Website', _orDash(item.website)),
                  ],
                ),
                const SizedBox(height: 16),
                _buildSection(
                  title: 'Liên hệ',
                  children: [
                    _detailRow('Người liên hệ', _orDash(item.contactName)),
                    _detailRow('Chức danh', _orDash(item.contactPosition)),
                    _detailRow('Điện thoại', _orDash(item.contactPhone)),
                    _detailRow('Email', _orDash(item.contactEmail)),
                  ],
                ),
                const SizedBox(height: 16),
                _buildSection(
                  title: 'Phân công',
                  children: [
                    _detailRow(
                      'NV marketing',
                      _orDash(item.marketingEmployeeName),
                    ),
                    _detailRow('NV sale', _orDash(item.saleEmployeeName)),
                    _detailRow('Trưởng nhóm', _orDash(item.handoverLeaderName)),
                    _detailRow('Ngày bàn giao', _formatDate(item.handoverDate)),
                    _detailRow('Ngày phân công', _formatDate(item.assignedDate)),
                    _detailRow('Người phân công', _orDash(item.assignedByName)),
                    _detailRow(
                      'Follow-up tiếp theo',
                      _formatDate(item.nextFollowUpDate),
                    ),
                    _detailRow('Ngày đóng', _formatDate(item.closedDate)),
                  ],
                ),
                const SizedBox(height: 16),
                _buildSection(
                  title: 'Nhu cầu',
                  children: [
                    _detailRow('Mô tả', _orDash(item.needDescription)),
                    _detailRow('Sản phẩm quan tâm', _orDash(item.productInterest)),
                    _detailRow('Ghi chú', _orDash(item.note)),
                  ],
                ),
                const SizedBox(height: 16),
                _buildSection(
                  title: 'Khác',
                  children: [
                    _detailRow('Loại PO', _orDash(item.poTypeName)),
                    _detailRow('Admin sale', _orDash(item.adminSaleName)),
                    _detailRow(
                      'Tổng tiền PO',
                      item.totalMoneyPo == null
                          ? '-'
                          : item.totalMoneyPo!.toStringAsFixed(0),
                    ),
                    _detailRow('Số hoạt động', '${item.activityCount ?? 0}'),
                    _detailRow(
                      'Hoạt động gần nhất',
                      _formatDate(item.lastActivityDate),
                    ),
                    _detailRow('Người tạo', _orDash(item.createdBy)),
                    _detailRow('Ngày tạo', _formatDate(item.createdDate)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Header: mã lead, tên công ty và nút đóng.
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 12, 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.borderColor)),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.line,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _orDash(item.leadCode),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryERP,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  _orDash(item.companyName ?? item.customerName),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                    height: 1.25,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: AppColors.gray, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Một nhóm thông tin trong chi tiết.
  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryERP,
            ),
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  /// Dòng chi tiết dạng `label: value`.
  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, color: AppColors.gray),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.enableText,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
