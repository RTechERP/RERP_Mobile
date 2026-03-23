import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/booking_vehicle_model.dart';
import '../booking_vehicle_api_categories.dart';
import '../widgets/booking_vehicle_card.dart'
    show bookingVehicleDetailApprovalLabel;

Future<void> _openBookingVehicleEditAndPopToListIfSaved(
  BuildContext context,
  BookingVehicleItem item,
) async {
  final edited = await context.push<bool?>(
    RouteNames.bookingVehicleEdit,
    extra: item,
  );
  if (!context.mounted) return;
  if (edited == true) {
    context.pop(true);
  }
}

/// Chi tiết yêu cầu đặt xe: hiển thị đúng [item] user chọn từ danh sách
/// [BookingVehicleRepo.getBookingVehicle] (onInit), không gọi API khác.
class BookingVehicleDetailScreen extends StatelessWidget {
  const BookingVehicleDetailScreen({super.key, required this.item});

  final BookingVehicleItem item;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Chi tiết yêu cầu'),
        onBackTap: () => onBack(context),
      ),
      body: _DetailBody(item: item),
    );
  }
}

class _DetailBody extends StatelessWidget {
  const _DetailBody({required this.item});

  final BookingVehicleItem item;

  @override
  Widget build(BuildContext context) {
    final approvalLabel = bookingVehicleDetailApprovalLabel(item);
    final approvalColor = _approvalBadgeColor(approvalLabel);
    final arrangementLabel = _arrangementBadgeLabel(item);

    final projectParts = _splitProjectFullName(item.projectFullName);
    final categoryLine = (item.categoryText ?? '').trim().isEmpty
        ? '-'
        : item.categoryText!.trim();

    final departure = _nonEmpty(
      item.departureAddressText,
      item.departureAddress,
    );
    final destination = _formatDestination(item);

    final departureTime = _formatDisplayDateTime(
      item.departureDateText,
      item.departureDate,
    );
    final timeNeedPresent = _formatDisplayDateTime(
      item.timeNeedPresentText,
      item.timeNeedPresent,
    );

    final isPassengerReturn =
        item.category == BookingVehicleApiCategory.passengerReturn;
    final isCargoDelivery = _isCommercialDeliveryCategory(item.category);
    final cargoPickup = _isCargoPickup(item.category);
    final showSecondTimeColumn = !isPassengerReturn;

    late final String timeCol1Label;
    late final String timeCol1Value;
    late final String timeCol2Label;
    late final String timeCol2Value;
    if (isPassengerReturn) {
      timeCol1Label = 'THỜI GIAN VỀ';
      timeCol1Value = departureTime;
      timeCol2Label = '';
      timeCol2Value = '';
    } else if (isCargoDelivery) {
      timeCol1Label = 'THỜI GIAN GIAO ĐẾN';
      timeCol1Value = timeNeedPresent;
      timeCol2Label = 'THỜI GIAN LẤY HÀNG';
      timeCol2Value = departureTime;
    } else if (cargoPickup) {
      timeCol1Label = 'THỜI GIAN CẦN ĐẾN LẤY';
      timeCol1Value = timeNeedPresent;
      timeCol2Label = 'THỜI GIAN XUẤT PHÁT';
      timeCol2Value = departureTime;
    } else {
      timeCol1Label = 'THỜI GIAN XUẤT PHÁT';
      timeCol1Value = departureTime;
      timeCol2Label = 'CẦN CÓ MẶT';
      timeCol2Value = timeNeedPresent;
    }

    final vehicleLine = (item.vehicleTypeText ?? '').trim().isEmpty
        ? '-'
        : item.vehicleTypeText!.trim();

    final approverName = _nonEmpty(item.fullNameTBP, item.approvedTBPText);
    final showApproval = _hasApprovalData(item);

    final noteText = (item.note ?? '').trim();
    final showNote = noteText.isNotEmpty;

    final showCargo = _isCommercialCargoCategory(item.category);

    final bottomLabel = arrangementLabel == 'Đã xếp'
        ? 'ĐÃ XẾP XE'
        : 'ĐANG CHỜ XẾP XE';
    final bookingId = item.id;
    final canEdit = arrangementLabel == 'Chưa xếp' &&
        bookingId != null &&
        bookingId > 0 &&
        item.isCancel != true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: FormCard(
              title: 'Chi tiết yêu cầu',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'HÌNH THỨC ĐẶT',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6,
                                color: AppColors.textTertiaryColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              categoryLine,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.secondaryERP,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _HeaderStatusBadge(
                        text: approvalLabel,
                        background: approvalColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _LabeledBlock(
                    label: 'DỰ ÁN',
                    title: projectParts.$1 == '-' && projectParts.$2 == '-'
                        ? '-'
                        : (projectParts.$1 == '-'
                              ? projectParts.$2
                              : projectParts.$1),
                    subtitle:
                        projectParts.$2 == '-' ||
                            projectParts.$2 == projectParts.$1
                        ? null
                        : projectParts.$2,
                  ),
                  const SizedBox(height: 16),
                  _RouteBox(departure: departure, destination: destination),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _TimeColumn(
                          icon: Icons.calendar_today_outlined,
                          iconColor: AppColors.gray,
                          label: timeCol1Label,
                          labelColor: AppColors.textTertiaryColor,
                          value: timeCol1Value,
                        ),
                      ),
                      if (showSecondTimeColumn) ...[
                        const SizedBox(width: 12),
                        Expanded(
                          child: _TimeColumn(
                            icon: Icons.schedule_outlined,
                            iconColor: AppColors.warning,
                            label: timeCol2Label,
                            labelColor: AppColors.warning,
                            value: timeCol2Value,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.directions_car_outlined,
                        size: 22,
                        color: AppColors.secondaryERP,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontSize: 15,
                              height: 1.25,
                            ),
                            children: [
                              TextSpan(
                                text: 'Loại phương tiện: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textTertiaryColor,
                                ),
                              ),
                              TextSpan(
                                text: vehicleLine,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.secondaryERP,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (showApproval) ...[
                    const SizedBox(height: 16),
                    _ApprovalBox(
                      approverName: approverName,
                      onInfoTap: () => _showApprovalInfo(context, item),
                    ),
                  ],
                  if (showCargo) ...[
                    const SizedBox(height: 16),
                    _CargoInfoSection(item: item, isPickup: cargoPickup),
                  ],
                  if (showNote) ...[
                    const SizedBox(height: 16),
                    _NoteSection(text: noteText),
                  ],
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: SizedBox(
              width: double.infinity,
              child: canEdit
                  ? ElevatedButton(
                      onPressed: () {
                        _openBookingVehicleEditAndPopToListIfSaved(
                          context,
                          item,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryERP,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Sửa',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Material(
                      color: AppColors.supportBtn,
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          bottomLabel,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.4,
                            color: arrangementLabel == 'Đã xếp'
                                ? AppColors.success
                                : AppColors.textTertiaryColor,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  static Color _approvalBadgeColor(String label) {
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

  static String _arrangementBadgeLabel(BookingVehicleItem item) {
    final plate = (item.licensePlate ?? '').trim();
    final driver = (item.driverName ?? '').trim();
    final charge = (item.nameVehicleCharge ?? '').trim();
    if (plate.isNotEmpty || driver.isNotEmpty || charge.isNotEmpty) {
      return 'Đã xếp';
    }
    return 'Chưa xếp';
  }

  static String _formatDestination(BookingVehicleItem i) {
    final c = (i.companyNameArrives ?? '').trim();
    final p = (i.provinceName ?? i.province ?? '').trim();
    final s = (i.specificDestinationAddress ?? '').trim();
    if (c.isNotEmpty && p.isNotEmpty) return '$c ($p)';
    if (s.isNotEmpty) return s;
    if (c.isNotEmpty) return c;
    if (p.isNotEmpty) return p;
    return '-';
  }

  static final DateFormat _displayTime = DateFormat('HH:mm - dd/MM/yyyy');

  static String _formatDisplayDateTime(String? text, DateTime? date) {
    if (date != null) return _displayTime.format(date);
    final t = (text ?? '').trim();
    if (t.isEmpty) return '-';
    final parsed =
        DateTime.tryParse(t.replaceFirst(' ', 'T')) ??
        _tryParseLooseDateTime(t);
    if (parsed != null) return _displayTime.format(parsed);
    return t;
  }

  static DateTime? _tryParseLooseDateTime(String raw) {
    final m = RegExp(
      r'^(\d{4})-(\d{2})-(\d{2})[ T](\d{2}):(\d{2}):(\d{2})',
    ).firstMatch(raw);
    if (m != null) {
      return DateTime(
        int.parse(m.group(1)!),
        int.parse(m.group(2)!),
        int.parse(m.group(3)!),
        int.parse(m.group(4)!),
        int.parse(m.group(5)!),
        int.parse(m.group(6)!),
      );
    }
    return null;
  }

  static bool _hasApprovalData(BookingVehicleItem i) {
    final n = (i.fullNameTBP ?? '').trim();
    final t = (i.approvedTBPText ?? '').trim();
    if (n.isNotEmpty && n != '-') return true;
    if (t.isNotEmpty && t != '-') return true;
    return false;
  }

  static bool _isCommercialCargoCategory(int? category) {
    if (category == null) return false;
    return category == BookingVehicleApiCategory.commercialDelivery ||
        category == BookingVehicleApiCategory.commercialPickup ||
        category == BookingVehicleApiCategory.demoExhibitionPickup ||
        category == BookingVehicleApiCategory.demoExhibitionDelivery;
  }

  static bool _isCommercialDeliveryCategory(int? category) {
    return category == BookingVehicleApiCategory.commercialDelivery ||
        category == BookingVehicleApiCategory.demoExhibitionDelivery;
  }

  static bool _isCargoPickup(int? category) {
    return category == BookingVehicleApiCategory.commercialPickup ||
        category == BookingVehicleApiCategory.demoExhibitionPickup;
  }

  static String _nonEmpty(String? a, String? b, [String? c]) {
    for (final v in [a, b, c]) {
      final s = (v ?? '').trim();
      if (s.isNotEmpty) return s;
    }
    return '-';
  }

  /// Cùng logic tách như [BookingVehicleCard].
  static (String, String) _splitProjectFullName(String? full) {
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

  static void _showApprovalInfo(BuildContext context, BookingVehicleItem i) {
    final lines = <String>[
      if ((i.approvedTBPText ?? '').trim().isNotEmpty)
        'Duyệt TBP: ${i.approvedTBPText!.trim()}',
      if ((i.decilineApprove ?? '').trim().isNotEmpty)
        'Từ chối: ${i.decilineApprove!.trim()}',
      if ((i.reasonDeciline ?? '').trim().isNotEmpty)
        'Lý do: ${i.reasonDeciline!.trim()}',
    ];

    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thông tin duyệt',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.secondaryERP,
              ),
            ),
            const SizedBox(height: 12),
            if (lines.isEmpty)
              Text(
                'Không có thêm thông tin.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondaryColor,
                ),
              )
            else
              ...lines.map(
                (t) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    t,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.35,
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _HeaderStatusBadge extends StatelessWidget {
  const _HeaderStatusBadge({required this.text, required this.background});

  final String text;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _NoteSection extends StatelessWidget {
  const _NoteSection({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'GHI CHÚ',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: AppColors.textTertiaryColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              height: 1.35,
              color: AppColors.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _CargoInfoSection extends StatelessWidget {
  const _CargoInfoSection({required this.item, required this.isPickup});

  final BookingVehicleItem item;
  final bool isPickup;

  @override
  Widget build(BuildContext context) {
    final contactLabel = isPickup ? 'Người giao' : 'Người nhận';
    final phoneLabel = isPickup ? 'SĐT người giao' : 'SĐT người nhận';

    final name = _trimOrDash(
      (item.receiverName ?? '').trim().isNotEmpty
          ? item.receiverName
          : item.deliverName,
    );
    final phone = _trimOrDash(
      (item.receiverPhoneNumber ?? '').trim().isNotEmpty
          ? item.receiverPhoneNumber
          : item.deliverPhoneNumber,
    );
    final pkg = _trimOrDash(item.packageName);
    final size = _trimOrDash(item.packageSize);
    final weight = _trimOrDash(item.packageWeight);
    final qty = item.packageQuantity != null ? '${item.packageQuantity}' : '-';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'THÔNG TIN HÀNG HÓA',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: AppColors.textTertiaryColor,
            ),
          ),
          const SizedBox(height: 10),
          _CargoRow(label: contactLabel, value: name),
          const SizedBox(height: 8),
          _CargoRow(label: phoneLabel, value: phone),
          const SizedBox(height: 8),
          _CargoRow(label: 'Tên kiện hàng', value: pkg),
          const SizedBox(height: 8),
          Text(
            'Kích thước (cm): $size - Cân nặng (kg): $weight',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryERP,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 8),
          _CargoRow(label: 'Số lượng kiện hàng', value: qty),
        ],
      ),
    );
  }

  static String _trimOrDash(String? v) {
    final s = (v ?? '').trim();
    return s.isEmpty ? '-' : s;
  }
}

class _CargoRow extends StatelessWidget {
  const _CargoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textTertiaryColor,
              height: 1.25,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryERP,
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}

class _LabeledBlock extends StatelessWidget {
  const _LabeledBlock({
    required this.label,
    required this.title,
    this.subtitle,
  });

  final String label;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: AppColors.textTertiaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.secondaryERP,
            height: 1.2,
          ),
        ),
        if (subtitle != null && subtitle!.trim().isNotEmpty) ...[
          const SizedBox(height: 2),
          Text(
            subtitle!,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textTertiaryColor,
              height: 1.2,
            ),
          ),
        ],
      ],
    );
  }
}

class _RouteBox extends StatelessWidget {
  const _RouteBox({required this.departure, required this.destination});

  final String departure;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.secondaryERP, width: 2),
                  color: Colors.transparent,
                ),
              ),
              const SizedBox(height: 4),
              const _DashedVertical(height: 28, color: AppColors.line),
              const SizedBox(height: 4),
              Icon(
                Icons.location_on_outlined,
                size: 18,
                color: AppColors.success,
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Xuất phát',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textTertiaryColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  departure,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondaryERP,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Cần đến',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textTertiaryColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  destination,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondaryERP,
                    height: 1.2,
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

class _DashedVertical extends StatelessWidget {
  const _DashedVertical({required this.height, required this.color});

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(2, height),
      painter: _DashedVerticalPainter(color: color),
    );
  }
}

class _DashedVerticalPainter extends CustomPainter {
  _DashedVerticalPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.2;
    const dash = 4.0;
    const gap = 3.0;
    var y = 0.0;
    final x = size.width / 2;
    while (y < size.height) {
      canvas.drawLine(
        Offset(x, y),
        Offset(x, (y + dash).clamp(0, size.height)),
        paint,
      );
      y += dash + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _TimeColumn extends StatelessWidget {
  const _TimeColumn({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.labelColor,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final Color labelColor;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: iconColor),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  color: labelColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondaryERP,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ApprovalBox extends StatelessWidget {
  const _ApprovalBox({required this.approverName, required this.onInfoTap});

  final String approverName;
  final VoidCallback onInfoTap;

  @override
  Widget build(BuildContext context) {
    final initials = _initials(approverName);

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.secondaryERP.withOpacity(0.12),
            child: Text(
              initials,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.secondaryERP,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'APPROVAL BY',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textTertiaryColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  approverName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondaryERP,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onInfoTap,
            icon: Icon(Icons.info_outline, color: AppColors.secondaryERP),
          ),
        ],
      ),
    );
  }

  static String _initials(String name) {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((e) => e.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) {
      final s = parts.first;
      return s.length >= 2 ? s.substring(0, 2).toUpperCase() : s.toUpperCase();
    }
    return ('${parts.first[0]}${parts.last[0]}').toUpperCase();
  }
}
