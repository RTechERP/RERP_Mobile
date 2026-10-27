// BottomSheet chi tiết một ĐNTT Đặt xe / Nhà nghỉ.
// Bố cục 3 tab: Chi tiết (tóm tắt + từng dòng), Chứng từ (ảnh hoá đơn / bill
// CK) và Lịch sử (timeline duyệt). Dữ liệu lấy từ get-by-id và get-logs.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../features/auth/data/repository/auth_repository.dart';
import '../../data/datasource/models/approve_booking_payment_model.dart';
import '../bloc/approve_booking_payment_bloc.dart';

final DateFormat _dateTimeFmt = DateFormat('dd/MM/yyyy HH:mm');
final DateFormat _dateFmt = DateFormat('dd/MM/yyyy');
final NumberFormat _moneyFmt = NumberFormat('#,###');

String _money(double? amount) =>
    amount == null ? '-' : '${_moneyFmt.format(amount)} đ';

bool _has(String? s) => (s ?? '').trim().isNotEmpty;

String? _date(DateTime? d) => d == null ? null : _dateFmt.format(d);

/// Sao chép [value] vào clipboard và báo `Đã sao chép "[label]"`.
void _copy(BuildContext context, String label, String value) {
  Clipboard.setData(ClipboardData(text: value));
  context.showMessage('Đã sao chép $label');
}

/// Mở BottomSheet chi tiết của [item]. Dùng chung [ApproveBookingPaymentBloc]
/// của màn danh sách và tự tải dữ liệu khi mở.
Future<void> showApproveBookingPaymentDetailSheet(
  BuildContext context,
  ApproveBookingPaymentBloc bloc,
  ApproveBookingPaymentItem item,
) {
  bloc.add(
    ApproveBookingPaymentEvent.loadDetail(
      item.id,
      isAccommodation: item.isAccommodation,
    ),
  );
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (_) => BlocProvider.value(
      value: bloc,
      child: _DetailSheet(item: item),
    ),
  );
}

/// Khung sheet: phần đầu (mã, trạng thái, tóm tắt tiền) lấy từ [item] nên hiện
/// ngay, phần thân 3 tab chờ dữ liệu từ bloc.
class _DetailSheet extends StatefulWidget {
  const _DetailSheet({required this.item});

  final ApproveBookingPaymentItem item;

  @override
  State<_DetailSheet> createState() => _DetailSheetState();
}

class _DetailSheetState extends State<_DetailSheet> {
  /// Header Authorization để tải ảnh từ API download-file.
  Map<String, String> _headers = const {};

  @override
  void initState() {
    super.initState();
    AuthRepository.getToken().then((token) {
      if (!mounted || token == null || token.isEmpty) return;
      setState(() => _headers = {'Authorization': 'Bearer $token'});
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.92;
    return DefaultTabController(
      length: 3,
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child:
              BlocBuilder<
                ApproveBookingPaymentBloc,
                ApproveBookingPaymentState
              >(
                builder: (context, state) {
                  final files = _allFiles(state.detail);
                  return Column(
                    children: [
                      _Header(item: widget.item),
                      _Tabs(
                        fileCount: files.length,
                        logCount: state.logs.length,
                      ),
                      Expanded(
                        child: _Body(
                          state: state,
                          item: widget.item,
                          headers: _headers,
                        ),
                      ),
                    ],
                  );
                },
              ),
        ),
      ),
    );
  }

  /// Gom tất cả file của mọi dòng chi tiết để đếm trên tab.
  List<ApproveBookingPaymentFile> _allFiles(ApproveBookingPaymentDetail? d) =>
      d == null ? const [] : [for (final l in d.details) ...l.files];
}

/// Phần đầu sheet: thanh kéo, mã phiếu (chạm để sao chép), nút đóng, các tag
/// trạng thái và khối tóm tắt người đề nghị + tiền.
class _Header extends StatelessWidget {
  const _Header({required this.item});

  final ApproveBookingPaymentItem item;

  @override
  Widget build(BuildContext context) {
    final accent = item.currentStepIsApproved == 1
        ? AppColors.success
        : AppColors.warning;
    final code = item.code ?? '-';

    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.line,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => _copy(context, 'Mã phiếu', code),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            code,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: AppColors.enableText,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.copy_rounded,
                          size: 15,
                          color: AppColors.gray,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                tooltip: 'Đóng',
                visualDensity: VisualDensity.compact,
                style: IconButton.styleFrom(backgroundColor: AppColors.bgCard),
                icon: const Icon(
                  Icons.close_rounded,
                  color: AppColors.iconColor,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _Chip(
                text: item.isApprovedText ?? item.currentStepName ?? '-',
                color: accent,
              ),
              if (_has(item.typeName))
                _Chip(text: item.typeName!.trim(), color: AppColors.main),
            ],
          ),
          const SizedBox(height: 12),
          _Summary(item: item),
        ],
      ),
    );
  }
}

/// Chip bo tròn nền nhạt, dùng cho trạng thái và loại phiếu.
class _Chip extends StatelessWidget {
  const _Chip({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

/// Tóm tắt: người đề nghị + phòng ban + ngày tạo, kèm 2 ô tiền nổi bật.
class _Summary extends StatelessWidget {
  const _Summary({required this.item});

  final ApproveBookingPaymentItem item;

  @override
  Widget build(BuildContext context) {
    final meta = [
      if (_has(item.departmentName)) item.departmentName!.trim(),
      if (_date(item.createdDate) != null) _date(item.createdDate)!,
    ].join(' • ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.colorMainSecondary,
              child: const Icon(
                Icons.person_rounded,
                size: 20,
                color: AppColors.main,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.fullName ?? '-',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.enableText,
                    ),
                  ),
                  if (meta.isNotEmpty)
                    Text(
                      meta,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.gray,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        // Phiếu Công tác phí hiện số tiền ở từng dòng chi tiết nên bỏ 2 ô tổng.
        if (!item.isAccommodation) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _MoneyTile(
                  label: 'Tổng tiền TT',
                  value: _money(item.totalPayment),
                  color: AppColors.alert,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MoneyTile(
                  label: 'Tổng tiền có HĐ',
                  value: _money(item.totalMoneyWithInvoice),
                  color: AppColors.success,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

/// Ô tiền nền theo màu chủ đạo (nhạt), số tiền in đậm.
class _MoneyTile extends StatelessWidget {
  const _MoneyTile({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: AppColors.gray),
          ),
          const SizedBox(height: 2),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Thanh tab; số lượng chứng từ / lịch sử hiện cạnh tên tab khi > 0.
class _Tabs extends StatelessWidget {
  const _Tabs({required this.fileCount, required this.logCount});

  final int fileCount;
  final int logCount;

  @override
  Widget build(BuildContext context) {
    String label(String name, int n) => n > 0 ? '$name ($n)' : name;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.borderColor)),
      ),
      child: TabBar(
        labelColor: AppColors.primaryERP,
        unselectedLabelColor: AppColors.gray,
        indicatorColor: AppColors.primaryERP,
        indicatorWeight: 3,
        labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        tabs: [
          const Tab(text: 'Chi tiết'),
          Tab(text: label('Files', fileCount)),
          Tab(text: label('Lịch sử', logCount)),
        ],
      ),
    );
  }
}

/// Thân sheet: loading / lỗi (có thử lại) hoặc 3 tab nội dung.
class _Body extends StatelessWidget {
  const _Body({required this.state, required this.item, required this.headers});

  final ApproveBookingPaymentState state;
  final ApproveBookingPaymentItem item;
  final Map<String, String> headers;

  @override
  Widget build(BuildContext context) {
    final detail = state.detail;
    if (!state.isLoadingDetail && state.detailError != null) {
      return _ErrorView(
        message: _has(state.detailError)
            ? state.detailError!.trim()
            : 'Không thể tải chi tiết phiếu',
        onRetry: () => context.read<ApproveBookingPaymentBloc>().add(
          ApproveBookingPaymentEvent.loadDetail(
            item.id,
            isAccommodation: item.isAccommodation,
          ),
        ),
      );
    }
    if (detail == null || state.isLoadingDetail) {
      return const Center(child: CircularProgressIndicator());
    }

    return TabBarView(
      children: [
        _InfoTab(item: item, detail: detail),
        _FilesTab(detail: detail, headers: headers),
        _LogsTab(logs: state.logs),
      ],
    );
  }
}

/// Trạng thái lỗi tải chi tiết, kèm nút thử lại.
class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 48,
              color: AppColors.alert,
            ),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Thử lại'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Thẻ trắng bo góc dùng chung cho các khối trong tab.
class _Card extends StatelessWidget {
  const _Card({required this.child, this.title, this.icon});

  final Widget child;
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 18, color: AppColors.main),
                  const SizedBox(width: 6),
                ],
                Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
          child,
        ],
      ),
    );
  }
}

/// Dòng "nhãn / giá trị" xếp dọc (nhãn nhỏ phía trên) để giá trị dài không bị
/// bóp. Ẩn hoàn toàn khi [value] rỗng. [copyable] cho chạm vào để sao chép.
class _Field extends StatelessWidget {
  const _Field({
    required this.label,
    required this.value,
    this.copyable = false,
  });

  final String label;
  final String? value;
  final bool copyable;

  @override
  Widget build(BuildContext context) {
    if (!_has(value)) return const SizedBox.shrink();
    final text = value!.trim();
    final content = Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 11, color: AppColors.gray),
                ),
                const SizedBox(height: 2),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: AppColors.enableText,
                  ),
                ),
              ],
            ),
          ),
          if (copyable)
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 10),
              child: Icon(Icons.copy_rounded, size: 16, color: AppColors.main),
            ),
        ],
      ),
    );
    if (!copyable) return content;
    return InkWell(onTap: () => _copy(context, label, text), child: content);
  }
}

/// Tab "Chi tiết": mỗi dòng chi tiết một thẻ gồm hành trình (phương tiện) hoặc
/// nhà nghỉ + ngày lưu trú (công tác phí), lý do, ghi chú, thụ hưởng, công ty
/// vận chuyển và khối tiền.
class _InfoTab extends StatelessWidget {
  const _InfoTab({required this.item, required this.detail});

  final ApproveBookingPaymentItem item;
  final ApproveBookingPaymentDetail detail;

  /// "Đã tiếp nhận • 15/10/2026" hoặc chỉ nhãn khi chưa có ngày.
  String _stamp(String label, DateTime? date) =>
      date == null ? label : '$label • ${_dateFmt.format(date)}';

  @override
  Widget build(BuildContext context) {
    final multi = detail.details.length > 1;
    final received = detail.isReceived == true;
    final paid = detail.isPaid == true;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Chỉ hiện khi phiếu đã được tiếp nhận / thanh toán.
        if (received || paid) ...[
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              if (received)
                _Chip(
                  text: _stamp('Đã tiếp nhận', detail.receivedDate),
                  color: AppColors.stateInfoColor,
                ),
              if (paid)
                _Chip(
                  text: _stamp('Đã thanh toán', detail.paidDate),
                  color: AppColors.success,
                ),
            ],
          ),
          const SizedBox(height: 12),
        ],
        for (var i = 0; i < detail.details.length; i++) ...[
          if (i > 0) const SizedBox(height: 12),
          _LineCard(
            line: detail.details[i],
            title: multi ? 'Dòng chi tiết #${i + 1}' : 'Chi tiết thanh toán',
            isAccommodation: item.isAccommodation,
            reason: item.reason,
            note: detail.note,
            deadline: _date(detail.deadline),
          ),
        ],
      ],
    );
  }
}

/// Thẻ một dòng chi tiết. Tiền hiện ở cuối thẻ trong khối nền nhạt.
/// Lý do và ghi chú tự giãn theo độ dài văn bản.
class _LineCard extends StatelessWidget {
  const _LineCard({
    required this.line,
    required this.title,
    required this.isAccommodation,
    this.reason,
    this.note,
    this.deadline,
  });

  final ApproveBookingPaymentDetailLine line;
  final String title;

  /// `true` với phiếu Công tác phí (nhà nghỉ): hiện khách sạn + ngày lưu trú
  /// thay cho loại chuyến, hành trình và công ty vận chuyển.
  final bool isAccommodation;

  /// Lý do / ghi chú của cả phiếu, dùng khi dòng chi tiết không có riêng.
  final String? reason;
  final String? note;

  /// Hạn thanh toán của phiếu (đã định dạng ngày).
  final String? deadline;

  /// Loại chuyến theo cờ `IsChunDongPhuongTien` (chỉ phiếu phương tiện).
  String get _tripType =>
      line.isChunDongPhuongTien == true ? 'Chủ động phương tiện' : 'Đặt xe';

  /// Hình thức theo `TransferType` (hiện BE chỉ có 1 = chuyển khoản cá nhân).
  String? get _transferType => switch (line.transferType) {
    1 => 'Chuyển khoản cá nhân',
    null => null,
    final t => 'Loại $t',
  };

  /// "16/10/2026 - 24/10/2026"; chỉ hiện một ngày khi thiếu một mốc.
  String? get _stayRange {
    final from = _date(line.checkInDate);
    final to = _date(line.checkOutDate);
    if (from == null || to == null) return from ?? to;
    return '$from - $to';
  }

  @override
  Widget build(BuildContext context) {
    final hasRoute =
        !isAccommodation &&
        (_has(line.startLocation) || _has(line.endLocation));
    return _Card(
      title: title,
      icon: Icons.receipt_long_rounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              if (!isAccommodation)
                _Chip(text: _tripType, color: AppColors.purple),
              if (_transferType != null)
                _Chip(text: _transferType!, color: AppColors.stateInfoColor),
            ],
          ),
          const SizedBox(height: 12),
          if (hasRoute)
            _Route(start: line.startLocation, end: line.endLocation),
          if (isAccommodation) ...[
            _Field(label: 'Khách sạn', value: line.hotelName),
            _Field(label: 'Check in - Check out', value: _stayRange),
          ],
          _Field(label: 'Mã dự án', value: line.projectCode),
          _Field(
            label: 'Lý do',
            value: _has(line.reason) ? line.reason : reason,
          ),
          if (!isAccommodation)
            _Field(
              label: 'Ghi chú',
              value: _has(line.note) ? line.note : note,
            ),
          // _Field(label: 'Hạn thanh toán', value: deadline),
          const _Sep(),
          _Field(label: 'Người thụ hưởng', value: line.recipientName),
          _Field(label: 'Ngân hàng', value: line.bankName),
          _Field(
            label: 'Số tài khoản',
            value: line.bankAccount,
            copyable: true,
          ),
          if (_has(line.transportCompanyName) ||
              _has(line.transportCompanyTaxCode) ||
              _has(line.companyName) ||
              _has(line.invoiceNumber)) ...[
            const _Sep(),
            if (!isAccommodation) ...[
              _Field(
                label: 'Công ty vận chuyển',
                value: line.transportCompanyName,
              ),
              _Field(
                label: 'Mã số thuế',
                value: line.transportCompanyTaxCode,
                copyable: true,
              ),
            ],
            _Field(label: 'Công ty', value: line.companyName),
            _Field(
              label: 'Số hoá đơn',
              value: line.invoiceNumber,
              copyable: true,
            ),
          ],
          const SizedBox(height: 2),
          _LineMoney(line: line, isAccommodation: isAccommodation),
        ],
      ),
    );
  }
}

/// Đường kẻ mảnh ngăn các nhóm thông tin trong thẻ.
class _Sep extends StatelessWidget {
  const _Sep();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Divider(height: 1, color: AppColors.borderColor),
    );
  }
}

/// Hành trình điểm đi → điểm đến, vẽ dạng hai chấm nối bằng đường dọc.
class _Route extends StatelessWidget {
  const _Route({required this.start, required this.end});

  final String? start;
  final String? end;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          _RoutePoint(
            text: start,
            color: AppColors.success,
            label: 'Điểm đi',
            isLast: !_has(end),
          ),
          if (_has(end))
            _RoutePoint(
              text: end,
              color: AppColors.alert,
              label: 'Điểm đến',
              isLast: true,
            ),
        ],
      ),
    );
  }
}

class _RoutePoint extends StatelessWidget {
  const _RoutePoint({
    required this.text,
    required this.color,
    required this.label,
    required this.isLast,
  });

  final String? text;
  final Color color;
  final String label;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    if (!_has(text)) return const SizedBox.shrink();
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 20,
            child: Column(
              children: [
                const SizedBox(height: 4),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                if (!isLast)
                  Expanded(child: Container(width: 2, color: AppColors.line)),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(fontSize: 11, color: AppColors.gray),
                  ),
                  Text(
                    text!.trim(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.enableText,
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
}

/// Khối tiền của một dòng. Phiếu phương tiện: "Thành tiền" (`AmountBeforeVAT`)
/// nổi bật, kèm tổng tiền (`TotalAmount`) và tổng tiền có HĐ
/// (`TotalAmountWithInvoice`). Phiếu Công tác phí chỉ hiện "Số tiền"
/// (`TotalAmount`) và "Thành tiền (Trước VAT)".
class _LineMoney extends StatelessWidget {
  const _LineMoney({required this.line, required this.isAccommodation});

  final ApproveBookingPaymentDetailLine line;
  final bool isAccommodation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _MoneyLine(
            label: 'Thành tiền (Trước VAT)',
            value: _money(line.amountBeforeVat),
            color: AppColors.alert,
            big: true,
          ),
          const SizedBox(height: 8),
          _MoneyLine(
            label: isAccommodation ? 'Số tiền' : 'Tổng tiền',
            value: _money(line.totalAmount),
            color: AppColors.enableText,
          ),
          if (!isAccommodation) ...[
            const SizedBox(height: 6),
            _MoneyLine(
              label: 'Tổng tiền có HĐ',
              value: _money(line.totalAmountWithInvoice),
              color: AppColors.success,
            ),
          ],
        ],
      ),
    );
  }
}

class _MoneyLine extends StatelessWidget {
  const _MoneyLine({
    required this.label,
    required this.value,
    required this.color,
    this.big = false,
  });

  final String label;
  final String value;
  final Color color;
  final bool big;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: big ? 13 : 12,
              fontWeight: big ? FontWeight.w600 : FontWeight.w400,
              color: big ? AppColors.enableText : AppColors.gray,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: big ? 17 : 13,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
      ],
    );
  }
}

/// Tab "Chứng từ": hoá đơn và bill chuyển khoản. Ảnh hiện dạng lưới 3 cột (chạm
/// để xem full-screen), file khác (xlsx, pdf...) hiện thành dòng để tải về.
/// File có `FileType == 'INVOICE'` là hoá đơn, còn lại (`BILL_CK`) là bill.
class _FilesTab extends StatelessWidget {
  const _FilesTab({required this.detail, required this.headers});

  final ApproveBookingPaymentDetail detail;
  final Map<String, String> headers;

  @override
  Widget build(BuildContext context) {
    final files = [for (final l in detail.details) ...l.files];
    if (files.isEmpty) {
      return const _Empty(
        icon: Icons.image_not_supported_outlined,
        text: 'Phiếu chưa có chứng từ đính kèm',
      );
    }
    final invoices = files.where((f) => f.fileType == 'INVOICE').toList();
    final bills = files.where((f) => f.fileType != 'INVOICE').toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (invoices.isNotEmpty)
          _FileGroup(
            title: 'Hoá đơn',
            icon: Icons.description_outlined,
            files: invoices,
            headers: headers,
          ),
        if (invoices.isNotEmpty && bills.isNotEmpty) const SizedBox(height: 12),
        if (bills.isNotEmpty)
          _FileGroup(
            title: 'Bill chuyển khoản',
            icon: Icons.account_balance_outlined,
            files: bills,
            headers: headers,
          ),
      ],
    );
  }
}

class _FileGroup extends StatelessWidget {
  const _FileGroup({
    required this.title,
    required this.icon,
    required this.files,
    required this.headers,
  });

  final String title;
  final IconData icon;
  final List<ApproveBookingPaymentFile> files;
  final Map<String, String> headers;

  @override
  Widget build(BuildContext context) {
    final images = files.where(_isImage).toList();
    final docs = files.where((f) => !_isImage(f)).toList();
    return _Card(
      title: '$title (${files.length})',
      icon: icon,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (images.isNotEmpty)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, i) => GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    fullscreenDialog: true,
                    builder: (_) => _ImageViewer(
                      files: images,
                      initialIndex: i,
                      headers: headers,
                    ),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ColoredBox(
                    color: AppColors.bgCard,
                    child: _NetworkImage(
                      url: images[i].url,
                      headers: headers,
                      fit: BoxFit.cover,
                      iconSize: 28,
                    ),
                  ),
                ),
              ),
            ),
          if (images.isNotEmpty && docs.isNotEmpty) const SizedBox(height: 8),
          for (final f in docs) _DocTile(file: f, headers: headers),
        ],
      ),
    );
  }
}

const _imageExts = {'png', 'jpg', 'jpeg', 'gif', 'webp', 'bmp', 'heic'};

/// Đuôi file viết thường của [f.fileName], rỗng nếu không có.
String _ext(ApproveBookingPaymentFile f) {
  final name = f.fileName ?? '';
  final dot = name.lastIndexOf('.');
  return dot < 0 ? '' : name.substring(dot + 1).toLowerCase();
}

/// File xem được bằng `Image.network` (theo đuôi file).
bool _isImage(ApproveBookingPaymentFile f) => _imageExts.contains(_ext(f));

/// Dung lượng dạng "72 KB" / "1.2 MB"; null nếu không có.
String? _size(int? bytes) {
  if (bytes == null) return null;
  if (bytes < 1024 * 1024) return '${(bytes / 1024).ceil()} KB';
  return '${(bytes / 1024 / 1024).toStringAsFixed(1)} MB';
}

/// Dòng file không phải ảnh (xlsx, pdf, docx...): icon theo đuôi, tên, dung
/// lượng. Chạm để tải về (kèm token) rồi mở hộp chia sẻ / mở bằng app khác.
class _DocTile extends StatefulWidget {
  const _DocTile({required this.file, required this.headers});

  final ApproveBookingPaymentFile file;
  final Map<String, String> headers;

  @override
  State<_DocTile> createState() => _DocTileState();
}

class _DocTileState extends State<_DocTile> {
  bool _loading = false;

  IconData get _icon => switch (_ext(widget.file)) {
    'xls' || 'xlsx' || 'csv' => Icons.table_chart_rounded,
    'pdf' => Icons.picture_as_pdf_rounded,
    'doc' || 'docx' => Icons.article_rounded,
    _ => Icons.insert_drive_file_rounded,
  };

  /// Tải file về thư mục tạm bằng token hiện tại rồi chia sẻ / mở.
  Future<void> _open() async {
    final url = widget.file.url;
    if (_loading || !_has(url)) return;
    final box = context.findRenderObject() as RenderBox?;
    final origin = box == null
        ? null
        : box.localToGlobal(Offset.zero) & box.size;
    setState(() => _loading = true);
    try {
      final dir = await getTemporaryDirectory();
      final path = '${dir.path}/${widget.file.id}_${widget.file.fileName}';
      await Dio().download(
        url!,
        path,
        options: Options(headers: widget.headers),
      );
      await SharePlus.instance.share(
        ShareParams(files: [XFile(path)], sharePositionOrigin: origin),
      );
    } catch (_) {
      if (mounted) {
        context.showMessage('Không mở được tệp', type: SnackBarType.error);
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = _size(widget.file.fileSize);
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: _open,
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(_icon, size: 28, color: AppColors.main),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.file.fileName ?? '-',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.enableText,
                    ),
                  ),
                  if (size != null)
                    Text(
                      size,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.gray,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            _loading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(
                    Icons.file_download_outlined,
                    size: 20,
                    color: AppColors.main,
                  ),
          ],
        ),
      ),
    );
  }
}

/// Trạng thái rỗng căn giữa với icon và dòng mô tả.
class _Empty extends StatelessWidget {
  const _Empty({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 44, color: AppColors.disableText),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 13, color: AppColors.gray),
          ),
        ],
      ),
    );
  }
}

/// Ảnh mạng có kèm token; hiện loading và icon lỗi khi tải thất bại.
class _NetworkImage extends StatelessWidget {
  const _NetworkImage({
    required this.url,
    required this.headers,
    required this.fit,
    this.iconSize = 64,
    this.dark = false,
  });

  final String? url;
  final Map<String, String> headers;
  final BoxFit fit;
  final double iconSize;

  /// `true` khi hiển thị trên nền đen (màn xem ảnh).
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final fg = dark ? Colors.white54 : AppColors.gray;
    if (!_has(url)) {
      return Icon(Icons.broken_image_outlined, size: iconSize, color: fg);
    }
    return Image.network(
      url!,
      headers: headers,
      fit: fit,
      loadingBuilder: (_, child, progress) {
        if (progress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: dark ? Colors.white : null,
            value: progress.expectedTotalBytes != null
                ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (_, _, _) =>
          Icon(Icons.broken_image_outlined, size: iconSize, color: fg),
    );
  }
}

/// Màn xem ảnh full-screen: vuốt ngang đổi ảnh, chụm để phóng to.
class _ImageViewer extends StatefulWidget {
  const _ImageViewer({
    required this.files,
    required this.initialIndex,
    required this.headers,
  });

  final List<ApproveBookingPaymentFile> files;
  final int initialIndex;
  final Map<String, String> headers;

  @override
  State<_ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<_ImageViewer> {
  late final PageController _pageCtl = PageController(
    initialPage: widget.initialIndex,
  );
  late int _current = widget.initialIndex;

  @override
  void dispose() {
    _pageCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.files.length;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          total > 1
              ? '${_current + 1}/$total  ${widget.files[_current].fileName ?? ''}'
              : widget.files[_current].fileName ?? 'Xem ảnh',
          style: const TextStyle(fontSize: 14, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: PageView.builder(
        controller: _pageCtl,
        itemCount: total,
        onPageChanged: (i) => setState(() => _current = i),
        itemBuilder: (_, i) => InteractiveViewer(
          minScale: 0.5,
          maxScale: 4,
          child: Center(
            child: _NetworkImage(
              url: widget.files[i].url,
              headers: widget.headers,
              fit: BoxFit.contain,
              dark: true,
            ),
          ),
        ),
      ),
    );
  }
}

/// Tab "Lịch sử": timeline duyệt trong một thẻ.
/// Xanh = đã duyệt, đỏ = có lý do từ chối, cam = đang chờ.
class _LogsTab extends StatelessWidget {
  const _LogsTab({required this.logs});

  final List<ApproveBookingPaymentLog> logs;

  @override
  Widget build(BuildContext context) {
    if (logs.isEmpty) {
      return const _Empty(
        icon: Icons.history_rounded,
        text: 'Chưa có lịch sử duyệt',
      );
    }
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _Card(
          child: Column(
            children: [
              for (var i = 0; i < logs.length; i++)
                _LogTile(
                  log: logs[i],
                  isFirst: i == 0,
                  isLast: i == logs.length - 1,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LogTile extends StatelessWidget {
  const _LogTile({
    required this.log,
    required this.isFirst,
    required this.isLast,
  });

  final ApproveBookingPaymentLog log;
  final bool isFirst;
  final bool isLast;

  bool get _rejected => _has(log.reasonCancel);

  Color get _color => log.isApproved == 1
      ? AppColors.success
      : _rejected
      ? AppColors.alert
      : AppColors.warning;

  IconData get _icon => log.isApproved == 1
      ? Icons.check_rounded
      : _rejected
      ? Icons.close_rounded
      : Icons.hourglass_empty_rounded;

  String get _statusText => log.isApproved == 1
      ? 'Đã duyệt'
      : _rejected
      ? 'Từ chối'
      : 'Chờ duyệt';

  @override
  Widget build(BuildContext context) {
    final date = log.dateApproved;
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.06,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 26,
        height: 26,
        color: _color,
        iconStyle: IconStyle(
          iconData: _icon,
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      beforeLineStyle: LineStyle(color: _color.withValues(alpha: 0.35)),
      afterLineStyle: LineStyle(color: _color.withValues(alpha: 0.35)),
      endChild: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 0, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _has(log.stepName) ? log.stepName!.trim() : '-',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.enableText,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                _Chip(text: _statusText, color: _color),
                if (date != null) ...[
                  const SizedBox(width: 8),
                  Text(
                    _dateTimeFmt.format(date),
                    style: const TextStyle(fontSize: 11, color: AppColors.gray),
                  ),
                ],
              ],
            ),
            if (_has(log.contentLog)) ...[
              const SizedBox(height: 6),
              Text(
                log.contentLog!.trim(),
                style: const TextStyle(fontSize: 12, height: 1.3),
              ),
            ],
            if (_rejected) ...[
              const SizedBox(height: 6),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.alert.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Lý do: ${log.reasonCancel!.trim()}',
                  style: const TextStyle(fontSize: 12, color: AppColors.alert),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
