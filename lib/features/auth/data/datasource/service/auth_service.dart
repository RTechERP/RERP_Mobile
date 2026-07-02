// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Auth API service - login, getCurrentUser

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/common/constants.dart';

import '../../../../../base/network/dio/dio_base_api_service.dart';
import '../../repository/auth_repository.dart';
import '../models/auth_model.dart';
import '../models/user_model.dart';

@injectable
class AuthService extends DioBaseApiService {
  AuthService(super.dio);

  /// Gọi API login - trả về LoginResponse.
  /// [fcmToken] và [deviceId] được gửi kèm để server tự đăng ký FCM token.
  Future<LoginResponse> loginByPlatform(String loginName,
      String passwordHash, {
        String? fcmToken,
        String? deviceId,
      }) {
    return post<LoginResponse>(
      ApiEndPoint.loginMobile,
      body: {
        'LoginName': loginName,
        'PasswordHash': passwordHash,
        if (fcmToken != null) 'fcmToken': fcmToken,
        if (deviceId != null) 'deviceId': deviceId,
      },
      parser: (json) =>
          LoginResponse.fromJson(
            json as Map<String, dynamic>,
          ),
    );
  }

  /// Gọi API lấy thông tin user hiện tại.
  Future<User> getCurrentUser() async {
    final token = await AuthRepository.getToken();

    return get<User>(
      ApiEndPoint.currentUser,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
      parser: (json) => User.fromJson(
        (json['data'] ?? json) as Map<String, dynamic>,
      ),
    );
  }
}