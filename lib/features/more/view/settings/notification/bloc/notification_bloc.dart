// Date: 14/04/2026 - Dev: NQHung
// Nội dung/Chức năng: BLoC quản lý notification settings - load/toggle notification types từ API

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../base/network/errors/extension.dart';
import '../../../../../auth/data/repository/auth_repo.dart';
import '../../../../data/datasource/models/notification_model.dart';
import '../../../../data/repository/more_repo.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.g.dart';
part 'notification_bloc.freezed.dart';

@injectable
class NotificationBloc extends BaseBloc<NotificationEvent, NotificationState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final MoreRepo _moreRepo;

  NotificationBloc(this._moreRepo, this._authRepo, this._log)
      : super(NotificationState.init()) {
    on<NotificationEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        toggleNotification: (typeLinkId, notificationTypeId, isSelected) =>
            _onToggleNotification(emit, typeLinkId, notificationTypeId, isSelected),
        toggleSystemPermission: (value) =>
            _onToggleSystemPermission(emit, value),
      );
    });
  }

  //---(Init)---//
  Future<void> _onInit(Emitter<NotificationState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final permissionStatus = await Permission.notification.status;
    final systemEnabled = permissionStatus.isGranted;

    final res = await _moreRepo.getTypeNotification();

    await res.fold(
      (err) async {
        _log.logE('❌ Get type notification failed: $err');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (data) async {
        final selectedCount = data.where((e) => e.isSelected).length;
        _log.logI('✅ Get type notification success - count: ${data.length}, selected: $selectedCount');

        emit(state.copyWith(
          status: BaseStateStatus.success,
          notification: data,
          systemPermissionEnabled: systemEnabled,
          selectedCount: selectedCount,
        ));
      },
    );
  }

  //---(Toggle)---//
  Future<void> _onToggleNotification(
    Emitter<NotificationState> emit,
    int typeLinkId,
    int notificationTypeId,
    bool isSelected,
  ) async {
    // Lấy userId từ getCurrentUser
    final userRes = await _authRepo.getCurrentUser();
    final user = userRes.getOrElse(() => null);
    final userId = user?.employeeId ?? 0;

    // Optimistic update - cập nhật UI trước (so sánh bằng notificationTypeId - unique)
    final updatedNotification = state.notification.map((item) {
      if (item.id == notificationTypeId) {
        return TypeNotiItem(
          id: item.id,
          typeName: item.typeName,
          createdDate: item.createdDate,
          createdBy: item.createdBy,
          updatedDate: item.updatedDate,
          updatedBy: item.updatedBy,
          isDeleted: item.isDeleted,
          isSelected: isSelected,
          typeLinkId: item.typeLinkId,
          userId: item.userId,
        );
      }
      return item;
    }).toList();

    final selectedCount = updatedNotification.where((e) => e.isSelected).length;

    emit(state.copyWith(
      notification: updatedNotification,
      selectedCount: selectedCount,
    ));

    // Gọi API save với payload:
    // ID = TypeLinkID (0 ban đầu, sau khi insert sẽ tự tăng)
    // NotificationTypeID = ID từ item
    final List<dynamic> payload = [
      {
        'ID': typeLinkId,
        'NotificationTypeID': notificationTypeId,
        'UserID': userId,
        'IsSelected': isSelected,
      },
    ];

    print('Giá trị của payload: $payload');

    final res = await _moreRepo.saveNotificationType(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('❌ Save notification type failed: $err');

        // Revert state nếu fail
        final revertedNotification = state.notification.map((item) {
          if (item.id == notificationTypeId) {
            return TypeNotiItem(
              id: item.id,
              typeName: item.typeName,
              createdDate: item.createdDate,
              createdBy: item.createdBy,
              updatedDate: item.updatedDate,
              updatedBy: item.updatedBy,
              isDeleted: item.isDeleted,
              isSelected: !isSelected,
              typeLinkId: item.typeLinkId,
              userId: item.userId,
            );
          }
          return item;
        }).toList();

        final revertedCount = revertedNotification.where((e) => e.isSelected).length;

        emit(state.copyWith(
          notification: revertedNotification,
          selectedCount: revertedCount,
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (_) async {
        _log.logI('✅ Save notification type success - typeLinkId: $typeLinkId, isSelected: $isSelected');

        // Emit success trước để UI feedback ngay
        emit(state.copyWith(
          notification: updatedNotification,
          selectedCount: selectedCount,
          status: BaseStateStatus.success,
        ));

        // Load lại dữ liệu để lấy TypeLinkID mới (sau khi insert sẽ tự tăng)
        final reloadRes = await _moreRepo.getTypeNotification();

        await reloadRes.fold(
          (err) async {
            _log.logE('❌ Reload notification type failed: $err');
          },
          (data) async {
            _log.logI('✅ Reload notification type success - new typeLinkId will be used for next operation');

            // Cập nhật state với dữ liệu mới (TypeLinkID đã được update từ API)
            final newSelectedCount = data.where((e) => e.isSelected).length;

            emit(state.copyWith(
              notification: data,
              selectedCount: newSelectedCount,
            ));
          },
        );
      },
    );
  }

  //---(System Permission)---//
  Future<void> _onToggleSystemPermission(
    Emitter<NotificationState> emit,
    bool value,
  ) async {
    if (value) {
      final result = await Permission.notification.request();
      if (!isClosed) {
        emit(state.copyWith(systemPermissionEnabled: result.isGranted));
      }
    } else {
      await openAppSettings();
      await Future.delayed(const Duration(milliseconds: 800));
      if (!isClosed) {
        await _onInit(emit);
      }
    }
  }
}
