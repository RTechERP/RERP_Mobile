import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../constants/constants.dart';
import 'error.dart';

extension DioErrorMessage on DioException {
  BaseError get baseError {
    BaseError errorMessage = const BaseError.httpUnknownError("unknown");
    switch (type) {
      case DioExceptionType.cancel:
        errorMessage = BaseError.httpUnknownError("dio.cancel_request".tr());
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = BaseError.httpUnknownError("dio.cancel_request".tr());
        break;
      case DioExceptionType.unknown:
        errorMessage = BaseError.httpUnknownError("dio.cancel_request".tr());
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = BaseError.httpUnknownError("dio.cancel_request".tr());
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = BaseError.httpUnknownError("dio.cancel_request".tr());
        break;
      case DioExceptionType.badResponse:
        final code = error;

        //handle refresh Token
        // if (error.type == StatusCode.refreshToken){
        //   await refreshToken(error);
        //   return;
        // }
        if (code == StatusCode.unauthorized) {
          errorMessage = const BaseError.httpUnAuthorizedError();
        } else {
          //todo: handle message =>
        }
        break;
      default:
        errorMessage = BaseError.httpUnknownError("dio.cancel_request".tr());
        break;
    }
    return errorMessage;
  }
}

extension BaseErrorMessage on BaseError {
  String get getErrorMessage {
    if (this is HttpInternalServerError) {
      return "HttpInternalServerError";
    } else if (this is HttpUnAuthorizedError) {
      return "HttpUnAuthorizedError";
    } else if (this is HttpUnknownError) {
      return (this as HttpUnknownError).message;
    }
    return "HttpUnknownError";
  }
}
