// Date: 16/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Card đặt xe chuyên nghiệp - hiển thị theo loại, hỗ trợ copy

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/booking_vehicle_model.dart';
import '../bloc/booking_vehicle_bloc.dart';
import '../booking_vehicle_api_categories.dart';
import '../booking_vehicle_item_form_prefill.dart';

/// Màn chi tiết: ưu tiên [BookingVehicleItem.statusText] từ API.
String bookingVehicleDetailApprovalLabel(BookingVehicleItem item) {
  final st = (item.statusText ?? '').trim();
  if (st.isNotEmpty) return st;
  return _approvalBadgeLabel(item);
}

//---(Booking Type Helpers)---//

String bookingVehicleEditBookingTypeLabel(BookingVehicleItem item) {
  const options = <String>{
    'Đăng ký người đi',
    'Đăng ký người về',
    'Đăng ký giao hàng thương mại',
    'Đăng ký lấy hàng thương mại',
    'Đăng ký giao hàng Demo/triển lãm',
    'Đăng ký lấy hàng Demo/triển lãm',
    'Chủ động phương tiện',
  };
  final ct = (item.categoryText ?? '').trim();
  if (options.contains(ct)) return ct;

  switch (item.category) {
    case BookingVehicleApiCategory.passengerGo:
      return 'Đăng ký người đi';
    case BookingVehicleApiCategory.passengerReturn:
      return 'Đăng ký người về';
    case BookingVehicleApiCategory.commercialDelivery:
      return 'Đăng ký giao hàng thương mại';
    case BookingVehicleApiCategory.demoExhibitionDelivery:
      return 'Đăng ký giao hàng Demo/triển lãm';
    case BookingVehicleApiCategory.commercialPickup:
      return 'Đăng ký lấy hàng thương mại';
    case BookingVehicleApiCategory.demoExhibitionPickup:
      return 'Đăng ký lấy hàng Demo/triển lãm';
    case BookingVehicleApiCategory.selfVehicle:
      return 'Chủ động phương tiện';
    default:
      return 'Đăng ký người đi';
  }
}

Color _bookingTypeColor(BookingVehicleItem item) {
  switch (item.category) {
    case BookingVehicleApiCategory.passengerGo:
      return AppColors.primaryERP;
    case BookingVehicleApiCategory.passengerReturn:
      return AppColors.secondaryERP;
    case BookingVehicleApiCategory.commercialDelivery:
    case BookingVehicleApiCategory.demoExhibitionDelivery:
      return AppColors.success;
    case BookingVehicleApiCategory.commercialPickup:
    case BookingVehicleApiCategory.demoExhibitionPickup:
      return const Color(0xFF9C27B0);
    case BookingVehicleApiCategory.selfVehicle:
      return AppColors.warning;
    default:
      return AppColors.primaryERP;
  }
}

IconData _bookingTypeIcon(BookingVehicleItem item) {
  switch (item.category) {
    case BookingVehicleApiCategory.passengerGo:
      return Icons.directions_car;
    case BookingVehicleApiCategory.passengerReturn:
      return Icons.directions_car_outlined;
    case BookingVehicleApiCategory.commercialDelivery:
    case BookingVehicleApiCategory.demoExhibitionDelivery:
      return Icons.local_shipping;
    case BookingVehicleApiCategory.commercialPickup:
    case BookingVehicleApiCategory.demoExhibitionPickup:
      return Icons.inbox;
    case BookingVehicleApiCategory.selfVehicle:
      return Icons.commute_outlined;
    default:
      return Icons.directions_car;
  }
}

//---(Card Widget)---//

class BookingVehicleCard extends StatelessWidget {
  const BookingVehicleCard({super.key, required this.item, this.onTap});

  final BookingVehicleItem item;
  final VoidCallback? onTap;

  static final DateFormat _dateTimeFormat = DateFormat('HH:mm - dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final typeColor = _bookingTypeColor(item);
    final typeLabel = bookingVehicleEditBookingTypeLabel(item);
    final typeIcon = _bookingTypeIcon(item);

    final approvalBadge = _approvalBadgeLabel(item);
    final arrangementBadge = _arrangementBadgeLabel(item);
    final approvalColor = _approvalBadgeColor(approvalBadge);
    final arrangementColor = _arrangementBadgeColor(arrangementBadge);

    final isCancelled = item.isCancel == true;
    final isRejected = approvalBadge == 'Từ chối';
    final effectiveColor = isCancelled || isRejected
        ? AppColors.gray
        : typeColor;

    final projectLine = _formatProject(item.projectFullName);
    final bodyRows = _buildBodyRows();
    final bottomLabel = _primaryTimeLabel();
    final bottomTime = _primaryTimeValue();

    final card = GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withValues(alpha: 0.9),
                      Colors.white.withValues(alpha: 0.7),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.6),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: effectiveColor.withValues(alpha: 0.08),
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
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          _TinyBadge(text: approvalBadge, color: approvalColor),
                          const SizedBox(width: 6),
                          _TinyBadge(
                            text: arrangementBadge,
                            color: arrangementColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      _TypeChip(
                        icon: typeIcon,
                        label: typeLabel,
                        project: projectLine,
                        color: effectiveColor,
                      ),
                      const SizedBox(height: 14),
                      if (bodyRows.isNotEmpty) ...bodyRows,
                      if (bottomLabel.isNotEmpty && bottomTime.isNotEmpty) ...[
                        const SizedBox(height: 10),
                        _InfoRow(
                          icon: Icons.access_time,
                          label: bottomLabel,
                          value: bottomTime,
                          valueColor: effectiveColor,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _onCopy(context),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.gray.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.copy_outlined,
                        size: 20,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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

  void _onCopy(BuildContext context) async {
    final bloc = context.read<BookingVehicleBloc>();
    final label = bookingVehicleEditBookingTypeLabel(item);
    final groupNum = _bookingTypeGroupFromLabel(label);

    final patch = buildBookingVehicleEditFormPatch(
      item,
      projects: bloc.state.projects,
    );

    final approvedTbp = item.approvedTBP;
    final approverLabel = (item.fullNameTBP ?? '').trim();
    final problemArises = (item.problemArises ?? '').trim();

    final cache = <String, dynamic>{
      ...patch,
      '_copied_item_id': item.id,
      '_copied_booking_type_group': groupNum,
      if (approvedTbp != null && approvedTbp > 0)
        'approver': approvedTbp.toString(),
      if (approverLabel.isNotEmpty) 'approver_text': approverLabel,
      if (approverLabel.isNotEmpty) 'approver_field': approverLabel,
      if (approverLabel.isNotEmpty) '_prefill_approver_name': approverLabel,
      if (problemArises.isNotEmpty) 'problem_rule_reason': problemArises,
      if (problemArises.isNotEmpty) 'problem_rule_reason_text': problemArises,
      if (problemArises.isNotEmpty) 'problem_field': problemArises,
    };

    if (!context.mounted) return;
    final result = await context.push<bool?>(
      RouteNames.bookingVehicleAdd,
      extra: cache,
    );

    if (result == true && context.mounted) {
      bloc.add(const BookingVehicleEvent.init());
    }
  }

  int _bookingTypeGroupFromLabel(String label) {
    switch (label) {
      case 'Đăng ký người đi':
        return 0;
      case 'Đăng ký người về':
        return 1;
      case 'Đăng ký giao hàng thương mại':
      case 'Đăng ký giao hàng Demo/triển lãm':
        return 2;
      case 'Đăng ký lấy hàng thương mại':
      case 'Đăng ký lấy hàng Demo/triển lãm':
        return 3;
      case 'Chủ động phương tiện':
        return 4;
      default:
        return 0;
    }
  }

  List<Widget> _buildBodyRows() {
    final rows = <Widget>[];
    final isSelfVehicle =
        item.category == BookingVehicleApiCategory.selfVehicle;
    final isPassengerReturn =
        item.category == BookingVehicleApiCategory.passengerReturn;
    final isCargoDelivery =
        item.category == BookingVehicleApiCategory.commercialDelivery ||
        item.category == BookingVehicleApiCategory.demoExhibitionDelivery;
    final isCargoPickup =
        item.category == BookingVehicleApiCategory.commercialPickup ||
        item.category == BookingVehicleApiCategory.demoExhibitionPickup;

    if (isSelfVehicle) {
      rows.addAll([
        _InfoRow(
          icon: Icons.place_outlined,
          label: 'Cần đến',
          value: _fmt(item.timeNeedPresent),
        ),
        const SizedBox(height: 6),
        _InfoRow(
          icon: Icons.directions_car_outlined,
          label: 'Xuất phát',
          value: _fmt(item.departureDate),
        ),
      ]);
    } else if (isPassengerReturn) {
      rows.addAll([
        _InfoRow(
          icon: Icons.place_outlined,
          label: 'Cần đến',
          value: _fmt(item.timeNeedPresent),
        ),
        const SizedBox(height: 6),
        _InfoRow(
          icon: Icons.history,
          label: 'Thời gian về',
          value: _fmt(item.departureDate),
        ),
      ]);
    } else if (isCargoDelivery) {
      rows.addAll([
        _InfoRow(
          icon: Icons.place_outlined,
          label: 'Giao đến lúc',
          value: _fmt(item.timeNeedPresent),
        ),
        const SizedBox(height: 6),
        _InfoRow(
          icon: Icons.inventory_2_outlined,
          label: 'Lấy hàng lúc',
          value: _fmt(item.departureDate),
        ),
        if (_cargoInfo.isNotEmpty) ...[
          const SizedBox(height: 6),
          _InfoRow(
            icon: Icons.inventory_outlined,
            label: 'Hàng hoá',
            value: _cargoInfo,
          ),
        ],
      ]);
    } else if (isCargoPickup) {
      rows.addAll([
        _InfoRow(
          icon: Icons.place_outlined,
          label: 'Cần đến lấy',
          value: _fmt(item.timeNeedPresent),
        ),
        const SizedBox(height: 6),
        _InfoRow(
          icon: Icons.directions_car_outlined,
          label: 'Xuất phát lúc',
          value: _fmt(item.departureDate),
        ),
        if (_cargoInfo.isNotEmpty) ...[
          const SizedBox(height: 6),
          _InfoRow(
            icon: Icons.inventory_outlined,
            label: 'Hàng hoá',
            value: _cargoInfo,
          ),
        ],
      ]);
    } else {
      // passengerGo default
      rows.addAll([
        _InfoRow(
          icon: Icons.place_outlined,
          label: 'Cần đến',
          value: _fmt(item.timeNeedPresent),
        ),
        const SizedBox(height: 6),
        _InfoRow(
          icon: Icons.directions_car_outlined,
          label: 'Xuất phát',
          value: _fmt(item.departureDate),
        ),
        const SizedBox(height: 6),
        _InfoRow(
          icon: Icons.history,
          label: 'Về',
          value: _fmt(item.timeReturn),
        ),
      ]);
    }

    return rows;
  }

  String _primaryTimeLabel() {
    switch (item.category) {
      case BookingVehicleApiCategory.selfVehicle:
        return 'Xuất phát';
      case BookingVehicleApiCategory.passengerGo:
        return 'Xuất phát';
      case BookingVehicleApiCategory.passengerReturn:
        return 'Về';
      case BookingVehicleApiCategory.commercialDelivery:
        return 'Lấy hàng';
      case BookingVehicleApiCategory.demoExhibitionDelivery:
        return 'Lấy hàng';
      case BookingVehicleApiCategory.commercialPickup:
        return 'Xuất phát';
      case BookingVehicleApiCategory.demoExhibitionPickup:
        return 'Xuất phát';
      default:
        return 'Xuất phát';
    }
  }

  String _primaryTimeValue() {
    switch (item.category) {
      case BookingVehicleApiCategory.selfVehicle:
        return _fmt(item.departureDate);
      case BookingVehicleApiCategory.passengerGo:
        return _fmt(item.departureDate);
      case BookingVehicleApiCategory.passengerReturn:
        return _fmt(item.departureDate);
      case BookingVehicleApiCategory.commercialDelivery:
        return _fmt(item.departureDate);
      case BookingVehicleApiCategory.demoExhibitionDelivery:
        return _fmt(item.departureDate);
      case BookingVehicleApiCategory.commercialPickup:
        return _fmt(item.departureDate);
      case BookingVehicleApiCategory.demoExhibitionPickup:
        return _fmt(item.departureDate);
      default:
        return _fmt(item.departureDate);
    }
  }

  String get _cargoInfo {
    final parts = <String>[];
    final name = item.packageName?.trim() ?? '';
    final size = item.packageSize?.toString().trim() ?? '';
    final weight = item.packageWeight?.toString().trim() ?? '';
    if (name.isNotEmpty) parts.add(name);
    if (size.isNotEmpty) parts.add(size);
    if (weight.isNotEmpty) parts.add('$weight kg');
    return parts.join(' · ');
  }

  String _fmt(DateTime? dt) {
    if (dt == null) return '-';
    return _dateTimeFormat.format(dt);
  }
}

//---( Type Chip )---//

class _TypeChip extends StatelessWidget {
  const _TypeChip({
    required this.icon,
    required this.label,
    required this.project,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String project;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.15), width: 1),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: color,
                    height: 1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (project.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    project,
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.gray,
                      height: 1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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

//---( Info Row )---//

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.gray),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: TextStyle(fontSize: 12, color: AppColors.gray, height: 1.2),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
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

//---( Tiny Badge )---//

class _TinyBadge extends StatelessWidget {
  const _TinyBadge({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final safeText = text.trim().isEmpty ? '-' : text.trim();
    final bg = color.withValues(alpha: 0.12);
    final border = color.withValues(alpha: 0.4);

    return Container(
      constraints: const BoxConstraints(maxWidth: 80),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
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
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: color,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

//---( Status Helpers )---//

bool _canShowCancelSlidable(BookingVehicleItem item) {
  final id = item.id;
  if (id == null || id <= 0) return false;
  if (item.isCancel == true) return false;
  if (item.status == 3) return false;
  // Đã xếp xe rồi thì không cho huỷ bằng swipe.
  if (_arrangementBadgeLabel(item) == 'Đã xếp') return false;
  return true;
}

String _formatProject(String? full) {
  if (full == null || full.trim().isEmpty) return '';
  final dashParts = full.trim().split(RegExp(r'\s[-–]\s'));
  if (dashParts.length >= 2) {
    return '${dashParts.first.trim()} - ${dashParts.sublist(1).join(' - ').trim()}';
  }
  return full.trim();
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
