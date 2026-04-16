// Date: 16/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Card đặt xe chuyên nghiệp - hiển thị theo loại, hỗ trợ copy

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
    default:
      return Icons.directions_car;
  }
}

//---(Card Widget)---//

class BookingVehicleCard extends StatelessWidget {
  const BookingVehicleCard({
    super.key,
    required this.item,
    this.onTap,
  });

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

    // Định dạng project
    final projectLine = _formatProject(item.projectFullName);

    // Body content theo loại
    final bodyRows = _buildBodyRows();

    // Bottom: thời gian chính
    final bottomLabel = _primaryTimeLabel();
    final bottomTime = _primaryTimeValue();

    final inner = Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left color border
            Container(
              width: 5,
              decoration: BoxDecoration(
                color: effectiveColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
              ),
            ),
            // Main content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header: icon + type + copy button
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: effectiveColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            typeIcon,
                            size: 20,
                            color: effectiveColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                typeLabel,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: effectiveColor,
                                ),
                              ),
                              if (projectLine.isNotEmpty) ...[
                                const SizedBox(height: 2),
                                Text(
                                  projectLine,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textSecondaryColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ],
                          ),
                        ),
                        // Nút sao chép
                        _CopyButton(item: item),
                        const SizedBox(width: 6),
                        // Status badges
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _TinyBadge(
                              text: approvalBadge,
                              color: approvalColor,
                            ),
                            const SizedBox(height: 4),
                            _TinyBadge(
                              text: arrangementBadge,
                              color: arrangementColor,
                            ),
                          ],
                        ),
                      ],
                    ),

                    if (bodyRows.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      // Divider
                      Container(
                        height: 1,
                        color: AppColors.borderColor.withOpacity(0.6),
                      ),
                      const SizedBox(height: 10),
                      // Body rows
                      ...bodyRows,
                    ],

                    if (bottomLabel.isNotEmpty && bottomTime.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: AppColors.textTertiaryColor,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '$bottomLabel: ',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textTertiaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: bottomTime,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: effectiveColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],

                    // Passenger / contact info strip
                    // if (!_isCargoType(item)) ...[
                    //   const SizedBox(height: 8),
                    //   _PersonStrip(item: item, color: effectiveColor),
                    // ],
                  ],
                ),
              ),
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
              borderRadius: BorderRadius.circular(14),
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

  List<Widget> _buildBodyRows() {
    final rows = <Widget>[];
    final isPassengerReturn =
        item.category == BookingVehicleApiCategory.passengerReturn;
    final isCargoDelivery = item.category == BookingVehicleApiCategory.commercialDelivery ||
        item.category == BookingVehicleApiCategory.demoExhibitionDelivery;
    final isCargoPickup = item.category == BookingVehicleApiCategory.commercialPickup ||
        item.category == BookingVehicleApiCategory.demoExhibitionPickup;

    if (isPassengerReturn) {
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

  bool _isCargoType(BookingVehicleItem item) {
    return item.category == BookingVehicleApiCategory.commercialDelivery ||
        item.category == BookingVehicleApiCategory.demoExhibitionDelivery ||
        item.category == BookingVehicleApiCategory.commercialPickup ||
        item.category == BookingVehicleApiCategory.demoExhibitionPickup;
  }

  String _fmt(DateTime? dt) {
    if (dt == null) return '-';
    return _dateTimeFormat.format(dt);
  }
}

//---( Copy Button )---//

class _CopyButton extends StatelessWidget {
  const _CopyButton({required this.item});

  final BookingVehicleItem item;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _copyToAddScreen(context),
      icon: const Icon(Icons.copy, size: 20),
      tooltip: 'Sao chép tạo mới',
      style: IconButton.styleFrom(
        backgroundColor: AppColors.supportBtn,
        foregroundColor: AppColors.textSecondaryColor,
        padding: const EdgeInsets.all(8),
        minimumSize: const Size(36, 36),
      ),
    );
  }

  void _copyToAddScreen(BuildContext context) async {
    final bloc = context.read<BookingVehicleBloc>();
    final projects = bloc.state.projects;

    if (projects.isEmpty) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chờ dữ liệu dự án tải xong'),
          backgroundColor: AppColors.alert,
        ),
      );
      return;
    }

    final label = bookingVehicleEditBookingTypeLabel(item);
    final groupNum = _bookingTypeGroupFromLabel(label);

    final patch = buildBookingVehicleEditFormPatch(
      item,
      projects: projects,
    );

    final cache = <String, dynamic>{
      ...patch,
      '_copied_item_id': item.id,
      '_copied_booking_type_group': groupNum,
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
      default:
        return 0;
    }
  }
}

//---( Person Strip )---//

class _PersonStrip extends StatelessWidget {
  const _PersonStrip({required this.item, required this.color});

  final BookingVehicleItem item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final name = (item.passengerName ?? '').trim();
    final dept = (item.passengerDepartment ?? '').trim();
    final phone = (item.passengerPhoneNumber ?? '').trim();

    if (name.isEmpty && dept.isEmpty && phone.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.person_outline, size: 14, color: color),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              name.isNotEmpty ? name : (dept.isNotEmpty ? dept : phone),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (dept.isNotEmpty) ...[
            const SizedBox(width: 6),
            Text(
              dept,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textTertiaryColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (phone.isNotEmpty) ...[
            const SizedBox(width: 6),
            Text(
              phone,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textTertiaryColor,
              ),
            ),
          ],
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
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textTertiaryColor),
        const SizedBox(width: 6),
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textTertiaryColor,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
            maxLines: 1,
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
    final bg = color.withOpacity(0.12);
    final border = color.withOpacity(0.4);

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
