import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_news_article/flavors/build_config.dart';
import 'package:logger/logger.dart';

abstract class BaseController extends GetxController {
  final PreferredSizeWidget? appBar = null;

  final Logger logger = BuildConfig.instance.config.logger;

  Future<void> showLoading() => EasyLoading.show();

  Future<void> hideLoading() => EasyLoading.dismiss();
}
