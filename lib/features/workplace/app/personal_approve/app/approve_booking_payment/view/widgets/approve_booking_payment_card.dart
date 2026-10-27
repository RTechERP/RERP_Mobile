// Card hiển thị một ĐNTT (đề nghị thanh toán) trong màn Duyệt ĐNTT Đặt xe / Nhà nghỉ.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/approve_booking_payment_model.dart';

/// Card một ĐNTT dùng [FormLeftBorderCard]: viền trái xanh khi bước hiện tại
/// đã duyệt, cam khi đang chờ duyệt.
/// Gồm: loại nội dung, loại đề nghị, mã, người đề nghị, phòng ban, lý do,
/// tổng tiền TT, tổng tiền có HĐ, ngày tạo, tình trạng phiếu và ghi chú
/// KTTT / KTT (chỉ hiện khi có nội dung).
class ApproveBookingPaymentCard extends StatelessWidget {
  const ApproveBookingPaymentCard({super.key, required this.item});

  /// Phiếu cần hiển thị.
  final ApproveBookingPaymentItem item;

  static final DateFormat _dateFmt = DateFormat('dd/MM/yyyy');
  static final NumberFormat _moneyFmt = NumberFormat('#,###');

  @override
  Widget build(BuildContext context) {
    final accent = item.currentStepIsApproved == 1
        ? AppColors.success
        : AppColors.warning;
    final typeName = (item.typeName ?? '').trim();
    final requestType = _requestType;
    final reason = (item.reason ?? '').trim();
    final noteKttt = (item.noteKttt ?? '').trim();
    final noteKtt = (item.noteKtt ?? '').trim();

    return FormLeftBorderCard(
      borderColor: accent,
      backgroundColor: AppColors.white,
      borderRadius: const BorderRadius.all(Radius.circular(14)),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Thứ tự chip: tình trạng phiếu → loại nội dung → loại đề nghị.
          // Flexible để 3 chip luôn nằm trên 1 dòng, chip dài tự cắt "...".
          Row(
            children: [
              Flexible(
                child: _Tag(
                  text: item.isApprovedText ?? item.currentStepName ?? '-',
                  color: accent,
                ),
              ),
              if (typeName.isNotEmpty) ...[
                const SizedBox(width: 4),
                Flexible(child: _Tag(text: typeName, color: AppColors.main)),
              ],
              if (requestType != null) ...[
                const SizedBox(width: 4),
                Flexible(
                  child: _Tag(text: requestType.text, color: requestType.color),
                ),
              ],
            ],
          ),
          const SizedBox(height: 10),
          Text(
            item.code ?? '-',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.enableText,
            ),
          ),
          const SizedBox(height: 10),
          _InfoRow(label: 'Người đề nghị', value: item.fullName ?? '-'),
          _InfoRow(label: 'Phòng ban', value: item.departmentName ?? '-'),
          if (reason.isNotEmpty) _InfoRow(label: 'Lý do', value: reason),
          _InfoRow(label: 'Ngày tạo', value: _date(item.createdDate)),
          const SizedBox(height: 8),
          _MoneyBox(
            payment: _money(item.totalPayment),
            invoice: _money(item.totalMoneyWithInvoice),
          ),
          if (noteKttt.isNotEmpty || noteKtt.isNotEmpty) ...[
            const SizedBox(height: 8),
            if (noteKttt.isNotEmpty)
              _NoteBox(label: 'Ghi chú KT', text: noteKttt),
            if (noteKttt.isNotEmpty && noteKtt.isNotEmpty)
              const SizedBox(height: 6),
            if (noteKtt.isNotEmpty)
              _NoteBox(label: 'Ghi chú KTT', text: noteKtt),
          ],
        ],
      ),
    );
  }

  /// Loại đề nghị theo `TypeOrder` của BE: 1 → ĐN tạm ứng (tím),
  /// 2 → ĐNTT quyết toán (xanh dương). Giá trị khác → null (không hiện chip).
  ({String text, Color color})? get _requestType => switch (item.typeOrder) {
        1 => (text: 'ĐN tạm ứng', color: AppColors.purple),
        2 => (text: 'ĐNTT quyết toán', color: AppColors.stateInfoColor),
        _ => null,
      };

  String _money(double? amount) =>
      amount == null ? '-' : '${_moneyFmt.format(amount)} đ';

  String _date(DateTime? d) => d == null ? '-' : _dateFmt.format(d);
}

/// Tag bo tròn: dùng cho loại nội dung và tình trạng phiếu.
class _Tag extends StatelessWidget {
  const _Tag({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

/// Một dòng "nhãn: giá trị" với cột nhãn có độ rộng cố định để các giá trị
/// thẳng hàng.
class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 96,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, color: AppColors.gray),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.enableText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Khối tiền: "Tổng tiền TT" (đỏ) và "Tổng tiền có HĐ" (xanh) cạnh nhau.
class _MoneyBox extends StatelessWidget {
  const _MoneyBox({required this.payment, required this.invoice});

  final String payment;
  final String invoice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: _MoneyCell(
              label: 'Tổng tiền TT',
              value: payment,
              color: AppColors.alert,
            ),
          ),
          Container(width: 1, height: 28, color: AppColors.borderColor),
          const SizedBox(width: 12),
          Expanded(
            child: _MoneyCell(
              label: 'Tổng tiền có HĐ',
              value: invoice,
              color: AppColors.success,
            ),
          ),
        ],
      ),
    );
  }
}

class _MoneyCell extends StatelessWidget {
  const _MoneyCell({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: AppColors.gray),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ],
    );
  }
}

/// Khối ghi chú của kế toán, nền xám nhạt.
class _NoteBox extends StatelessWidget {
  const _NoteBox({required this.label, required this.text});

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.gray,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              height: 1.3,
              color: AppColors.enableText,
            ),
          ),
        ],
      ),
    );
  }
}
