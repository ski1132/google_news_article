import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_news_article/flavors/build_config.dart';
import 'package:logger/logger.dart';
import '../../services/interceptors/response_interceptor.dart';

abstract class BaseController extends GetxController {
  final PreferredSizeWidget? appBar = null;
  // final Logger logger = AppConfig.logger;
  final Logger logger = BuildConfig.instance.config.logger;

  final dio = Dio();
  // AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final logoutController = false.obs;

  Future<void> showLoading() => EasyLoading.show();

  Future<void> hideLoading() => EasyLoading.dismiss();

  final _messageController = ''.obs;

  String get message => _messageController.value;

  String showMessage(String msg) => _messageController(msg);

  final _errorMessageController = ''.obs;

  String get errorMessage => _errorMessageController.value;

  void showErrorMessage(String msg) {
    _errorMessageController(msg);
  }

  final _successMessageController = ''.obs;

  String get successMessage => _messageController.value;

  String showSuccessMessage(String msg) => _successMessageController(msg);

  // ignore: long-parameter-list
  Future callDataService<T>(
    Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
    bool hasLoading = true,
  }) async {
    Exception? exception;
    onStart == null
        ? hasLoading
              ? showLoading()
              : {}
        : onStart();
    try {
      // final T response = await dio.get('https://google.com');
      final T response = await future;
      if (onSuccess != null) {
        onSuccess(response);
      }
      // final ResponseApiModel responseModel = response as ResponseApiModel;
      // if ((responseModel.statusCode ?? 0) == 401 ||
      //     (responseModel.statusCode ?? 0) == 500) {
      //   logger.e(
      //       "${responseModel.statusCode} Unauthorized: Token or credentials are incorrect.");
      //   UserController userController = Get.find();
      //   userController.resetValue();
      //   Get.offAllNamed(AppRoutes.login);
      //   CustomToast.showToast(
      //       '${'token_expire'.tr} ${'please_login_again'.tr}');
      // } else {
      //   if (onSuccess != null) {
      //     onSuccess(response);
      //   }
      // }
      onComplete == null
          ? hasLoading
                ? hideLoading()
                : {}
          : onComplete();
      return;
    } on AppException catch (exceptionCatch) {
      exception = exceptionCatch;
      showErrorMessage(exceptionCatch.message);
    } catch (error) {
      exception = AppException(message: "$error");
      logger.e("Controller>>>>>> error $error");
    }

    if (onError != null) onError(exception);
    onComplete == null
        ? hasLoading
              ? hideLoading()
              : {}
        : onComplete();
  }

  @override
  void onClose() {
    _messageController.close();
    super.onClose();
  }
}
