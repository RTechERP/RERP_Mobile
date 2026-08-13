import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../common/constants.dart';

@injectable
class SignatureService extends DioBaseApiService {
  SignatureService(super.dio);

  Future<Uint8List?> getEmployeeSignature() async {
    final res = await dio.get(
      ApiEndPoint.getEmployeeSignature,
      options: Options(responseType: ResponseType.bytes),
    );
    return res.data as Uint8List?;
  }
}
