import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:google_news_article/flavors/build_config.dart';
import 'package:google_news_article/flavors/env_config.dart';

class DioService extends GetxService {
  late Dio _dio;
  Dio get dio => _dio;

  EnvConfig get buildConfig => BuildConfig.instance.config;
  Map<String, Object> get headers => {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
    'x-rapidapi-host': buildConfig.host,
    'x-rapidapi-key': buildConfig.key,
  };

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: buildConfig.baseUrl,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: headers,
      ),
    );

    // Optional: Add interceptors for logging, authentication, etc.
    _dio.interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
      ChuckerDioInterceptor(),
    ]);
  }

  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.options.headers = header;
    return header;
  }
}
