import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../styles/color_constants.dart';
import '../../styles/value_constants.dart';
import '../../styles/style_constants.dart';
import '../container/container_curved.dart';
import '../text/text_custom.dart';

class BasicAlertWidget {
  static Future alertWarning({String contents = ""}) async {
    if (Get.isDialogOpen ?? false) Get.back();
    await Get.defaultDialog(
      contentPadding: const EdgeInsets.all(AppValues.padding16),
      backgroundColor: ColorConstants.colorWhite,
      title: 'warning'.tr,
      titleStyle: StyleConstants.textBlack20,
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 70.h, // จำกัดความสูงไม่เกิน 70% ของจอ
        ),
        child: SingleChildScrollView(
          child: TextCustom(
            contents,
            style: StyleConstants.textBlack16,
            textAlign: TextAlign.center,
            textOverflow: TextOverflow.visible,
          ),
        ),
      ),
      confirm: ContainerCurved(
        onTap: () => Get.back(),
        borderColor: ColorConstants.colorBlack,
        child: TextCustom('confirm'.tr, style: StyleConstants.textBlack12),
      ),
    );
  }
}
