import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_news_article/flavors/build_config.dart';
import 'package:google_news_article/styles/color_constants.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

abstract class BaseView<Controller extends GetxController>
    extends GetView<Controller> {
  BaseView({super.key});

  @override
  String? get tag => null; // กำหนด tag ให้ controller

  final Logger logger = BuildConfig.instance.config.logger;

  Widget? buildCustom(BuildContext context) =>
      null; //ใช้ตอนอยากกำหนด Scaffold เอง

  PreferredSizeWidget? appBar(BuildContext context) =>
      null; // AppbarWidget().appBarIcon(context); อยากใช้ให้เรียกในหน้า page เอง

  Widget body(BuildContext context) =>
      const SizedBox(); //มี scaffold ครอบอยู่แล้ว

  Widget? bottomNavigationMenu() =>
      null; // BottomNavigationBarCustom(menu: NavigationMenu.home); อยากใช้ให้เรียกในหน้า page เอง

  @override
  Widget build(BuildContext context) {
    return buildCustom(context) == null
        ? GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: SizedBox(
                height: 100.h,
                width: 100.w,
                child: Scaffold(
                  backgroundColor: ColorConstants.transparent,
                  appBar: appBar(context),
                  body: SafeArea(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [Expanded(child: body(context))],
                        ),
                        bottomNavigationMenu() ?? SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : buildCustom(context) ?? SizedBox();
  }
}
