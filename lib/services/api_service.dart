import 'dart:async';
import 'package:get/get.dart';

import 'interceptors/request_interceptor.dart';
import 'interceptors/response_interceptor.dart';
import 'url_path.dart';

class ApiService extends GetConnect {
  ApiService();

  @override
  void onInit() {
    httpClient.baseUrl = UrlPath.baseUrl;
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      requiresAuthToken ? 'Authorization' : '': '',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response = await httpClient.get(
      url,
      headers: customHeaders,
      query: query,
    );

    return response.body;
  }

  @override
  Future<Response<T>> post<T>(
    String? url,
    body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      requiresAuthToken ? 'Authorization' : '': '',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response = await httpClient.post(
      url,
      body: body,
      headers: customHeaders,
      query: query,
    );

    return response.body;
  }

  @override
  Future<Response<T>> put<T>(
    url,
    body, {
    String? contentType,
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    dynamic Function(double)? uploadProgress,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      requiresAuthToken ? 'Authorization' : '': '',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response = await httpClient.put(
      url,
      body: body,
      headers: customHeaders,
      query: query,
    );

    return response.body;
  }

  @override
  Future<Response<T>> delete<T>(
    String url, {
    String? contentType,
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      requiresAuthToken ? 'Authorization' : '': '',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response = await httpClient.delete(
      url,
      headers: customHeaders,
      query: query,
    );

    return response.body;
  }
}
