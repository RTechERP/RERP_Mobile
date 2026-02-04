import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/network/dio/dio_base_api_service.dart';
import '../models/auth_model.dart';

@injectable
class AuthService extends DioBaseApiService {
  AuthService(Dio dio) : super(dio);

  Future<LoginResponse> loginByPlatform(String loginName, String passwordHash) {
    return post<LoginResponse>(
      '/rerpapi/api/home/login',
      body: {'LoginName': loginName, 'PasswordHash': passwordHash},
      parser: (json) => LoginResponse.fromJson(json),
    );
  }
}