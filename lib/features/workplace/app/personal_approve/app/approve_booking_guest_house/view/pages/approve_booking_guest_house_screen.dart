import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../data/datasource/models/approve_booking_guest_house_model.dart';
import '../bloc/approve_booking_guest_house_bloc.dart';

class ApproveBookingGuestHousePage extends StatefulWidget {
  const ApproveBookingGuestHousePage({super.key});

  @override
  State<ApproveBookingGuestHousePage> createState() =>
      _ApproveBookingGuestHousePageState();
}

/// Dùng `BaseShareState` thay cho `BaseState` vì bloc là singleton
/// được wrap ở ShellRoute (`BlocProvider.value`); `BaseState.dispose()`
/// sẽ tự `bloc.close()` → giết bloc share với route con.
class _ApproveBookingGuestHousePageState extends BaseShareState<
    ApproveBookingGuestHousePage,
    ApproveBookingGuestHouseEvent,
    ApproveBookingGuestHouseState,
    ApproveBookingGuestHouseBloc> {
  /// Shorthand cho `bloc.state` — `BaseShareState` không expose getter
  /// `state` nên dùng shorthand này để truy cập gọn.
  ApproveBookingGuestHouseState get state => bloc.state;

  @override
  void initState() {
    super.initState();
    bloc.add(const ApproveBookingGuestHouseEvent.init());
  }

  @override
  void listener(BuildContext context, ApproveBookingGuestHouseState state) {
    final message = (state.message ?? '').trim();
    if (message.isNotEmpty) {
      showMessage(context, message, type: SnackBarType.error);
    }
  }

  /// Mở bottom sheet chọn trạng thái duyệt: Tất cả / Chưa duyệt / Đã duyệt.
  /// Trả về `null` khi user dismiss; trả về `_StatusPick(value)` khi user
  /// chọn option (kể cả "Tất cả" — phân biệt nhờ wrapper non-null).
  Future<void> _openStatusFilter() async {
    final current = state.statusFilter;
    final picked = await showModalBottomSheet<_StatusPick>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        Widget tile({required int? value, required String label}) {
          final isActive = value == current;
          return ListTile(
            leading: Icon(
              isActive
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: isActive ? AppColors.primaryERP : AppColors.gray,
            ),
            title: Text(label),
            onTap: () => Navigator.of(sheetContext).pop(
              _StatusPick(value),
            ),
          );
        }

        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lọc theo trạng thái',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              for (final option in _kStatusOptions)
                tile(value: option.$1, label: option.$2),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );

    if (!mounted) return;
    if (picked == null) return;
    if (picked.value == current) return;
    bloc.add(
      ApproveBookingGuestHouseEvent.changeStatusFilter(
        status: picked.value,
      ),
    );
  }

  Future<void> _openDatePicker() async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final tomorrow = todayStart.add(const Duration(days: 1));

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: state.dateStart ?? todayStart,
        initialEnd: state.dateEnd ?? tomorrow,
        onApply: (start, end) {
          bloc.add(
            ApproveBookingGuestHouseEvent.changeDateRange(
              dateStart: start,
              dateEnd: end,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'Duyệt ĐX/NN',
          style: AppStyles.headingTitle2,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onBackTap: () => context.pop(),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month),
            tooltip: 'Lọc ngày',
            onPressed: _openDatePicker,
          ),
          IconButton(
            icon: Icon(
              state.statusFilter == null
                  ? Icons.filter_alt_outlined
                  : Icons.filter_alt_rounded,
            ),
            tooltip: 'Lọc trạng thái',
            onPressed: _openStatusFilter,
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: blocBuilder(
        (context, state) {
          if (state.status == BaseStateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == BaseStateStatus.failed) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppImages.error, width: 320),
                    const SizedBox(height: 12),
                    Text(
                      (state.message ?? '').trim().isNotEmpty
                          ? state.message!.trim()
                          : 'Load dữ liệu thất bại',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: _ListHeader(
                  total: state.bookings.length,
                  isSearching: state.filterText.isNotEmpty,
                  statusFilter: state.statusFilter,
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    bloc.add(const ApproveBookingGuestHouseEvent.refresh());
                    await bloc.stream.firstWhere(
                      (s) => s.status != BaseStateStatus.loading,
                    );
                  },
                  child: _buildList(state),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildList(ApproveBookingGuestHouseState state) {
    if (state.bookings.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 80),
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppImages.missing, width: 320),
                const SizedBox(height: 12),
                const Text('Không có dữ liệu'),
              ],
            ),
          ),
        ],
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: state.bookings.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = state.bookings[index];

        return Builder(
          builder: (context) => ApproveBookingGuestHouseCard(
            item: item,
          ),
        );
      },
    );
  }
}

//---(Card)---//

/// Card hiển thị một phiếu thanh toán đặt phòng nhà nghỉ trong màn duyệt TBP.
/// Card gồm: Người đăng ký - Từ ngày - Đến ngày - Khách sạn -
/// Tổng tiền - Tiền có HĐ - STK/Ngân hàng - StatusChip - File HĐ - File CK.
class ApproveBookingGuestHouseCard extends StatelessWidget {
  const ApproveBookingGuestHouseCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final ApproveBookingGuestHouseItem item;
  final VoidCallback? onTap;

  static final DateFormat _dateFmt = DateFormat('dd/MM/yyyy');
  static final NumberFormat _moneyFmt = NumberFormat('#,###');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryERP.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: status chip + hotel
                Row(
                  children: [
                    _StatusChip(status: item.detailStatus),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.hotel_outlined,
                            size: 14,
                            color: AppColors.gray,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              item.hotelName ?? '-',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.enableText,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Người đăng ký
                _InfoRow(
                  icon: Icons.person_outline,
                  label: 'Người đăng ký',
                  value: item.registerFullName ?? '-',
                ),
                const SizedBox(height: 6),

                // Từ ngày - Đến ngày
                _InfoRow(
                  icon: Icons.calendar_month_outlined,
                  label: 'Thời gian',
                  value:
                      '${_formatDate(item.checkInDate)} → ${_formatDate(item.checkOutDate)}',
                  valueColor: AppColors.primaryERP,
                ),
                const SizedBox(height: 6),

                // Tổng tiền
                _InfoRow(
                  icon: Icons.payments_outlined,
                  label: 'Tổng tiền',
                  value: _formatMoney(item.totalAmount),
                  valueColor: AppColors.alert,
                  isBold: true,
                ),
                const SizedBox(height: 6),

                // Tiền có HĐ
                _InfoRow(
                  icon: Icons.receipt_long_outlined,
                  label: 'Tiền có HĐ',
                  value: _formatMoney(item.totalAmountWithInvoice),
                  valueColor: AppColors.success,
                  isBold: true,
                ),
                const SizedBox(height: 6),

                // STK / Ngân hàng
                _InfoRow(
                  icon: Icons.account_balance_outlined,
                  label: 'STK / Ngân hàng',
                  value: _formatBank(),
                ),
                if (item.reason != null && item.reason!.trim().isNotEmpty) ...[
                  const SizedBox(height: 6),
                  _InfoRow(
                    icon: Icons.notes_outlined,
                    label: 'Lý do',
                    value: item.reason!,
                  ),
                ],
                const SizedBox(height: 10),

                // File HĐ + File CK
                Row(
                  children: [
                    if (_invoiceFile != null)
                      _FileButton(
                        label: 'File HĐ',
                        icon: Icons.receipt_outlined,
                        color: AppColors.success,
                        onTap: () => _openFile(context, _invoiceFile!.url),
                      ),
                    if (_invoiceFile != null && _bankCkFile != null)
                      const SizedBox(width: 8),
                    if (_bankCkFile != null)
                      _FileButton(
                        label: 'File CK',
                        icon: Icons.payment_outlined,
                        color: AppColors.primaryERP,
                        onTap: () => _openFile(context, _bankCkFile!.url),
                      ),
                    if (_invoiceFile == null && _bankCkFile == null)
                      Text(
                        'Không có file đính kèm',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.gray,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ApproveBookingFile? get _invoiceFile {
    try {
      return item.files?.firstWhere(
        (f) => f.fileType == 'INVOICE',
      );
    } catch (_) {
      return null;
    }
  }

  ApproveBookingFile? get _bankCkFile {
    try {
      return item.files?.firstWhere(
        (f) => f.fileType == 'BILL_CK',
      );
    } catch (_) {
      return null;
    }
  }

  String _formatDate(DateTime? d) {
    if (d == null) return '-';
    return _dateFmt.format(d);
  }

  String _formatMoney(double? amount) {
    if (amount == null) return '-';
    return '${_moneyFmt.format(amount)} VNĐ';
  }

  String _formatBank() {
    final acc = (item.bankAccount ?? '').trim();
    final name = (item.bankName ?? '').trim();
    if (acc.isEmpty && name.isEmpty) return '-';
    if (acc.isEmpty) return name;
    if (name.isEmpty) return acc;
    return '$acc - $name';
  }

  void _openFile(BuildContext context, String? url) {
    if (url == null || url.isEmpty) {
      context.showMessage("Không có link file", type: SnackBarType.error);
      return;
    }
    context.showMessage('Mở file: $url', type: SnackBarType.error);
  }
}

//---(Status Chip)---//

/// Chip trạng thái dựa trên `DetailStatus`:
/// 1 = Chờ duyệt, 2 = Đã duyệt, 3 = Từ chối.
class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final int? status;

  @override
  Widget build(BuildContext context) {
    final (label, bgColor, textColor) = _resolve();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: bgColor.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  (String, Color, Color) _resolve() {
    switch (status) {
      case 1:
        return ('Chờ duyệt', AppColors.warning, AppColors.warning);
      case 2:
        return ('Đã duyệt', AppColors.success, AppColors.success);
      case 3:
        return ('Từ chối', AppColors.alert, AppColors.alert);
      default:
        return ('Không rõ', AppColors.gray, AppColors.gray);
    }
  }
}

//---(Info Row)---//

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
    this.isBold = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: AppColors.gray),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.gray,
            height: 1.2,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
              color: valueColor ?? AppColors.enableText,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

//---(File Button)---//

class _FileButton extends StatelessWidget {
  const _FileButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//---(List Header)---//

class _ListHeader extends StatelessWidget {
  const _ListHeader({
    required this.total,
    required this.isSearching,
    required this.statusFilter,
  });

  final int total;
  final bool isSearching;
  final int? statusFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryERP,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryERP.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Flexible(
                      child: Text(
                        '$total',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 1.1,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'phiếu',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  isSearching
                      ? 'Đang tìm kiếm'
                      : _headerSubtitle(statusFilter),
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _headerSubtitle(int? statusFilter) {
  switch (statusFilter) {
    case 2:
      return 'Tổng số phiếu chưa duyệt';
    case 3:
      return 'Tổng số phiếu đã duyệt';
    default:
      return 'Tổng số phiếu cần duyệt';
  }
}

//---(Status Filter Sheet)---//

/// Sheet helper: các lựa chọn trạng thái duyệt.
/// `null` = Tất cả, `2` = Chưa duyệt, `3` = Đã duyệt.
const _kStatusOptions = <(int?, String)>[
  (null, 'Tất cả'),
  (2, 'Chưa duyệt'),
  (3, 'Đã duyệt'),
];

/// Wrapper phân biệt "user đã chọn" (non-null) với "dismiss sheet" (null)
/// khi giá trị nội bộ là `int?` (Tất cả = null).
class _StatusPick {
  const _StatusPick(this.value);
  final int? value;
}
