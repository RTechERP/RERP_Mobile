import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../../../../reports/data/datasource/models/report_model.dart';
import '../model/general_form_model.dart';

@injectable
class GeneralFormService extends DioBaseApiService{
  GeneralFormService(super.dio);
  Future<BaseData<List<FormItem>>> getGeneralForm({
    required int departmentId,
  }) async {
    return get<BaseData<List<FormItem>>>(
      ApiEndPoint.getGeneralForm,
      query: {'departID': departmentId},
      parser: (json) =>
      BaseData<List<FormItem>>.fromJson(
        json,
            (data) =>
            ((data as List?) ?? const <dynamic>[])
                .map((e) => FormItem.fromJson(e as Map<String, dynamic>))
                .toList(),
      ),
    );
  }

  Future<BaseData<List<DepartResponse>>> getDepart() {
    return get<BaseData<List<DepartResponse>>>(
      ApiEndPoint.departForm,
      parser: (json) => BaseData<List<DepartResponse>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => DepartResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<FormDetailItem>>> getDocumentFile({
    required int documentId,
  }) async {
    return get<BaseData<List<FormDetailItem>>>(
      '${ApiEndPoint.getDocumentFile}/$documentId',
      parser: (json) => BaseData<List<FormDetailItem>>.fromJson(
        json,
        (data) => (data as List? ?? const <dynamic>[])
            .map((e) => FormDetailItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<Uint8List> downloadFile({
    required String key,
    required String fileName,
  }) async {
    final response = await dio.get<dynamic>(
      ApiEndPoint.downloadByKey,
      queryParameters: {
        'key': key,
        'fileName': fileName,
      },
    );

    // If response is a String (URL or text content)
    if (response.data is String) {
      final strData = response.data as String;
      // ignore: avoid_print
      print('[DownloadFile] response is String: $strData');
      // If it looks like a URL, return empty and let caller handle redirect
      if (strData.startsWith('http')) {
        // ignore: avoid_print
        print('[DownloadFile] Detected URL, returning empty - use URL download');
        return Uint8List(0);
      }
      // If it looks like base64, try to decode
      try {
        return base64Decode(strData);
      } catch (_) {
        return Uint8List(0);
      }
    }

    // If response is Map (JSON format)
    if (response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;
      final status = data['status'];

      // Error case: status == 0
      if (status == 0) {
        final message = data['message'] as String? ?? data['msg'] as String? ?? 'Có lỗi xảy ra';
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          message: message,
        );
      }

      // Success: extract data bytes
      final rawData = data['data'];

      if (rawData is List) {
        return Uint8List.fromList(rawData.cast<int>().toList());
      }
      if (rawData is String) {
        // If it's a URL string inside data field
        if (rawData.startsWith('http')) {
          // ignore: avoid_print
          print('[DownloadFile] data is URL: $rawData');
          return Uint8List(0);
        }
        // If it's base64 string
        try {
          return base64Decode(rawData);
        } catch (_) {
          return Uint8List(0);
        }
      }
    }

    // Fallback: raw bytes
    if (response.data is List) {
      return Uint8List.fromList((response.data as List).cast<int>().toList());
    }

    return Uint8List(0);
  }
}
