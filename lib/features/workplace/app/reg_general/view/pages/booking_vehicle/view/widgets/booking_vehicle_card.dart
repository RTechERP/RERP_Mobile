import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../data/datasource/models/booking_vehicle_model.dart';
import '../bloc/booking_vehicle_bloc.dart';
import '../booking_vehicle_api_categories.dart';

/// Màn chi tiết: ưu tiên [BookingVehicleItem.statusText] từ API, sau đó cùng logic list.
String bookingVehicleDetailApprovalLabel(BookingVehicleItem item) {
  final st = (item.statusText ?? '').trim();
  if (st.isNotEmpty) return st;
  return _approvalBadgeLabel(item);
}

/// Card một dòng đặt xe: hàng badge (duyệt / xếp xe) phía trên, cột thông tin phía dưới.
class BookingVehicleCard extends StatelessWidget {
  const BookingVehicleCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final BookingVehicleItem item;
  final VoidCallback? onTap;

  static final DateFormat _returnTimeFormat = DateFormat('HH:mm - dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final categoryLabel = (item.categoryText ?? '-').trim();
    final categoryDisplay = categoryLabel.isEmpty ? '-' : categoryLabel;

    final projectParts = _splitProjectFullName(item.projectFullName);
    final projectLine = _formatProjectLine(projectParts.$1, projectParts.$2);

    final approvalBadge = _approvalBadgeLabel(item);
    final arrangementBadge = _arrangementBadgeLabel(item);
    final approvalColor = _approvalBadgeColor(approvalBadge);
    final arrangementColor = _arrangementBadgeColor(arrangementBadge);

    final isPassengerReturn =
        item.category == BookingVehicleApiCategory.passengerReturn;
    final isCargoDelivery =
        item.category == BookingVehicleApiCategory.commercialDelivery ||
            item.category == BookingVehicleApiCategory.demoExhibitionDelivery;
    final isCargoPickup =
        item.category == BookingVehicleApiCategory.commercialPickup ||
            item.category == BookingVehicleApiCategory.demoExhibitionPickup;

    final infoChildren = <Widget>[
      _InfoLine(text: categoryDisplay, prefix: 'Hình thức đặt xe: '),
      const SizedBox(height: 6),
      _InfoLine(text: projectLine, prefix: 'Dự án: ', isEmphasis: true),
    ];

    if (isPassengerReturn) {
      infoChildren.add(const SizedBox(height: 6));
      infoChildren.add(
        _InfoLine(
          text: _formatReturnDateTime(item.timeNeedPresent),
          prefix: 'Thời gian cần đến: ',
        ),
      );
      infoChildren.add(const SizedBox(height: 6));
      infoChildren.add(
        _InfoLine(
          text: _formatReturnDateTime(
            item.departureDate,
          ),
          prefix: 'Thời gian về: ',
        ),
      );
    } else if (isCargoDelivery) {
      infoChildren.add(const SizedBox(height: 6));
      infoChildren.add(
        _InfoLine(
          text: _formatReturnDateTime(item.timeNeedPresent),
          prefix: 'Thời gian giao đến: ',
        ),
      );
      infoChildren.add(const SizedBox(height: 6));
      infoChildren.add(
        _InfoLine(
          text: _formatReturnDateTime(item.departureDate),
          prefix: 'Thời gian lấy hàng: ',
        ),
      );
    } else if (isCargoPickup) {
      infoChildren.add(const SizedBox(height: 6));
      infoChildren.add(
        _InfoLine(
          text: _formatReturnDateTime(item.timeNeedPresent),
          prefix: 'Thời gian cần đến lấy: ',
        ),
      );
      infoChildren.add(const SizedBox(height: 6));
      infoChildren.add(
        _InfoLine(
          text: _formatReturnDateTime(item.departureDate),
          prefix: 'Thời gian xuất phát: ',
        ),
      );
    } else {
      infoChildren.add(const SizedBox(height: 6));
      infoChildren.add(
        _InfoLine(
          text: _formatReturnDateTime(item.timeNeedPresent),
          prefix: 'Thời gian cần đến: ',
        ),
      );
      infoChildren.add(const SizedBox(height: 6));
      infoChildren.add(
        _InfoLine(
          text: _formatReturnDateTime(item.departureDate),
          prefix: 'Thời gian xuất phát: ',
        ),
      );

      infoChildren.add(const SizedBox(height: 6));
      infoChildren.add(
        _InfoLine(
          text: _formatReturnDateTime(item.timeReturn),
          prefix: 'Thời gian về: ',
        ),
      );
    }

    final inner = Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _StatusBadge(
                  text: approvalBadge,
                  color: approvalColor,
                ),
                const SizedBox(width: 8),
                _StatusBadge(
                  text: arrangementBadge,
                  color: arrangementColor,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: infoChildren,
            ),
          ],
        ),
      ),
    );

    final card = onTap == null
        ? inner
        : Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onTap,
              child: inner,
            ),
          );

    if (!_canShowCancelSlidable(item)) {
      return card;
    }

    final bookingId = item.id!;

    return Slidable(
      key: ValueKey('booking_vehicle_$bookingId'),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.28,
        children: [
          SlidableAction(
            onPressed: (actionContext) async {
              Slidable.of(actionContext)?.close();
              if (!context.mounted) return;
              await DialogService.showCancelBooking(
                context: context,
                onConfirm: () {
                  if (!context.mounted) return;
                  context.read<BookingVehicleBloc>().add(
                        BookingVehicleEvent.cancelBookingVehicle(
                          vehicleBookingId: bookingId,
                        ),
                      );
                },
              );
            },
            backgroundColor: AppColors.alert,
            foregroundColor: Colors.white,
            icon: Icons.cancel_outlined,
            label: 'Huỷ',
          ),
        ],
      ),
      child: card,
    );
  }

  String _formatReturnDateTime(DateTime? dt) {
    if (dt == null) return '-';
    return _returnTimeFormat.format(dt);
  }
}

bool _canShowCancelSlidable(BookingVehicleItem item) {
  final id = item.id;
  if (id == null || id <= 0) return false;
  if (item.isCancel == true) return false;
  if (item.status == 3) return false;
  return true;
}

String _formatProjectLine(String code, String name) {
  final c = code.trim().isEmpty ? '-' : code.trim();
  final n = name.trim().isEmpty ? '-' : name.trim();
  if (c == '-' && n == '-') return '-';
  if (c == n) return c;
  return '$c - $n';
}

String _approvalBadgeLabel(BookingVehicleItem item) {
  if (item.isCancel == true) return 'Đã huỷ';
  final t = (item.statusText ?? '').trim();
  final lower = t.toLowerCase();
  if (lower.contains('từ chối') ||
      lower.contains('tu choi') ||
      lower.contains('rejected')) {
    return 'Từ chối';
  }
  if (lower.contains('đã duyệt') ||
      lower.contains('da duyet') ||
      lower.contains('phê duyệt') ||
      lower.contains('phe duyet') ||
      lower.contains('approved')) {
    return 'Đã duyệt';
  }
  if (item.status == 3) return 'Đã duyệt';
  if ((item.approvedTBP ?? 0) > 0 && item.isApprovedTBP == true) {
    return 'Đã duyệt';
  }
  return 'Chưa duyệt';
}

String _arrangementBadgeLabel(BookingVehicleItem item) {
  final plate = (item.licensePlate ?? '').trim();
  final driver = (item.driverName ?? '').trim();
  final charge = (item.nameVehicleCharge ?? '').trim();
  if (plate.isNotEmpty || driver.isNotEmpty || charge.isNotEmpty) {
    return 'Đã xếp';
  }
  return 'Chưa xếp';
}

Color _approvalBadgeColor(String label) {
  switch (label) {
    case 'Đã duyệt':
      return AppColors.success;
    case 'Từ chối':
    case 'Đã huỷ':
      return AppColors.alert;
    default:
      return AppColors.warning;
  }
}

Color _arrangementBadgeColor(String label) {
  return label == 'Đã xếp' ? AppColors.success : AppColors.gray;
}

class _InfoLine extends StatelessWidget {
  const _InfoLine({
    required this.text,
    this.prefix = '',
    this.isEmphasis = false,
  });

  final String text;
  final String prefix;
  final bool isEmphasis;

  @override
  Widget build(BuildContext context) {
    final display = text.isEmpty ? '-' : text;
    final style = isEmphasis
        ? const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryERP,
            height: 1.2,
          )
        : const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondaryColor,
            height: 1.2,
          );

    return Text.rich(
      TextSpan(
        children: [
          if (prefix.isNotEmpty)
            TextSpan(
              text: prefix,
              style: TextStyle(
                fontSize: style.fontSize,
                fontWeight: FontWeight.w500,
                color: AppColors.textTertiaryColor,
                height: style.height,
              ),
            ),
          TextSpan(text: display, style: style),
        ],
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final safeText = text.trim().isEmpty ? '-' : text.trim();
    final bg = color.withOpacity(0.12);
    final border = color.withOpacity(0.55);

    return Container(
      constraints: const BoxConstraints(maxWidth: 88),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: border),
      ),
      child: Text(
        safeText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

/// Trả về (projectCode, projectName).
(String, String) _splitProjectFullName(String? full) {
  final value = (full ?? '').trim();
  if (value.isEmpty) return ('-', '-');

  final dashParts = value.split(RegExp(r'\s[-–]\s'));
  if (dashParts.length >= 2) {
    final code = dashParts.first.trim();
    final name = dashParts.sublist(1).join(' - ').trim();
    return (code.isNotEmpty ? code : '-', name.isNotEmpty ? name : '-');
  }

  final lines = value
      .split('\n')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();
  if (lines.length >= 2) {
    return (lines.first, lines.sublist(1).join(' ').trim());
  }

  return (value, value);
}
