// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Auth repository interface - login, getCurrentUser

import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';
import '../datasource/models/auth_model.dart';
import '../datasource/models/user_model.dart';

abstract class AuthRepo {
  /// Đăng nhập - gọi API login, trả về LoginResponse.
  /// [fcmToken] và [deviceId] được gửi kèm để server tự đăng ký FCM token.
  Future<Either<BaseError, LoginResponse?>> login({
    required String loginName,
    required String passwordHash,
    String? fcmToken,
    String? deviceId,
  });

  /// Lấy thông tin user hiện tại từ API.
  Future<Either<BaseError, User?>> getCurrentUser();

  /// Upload avatar lên server, trả về tên file đã lưu.
  Future<Either<BaseError, UploadAvatarResponse>> uploadAvatar(String filePath);

  /// Kiểm tra và set notification mặc định (true) cho user mới đăng nhập lần đầu.
  /// Chỉ chạy 1 lần duy nhất cho mỗi userId.
  Future<void> initDefaultNotificationsForNewUser({required int userId});
}
