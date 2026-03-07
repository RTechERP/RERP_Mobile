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
  Future<LoginResponse> loginByPlatform(
      String loginName,
      String passwordHash,
      ) {
    return post<LoginResponse>(
      ApiEndPoint.login,
      body: {
        'LoginName': loginName,
        'PasswordHash': passwordHash,
      },
      parser: (json) => LoginResponse.fromJson(
        json as Map<String, dynamic>,
      ),
    );
  }

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

