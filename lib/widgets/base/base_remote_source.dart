import 'package:dio/dio.dart';
import 'package:google_news_article/flavors/build_config.dart';
import 'package:google_news_article/models/response_api_model.dart';
import 'package:google_news_article/services/dio_provider.dart';
import 'package:google_news_article/services/error_handlers.dart';
import 'package:google_news_article/services/interceptors/base_exception.dart';

abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  final logger = BuildConfig.instance.config.logger;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        logger.e("Error: ${e.response?.statusCode}");
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.connectionError) {
        logger.e("Connection timed out");
      } else {
        logger.e("Unexpected error: ${e.message}");
      }
      final responseError =
          Response(
                requestOptions: RequestOptions(),
                statusMessage: e.message.toString(),
                statusCode: e.response?.statusCode,
              )
              as Response<T>;
      return responseError;
    } catch (error) {
      logger.e("Generic error: >>>>>>> $error");

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }

  ResponseApiModel parseResponse(Response<dynamic> response) {
    try {
      if (response.data != null) {
        if (response.data is Map<String, dynamic>) {
          (response.data as Map<String, dynamic>).addEntries(
            {'statusCode': response.statusCode ?? 0}.entries,
          );
          return ResponseApiModel.fromJson(response.data);
        } else {
          // กรณี response.data เป็น list
          return ResponseApiModel(
            status: response.statusCode == 1 || response.statusCode == 200,
            statusCode: response.statusCode ?? 0,
            data: (response.data as List<dynamic>),
          );
        }
      } else {
        response.data = {
          'statusCode': response.statusCode ?? 0,
          'message': response.statusMessage.toString(),
        };
        return ResponseApiModel.fromJson(response.data);
      }
    } catch (e) {
      response.data = {
        'statusCode': response.statusCode ?? 0,
        'message': response.statusMessage.toString(),
      };
      return ResponseApiModel.fromJson(response.data);
    }
  }
}
