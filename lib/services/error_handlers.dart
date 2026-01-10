import 'dart:io';

import 'package:dio/dio.dart';
import 'package:google_news_article/flavors/build_config.dart';

import 'interceptors/api_exception.dart';
import 'interceptors/not_found_exception.dart';
import 'interceptors/response_interceptor.dart';
import 'interceptors/service_unavailable_exception.dart';

AppException handleError(String error) {
  final logger = BuildConfig.instance.config.logger;
  // final logger = AppConfig.logger;
  logger.e("Generic exception: $error");

  return AppException(message: error);
}

Object handleDioError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.cancel:
      return AppException(message: "Request to API server was cancelled");
    case DioExceptionType.badCertificate:
      return AppException(message: "Request to API server was badCertificate");
    case DioExceptionType.badResponse:
      return AppException(message: "Request to API server was badResponse");
    case DioExceptionType.connectionError:
      return AppException(message: "Request to API server was connectionError");
    case DioExceptionType.connectionTimeout:
      return AppException(
        message: "Request to API server was connectionTimeout",
      );
    case DioExceptionType.receiveTimeout:
      return AppException(message: "Request to API server was receiveTimeout");
    case DioExceptionType.sendTimeout:
      return AppException(message: "Request to API server was sendTimeout");
    case DioExceptionType.unknown:
      return _parseDioErrorResponse(dioError);
  }
}

Exception _parseDioErrorResponse(DioException dioError) {
  final logger = BuildConfig.instance.config.logger;
  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;

  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data["statusCode"];
    }
    status = dioError.response?.data["status"];
    serverMessage = dioError.response?.data["message"];
  } catch (e, s) {
    logger.i("$e");
    logger.i(s.toString());

    serverMessage = "Something went wrong. Please try again later.";
  }

  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException("Service Temporarily Unavailable");
    case HttpStatus.notFound:
      return NotFoundException(serverMessage ?? "", status ?? "");
    default:
      return ApiException(
        httpCode: statusCode,
        status: status ?? "",
        message: serverMessage ?? "",
      );
  }
}
