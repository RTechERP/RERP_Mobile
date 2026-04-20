// Date: 13/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình cài đặt thông báo - bật/tắt notification types từ API

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../base/bloc/index.dart';
import '../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../base/widgets/base_widget.dart';
import '../../../../../../common/utils/snack_bar_helper.dart';
import '../bloc/notification_bloc.dart';
import '../widgets/notification_item.dart';
import '../widgets/notification_switch.dart';

/// Màn hình cài đặt thông báo.
///
/// Master switch điều khiển quyền notification hệ thống.
/// Danh sách notification types được load từ API.
class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends BaseState<NotificationSettingsScreen, NotificationEvent,
        NotificationState, NotificationBloc> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const NotificationEvent.init());
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<NotificationBloc, NotificationState>(
      listenWhen: (prev, curr) =>
          prev.status != curr.status ||
          (curr.message != null && prev.message != curr.message),
      listener: (context, state) {
        if (state.status == BaseStateStatus.failed &&
            state.message != null) {
          showMessage(context, state.message!, type: SnackBarType.error);
        }
      },
      child: BlocBuilder<NotificationBloc, NotificationState>(
        bloc: bloc,
        builder: (context, state) {
          final isLoading = state.status == BaseStateStatus.loading ||
              state.status == BaseStateStatus.init;

          return BaseScaffold(
            backgroundColor: const Color(0xFFF0F2F5),
            appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              centerTitle: false,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    color: AppColors.heading, size: 20),
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
            body: isLoading
                ? const Center(
                    child:
                        CircularProgressIndicator(color: AppColors.primaryERP))
                : ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildMasterSwitch(context, state),
                      const SizedBox(height: 16),
                      _buildSectionHeader(state),
                      const SizedBox(height: 12),
                      _buildNotificationList(context, state),
                      const SizedBox(height: 20),
                    ],
                  ),
          );
        },
      ),
    );
  }

  Widget _buildMasterSwitch(BuildContext context, NotificationState state) {
    final systemEnabled = state.systemPermissionEnabled;
    final statusColor = systemEnabled
        ? AppColors.stateSuccessColor
        : AppColors.warning;
    final statusIcon = systemEnabled
        ? Icons.notifications_active
        : Icons.notifications_off_outlined;
    final statusText = systemEnabled ? 'Đang bật' : 'Chưa bật - Chạm để bật';

    return GestureDetector(
      onTap: () => _onSystemPermissionChanged(context, !systemEnabled),
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
            NotificationSwitch(
              value: systemEnabled,
              onChanged: (value) =>
                  _onSystemPermissionChanged(context, value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(NotificationState state) {
    final systemEnabled = state.systemPermissionEnabled;
    final selectedCount = state.selectedCount;
    final totalCount = state.notification.length;

    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: systemEnabled
                ? AppColors.primaryERP.withValues(alpha: 0.1)
                : AppColors.gray.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.notifications_active_outlined,
            size: 18,
            color: systemEnabled ? AppColors.primaryERP : AppColors.gray,
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
            color: selectedCount > 0 && systemEnabled
                ? AppColors.stateSuccessColor.withValues(alpha: 0.1)
                : AppColors.gray.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$selectedCount/$totalCount',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: selectedCount > 0 && systemEnabled
                  ? AppColors.stateSuccessColor
                  : AppColors.gray,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationList(
      BuildContext context, NotificationState state) {
    final systemEnabled = state.systemPermissionEnabled;
    final notifications = state.notification;

    return Opacity(
      opacity: systemEnabled ? 1.0 : 0.5,
      child: IgnorePointer(
        ignoring: !systemEnabled,
        child: Column(
          children: List.generate(notifications.length, (index) {
            final item = notifications[index];
            final isLast = index == notifications.length - 1;

            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
              child: NotificationItem(
                item: item,
                onChanged: (value) => _onNotificationTypeChanged(
                  context,
                  item.typeLinkId,
                  item.id,
                  value,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _onNotificationTypeChanged(
    BuildContext context,
    int typeLinkId,
    int notificationTypeId,
    bool value,
  ) {
    bloc.add(
      NotificationEvent.toggleNotification(
        typeLinkId: typeLinkId,
        notificationTypeId: notificationTypeId,
        isSelected: value,
      ),
    );
  }

  Future<void> _onSystemPermissionChanged(
    BuildContext context,
    bool value,
  ) async {
    if (value) {
      await _turnOnNotifications(context);
    } else {
      await _turnOffNotifications(context);
    }
  }

  Future<void> _turnOnNotifications(BuildContext context) async {
    final status = await Permission.notification.status;

    if (status.isGranted) {
      bloc.add(const NotificationEvent.toggleSystemPermission(value: true));
      return;
    }

    final result = await Permission.notification.request();

    if (result.isPermanentlyDenied) {
      if (mounted) {
        _showDeniedDialog(context);
      }
      return;
    }

    if (mounted) {
      bloc.add(
          NotificationEvent.toggleSystemPermission(value: result.isGranted));
    }
  }

  Future<void> _turnOffNotifications(BuildContext context) async {
    await openAppSettings();
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      bloc.add(const NotificationEvent.init());
    }
  }

  void _showDeniedDialog(BuildContext context) {
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
}
