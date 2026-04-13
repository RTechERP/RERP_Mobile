// Date: 13/04/2026 - Dev: Claude
// Nội dung/Chức năng: Màn hình cài đặt thông báo - bật/tắt từng loại thông báo

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../common/app_theme/index.dart';
import '../../../../common/services/notification/notification_service.dart';

/// Màn hình cài đặt thông báo.
///
/// Master switch điều khiển quyền notification hệ thống.
/// Danh sách bật/tắt từng loại thông báo với chỉ tên + switch.
class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  final NotificationService _notificationService = NotificationService.instance;

  // Trạng thái quyền notification hệ thống
  bool _systemPermissionEnabled = false;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  // Danh sách các loại thông báo
  final List<_NotificationType> _notificationTypes = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  /// Tải trạng thái permission và cài đặt các loại thông báo.
  Future<void> _loadSettings() async {
    final status = await Permission.notification.status;
    final settings = await _notificationService.getAllSettings();

    _notificationTypes.clear();
    _notificationTypes.addAll([
      _NotificationType(
        key: 'leave',
        name: 'Đơn từ',
        icon: Icons.description_outlined,
        iconColor: const Color(0xFF2957A6),
        isSelected: settings['leave'] ?? true,
      ),
      _NotificationType(
        key: 'meeting',
        name: 'Cuộc họp',
        icon: Icons.meeting_room_outlined,
        iconColor: const Color(0xFFEE4623),
        isSelected: settings['meeting'] ?? true,
      ),
      _NotificationType(
        key: 'reminder',
        name: 'Nhắc nhở',
        icon: Icons.alarm_outlined,
        iconColor: const Color(0xFFF0891A),
        isSelected: settings['reminder'] ?? true,
      ),
      _NotificationType(
        key: 'message',
        name: 'Tin nhắn',
        icon: Icons.chat_outlined,
        iconColor: const Color(0xFF33B469),
        isSelected: settings['message'] ?? true,
      ),
      _NotificationType(
        key: 'report',
        name: 'Báo cáo',
        icon: Icons.analytics_outlined,
        iconColor: const Color(0xFF8B5CF6),
        isSelected: settings['report'] ?? false,
      ),
    ]);

    if (mounted) {
      setState(() {
        _permissionStatus = status;
        _systemPermissionEnabled = status.isGranted;
        _isLoading = false;
      });
    }

    debugPrint('[NotificationSettings] Permission status: $status');
  }

  /// Toggle master switch hệ thống.
  Future<void> _onSystemPermissionChanged(bool value) async {
    if (value) {
      await _turnOnNotifications();
    } else {
      await _turnOffNotifications();
    }
  }

  /// Bật notification - gọi request để hiện Allow/Not Allow dialog.
  /// Nếu đã permanentlyDenied → mở Settings.
  Future<void> _turnOnNotifications() async {
    // Đã granted → bật switch luôn
    if (_permissionStatus.isGranted) {
      setState(() => _systemPermissionEnabled = true);
      return;
    }

    // Gọi request — trả về trạng thái SAU KHI user quyết định
    final result = await Permission.notification.request();

    if (!mounted) return;

    // User chọn Not Allow / Deny → kiểm tra có bị permanentlyDenied không
    if (result.isPermanentlyDenied) {
      _showDeniedDialog();
      return;
    }

    setState(() {
      _permissionStatus = result;
      _systemPermissionEnabled = result.isGranted;
    });
  }

  /// Tắt notification - mở Settings để tắt thủ công.
  Future<void> _turnOffNotifications() async {
    if (_permissionStatus.isGranted) {
      await openAppSettings();
      await Future.delayed(const Duration(milliseconds: 800));
      await _loadSettings();
    } else {
      setState(() => _systemPermissionEnabled = false);
    }
  }

  /// Dialog khi bị permanentlyDenied - user đã từ chối nhiều lần.
  void _showDeniedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.notifications_off_outlined, color: AppColors.warning),
            SizedBox(width: 8),
            Text('Thông báo bị chặn'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bạn đã từ chối thông báo nhiều lần nên hệ thống không hiện lại dialog.',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text('Vui lòng bật quyền thông báo trong Cài đặt thiết bị.'),
            SizedBox(height: 12),
            Text(
              '📱 iOS: Cài đặt > Thông báo > RTC ERP > Bật Cho phép',
              style: TextStyle(fontSize: 12, color: AppColors.gray),
            ),
            SizedBox(height: 4),
            Text(
              '🤖 Android: Cài đặt > Ứng dụng > RTC ERP > Thông báo > Bật',
              style: TextStyle(fontSize: 12, color: AppColors.gray),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Để sau'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              openAppSettings();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryERP,
            ),
            child: const Text('Mở Cài đặt'),
          ),
        ],
      ),
    );
  }

  /// Toggle một loại thông báo.
  Future<void> _onNotificationTypeChanged(int index, bool value) async {
    final type = _notificationTypes[index];
    setState(() {
      _notificationTypes[index] = type.copyWith(isSelected: value);
    });

    switch (type.key) {
      case 'leave':
        await _notificationService.setLeaveNotifications(value);
        break;
      case 'meeting':
        await _notificationService.setMeetingNotifications(value);
        break;
      case 'reminder':
        await _notificationService.setReminderNotifications(value);
        break;
      case 'message':
        await _notificationService.setMessageNotifications(value);
        break;
      case 'report':
        await _notificationService.setReportNotifications(value);
        break;
    }
  }

  int get _selectedCount => _notificationTypes.where((t) => t.isSelected).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.heading, size: 20),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Thông báo',
          style: TextStyle(
            color: AppColors.heading,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryERP))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                //---(Master Switch)---//
                _buildMasterSwitch(),

                const SizedBox(height: 16),

                //---(Section title + count)---//
                _buildSectionHeader(),

                const SizedBox(height: 12),

                //---(Notification list)---//
                _buildNotificationList(),

                const SizedBox(height: 20),
              ],
            ),
    );
  }

  Widget _buildMasterSwitch() {
    final statusColor = _permissionStatus.isGranted
        ? AppColors.stateSuccessColor
        : AppColors.warning;
    final statusIcon = _permissionStatus.isGranted
        ? Icons.notifications_active
        : Icons.notifications_off_outlined;
    final statusText = _permissionStatus.isGranted
        ? 'Đang bật'
        : 'Chưa bật - Chạm để bật';

    return GestureDetector(
      onTap: () => _onSystemPermissionChanged(!_systemPermissionEnabled),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1A1A1A).withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(statusIcon, color: statusColor, size: 26),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thông báo hệ thống',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    statusText,
                    style: TextStyle(fontSize: 13, color: statusColor),
                  ),
                ],
              ),
            ),
            _CustomSwitch(
              value: _systemPermissionEnabled,
              onChanged: _onSystemPermissionChanged,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: _systemPermissionEnabled
                ? AppColors.primaryERP.withValues(alpha: 0.1)
                : AppColors.gray.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.notifications_active_outlined,
            size: 18,
            color: _systemPermissionEnabled ? AppColors.primaryERP : AppColors.gray,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            'Loại thông báo',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.heading,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: _selectedCount > 0 && _systemPermissionEnabled
                ? AppColors.stateSuccessColor.withValues(alpha: 0.1)
                : AppColors.gray.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$_selectedCount/${_notificationTypes.length}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: _selectedCount > 0 && _systemPermissionEnabled
                  ? AppColors.stateSuccessColor
                  : AppColors.gray,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationList() {
    return Opacity(
      opacity: _systemPermissionEnabled ? 1.0 : 0.5,
      child: IgnorePointer(
        ignoring: !_systemPermissionEnabled,
        child: Column(
          children: List.generate(_notificationTypes.length, (index) {
            final type = _notificationTypes[index];
            final isLast = index == _notificationTypes.length - 1;

            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
              child: _NotificationItem(
                icon: type.icon,
                iconColor: type.iconColor,
                name: type.name,
                isSelected: type.isSelected,
                onChanged: (value) => _onNotificationTypeChanged(index, value),
              ),
            );
          }),
        ),
      ),
    );
  }
}

/// Model cho một loại thông báo.
class _NotificationType {
  final String key;
  final String name;
  final IconData icon;
  final Color iconColor;
  final bool isSelected;

  const _NotificationType({
    required this.key,
    required this.name,
    required this.icon,
    required this.iconColor,
    required this.isSelected,
  });

  _NotificationType copyWith({bool? isSelected}) {
    return _NotificationType(
      key: key,
      name: name,
      icon: icon,
      iconColor: iconColor,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

/// Item thông báo đơn giản: icon + tên + switch.
class _NotificationItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String name;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  const _NotificationItem({
    required this.icon,
    required this.iconColor,
    required this.name,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A1A).withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.heading,
              ),
            ),
          ),
          _CustomSwitch(
            value: isSelected,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

/// Custom switch với animation.
class _CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const _CustomSwitch({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: 52,
        height: 30,
        decoration: BoxDecoration(
          color: value ? AppColors.stateSuccessColor : const Color(0xFFD1D5DB),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: (value ? AppColors.stateSuccessColor : const Color(0xFFD1D5DB))
                  .withValues(alpha: 0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.all(3),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
