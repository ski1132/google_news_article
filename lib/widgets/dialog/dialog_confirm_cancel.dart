// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/color_constants.dart';
import '../../styles/value_constants.dart';
import '../../styles/style_constants.dart';
import '../container/container_curved.dart';
import '../text/text_custom.dart';

class DialogConfirmCancel extends StatelessWidget {
  final String title;
  final String? message;
  final Function()? onConfirm;
  final String? textConfirm;
  final Color confirmButtonColor;
  final Function()? onCancel;
  final String? textCancel;
  final Color cancelButtonColor;

  const DialogConfirmCancel({
    super.key,
    required this.title,
    this.message,
    this.onConfirm,
    this.textConfirm,
    this.confirmButtonColor = ColorConstants.colorGreen,
    this.onCancel,
    this.textCancel,
    this.cancelButtonColor = ColorConstants.colorGrey2,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorConstants.colorPrimary,
      insetPadding: const EdgeInsets.all(AppValues.iconDefaultSize),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.close_rounded,
                color: ColorConstants.colorWhite,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppValues.padding24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: StyleConstants.textWhite20,
                ).paddingOnly(bottom: AppValues.padding16),
                message != null
                    ? Text(
                        message!,
                        style: StyleConstants.textWhite20,
                      ).paddingOnly(bottom: AppValues.padding16)
                    : const SizedBox(),
                Row(
                  children: onCancel == null
                      ? [
                          Expanded(
                            child: ContainerCurved(
                              backgroundColor: confirmButtonColor,
                              onTap: onConfirm ?? () => Get.back(),
                              child: TextCustom(
                                textConfirm ?? 'confirm'.tr,
                                style: StyleConstants.textWhite16Bold,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ]
                      : [
                          Expanded(
                            child: ContainerCurved(
                              backgroundColor: cancelButtonColor,
                              borderColor: ColorConstants.colorGrey2,
                              onTap:
                                  onCancel ??
                                  () {
                                    Get.back();
                                  },
                              child: TextCustom(
                                textCancel ?? 'cancel'.tr,
                                style: StyleConstants.textWhite16Bold,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppValues.padding16),
                          Expanded(
                            child: ContainerCurved(
                              backgroundColor: confirmButtonColor,
                              onTap: onConfirm,
                              child: TextCustom(
                                textConfirm ?? 'confirm'.tr,
                                style: StyleConstants.textWhite16Bold,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
