import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';
import 'package:rtc_erp/common/constants.dart';
import '../models/pin_verify_model.dart';

@injectable
class SalaryPinService extends DioBaseApiService {
  SalaryPinService(super.dio);

  Future<BaseData<CheckPinResponse>> checkPin() async {
    return get<BaseData<CheckPinResponse>>(
      ApiEndPoint.checkPin,
      parser: (json) => BaseData<CheckPinResponse>.fromJson(
        json,
        (data) => CheckPinResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<SetPinResponse>> setPin({required String pin}) async {
    return post<BaseData<SetPinResponse>>(
      ApiEndPoint.setPin,
      body: {'pin': pin},
      parser: (json) => BaseData<SetPinResponse>.fromJson(
        json,
        (data) => SetPinResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<VerifiedPinResponse>> verifyPin({required String pin}) async {
    return post<BaseData<VerifiedPinResponse>>(
      ApiEndPoint.verifyPin,
      body: {'pin': pin},
      parser: (json) => BaseData<VerifiedPinResponse>.fromJson(
        json,
        (data) => VerifiedPinResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<RequestPinResponse>> requestPin() async {
    return get<BaseData<RequestPinResponse>>(
      ApiEndPoint.requestPin,
      parser: (json) => BaseData<RequestPinResponse>.fromJson(
        json,
        (data) => RequestPinResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<RequestPinResponse>> requestResetPin() async {
    return post<BaseData<RequestPinResponse>>(
      ApiEndPoint.requestResetPin,
      parser: (json) => BaseData<RequestPinResponse>.fromJson(
        json,
        (data) => RequestPinResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<ValidateTokenResponse>> validateToken({
    required String token,
  }) async {
    return post<BaseData<ValidateTokenResponse>>(
      ApiEndPoint.validateToken,
      body: '"$token"',
      parser: (json) => BaseData<ValidateTokenResponse>.fromJson(
        json,
        (data) => ValidateTokenResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<ResetPinResponse>> resetPin({
    required String newPin,
    required String confirmPin,
    required String token,
  }) async {
    return post<BaseData<ResetPinResponse>>(
      ApiEndPoint.resetPin,
      body: {'newPin': newPin, 'confirmPin': confirmPin, 'token': token},
      parser: (json) => BaseData<ResetPinResponse>.fromJson(
        json,
        (data) => ResetPinResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }
}
