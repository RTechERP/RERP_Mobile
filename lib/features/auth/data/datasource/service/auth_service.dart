import 'package:injectable/injectable.dart';
import 'package:rtc_erp/common/constants.dart';

import '../../../../../base/network/dio/dio_base_api_service.dart';
import '../models/auth_model.dart';

@injectable
class AuthService extends DioBaseApiService {
  AuthService(super.dio);

  // Future<BaseData<LoginResponse>> loginByPlatform(
  //     String loginName,
  //     String passwordHash,
  //     ) {
  //   return post<BaseData<LoginResponse>>(
  //     ApiEndPoint.login,
  //     body: {
  //       'LoginName': loginName,
  //       'PasswordHash': passwordHash,
  //     },
  //     parser: (json) => BaseData<LoginResponse>.fromJson(
  //       json,
  //           (data) => LoginResponse.fromJson(data as Map<String, dynamic>),
  //     ),
  //   );
  // }

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

}

