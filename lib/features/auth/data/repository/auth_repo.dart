// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Auth repository interface - login, getCurrentUser, updateDeviceToken

import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';
import '../datasource/models/auth_model.dart';
import '../datasource/models/user_model.dart';

abstract class AuthRepo {
  /// Đăng nhập - gọi API login, trả về LoginResponse.
  Future<Either<BaseError, LoginResponse?>> login({
    required String loginName,
    required String passwordHash,
  });

  /// Lấy thông tin user hiện tại từ API.
  Future<Either<BaseError, User?>> getCurrentUser();

  /// Cập nhật FCM device token lên server.
  Future<Either<BaseError, void>> updateDeviceToken(String fcmToken, String deviceId);
}
