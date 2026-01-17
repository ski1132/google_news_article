import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_news_article/controllers/article/article_controller.dart';
import 'package:google_news_article/styles/style_constants.dart';
import 'package:google_news_article/utils/format/date_format.dart';
import 'package:google_news_article/utils/format/string_format.dart';
import 'package:google_news_article/widgets/image_view/image_url_widget.dart';
import 'package:google_news_article/widgets/text/text_custom.dart';
import 'package:sizer/sizer.dart';

class ArticlePage extends GetView<ArticleController> {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextCustom(
          'other_news'.tr,
          style: StyleConstants.textBlack14Bold,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, size: 28),
            onPressed: () {
              // Add favorite logic here
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(child: article())),
            Obx(() {
              final index = controller.articleList.indexOf(
                controller.articleModel.value,
              );
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white, // Text color
                          backgroundColor: index == 0
                              ? Colors.grey
                              : Colors.blue, // Background color
                          padding: const EdgeInsets.all(16.0),
                        ),
                        clipBehavior: Clip.hardEdge,
                        onPressed: controller.onPreviousArticle,
                        child: TextCustom(
                          'previous'.tr,
                          style: StyleConstants.textWhite14Bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextCustom(
                        '${index + 1} / ${controller.articleList.length}',
                        style: StyleConstants.textBlack12Bold,
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white, // Text color
                          backgroundColor:
                              index == controller.articleList.length - 1
                              ? Colors.grey
                              : Colors.green, // Background color
                          padding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30.0,
                            ), // Adjust the value for desired roundness
                          ),
                        ),
                        onPressed: controller.onNextArticle,
                        child: TextCustom(
                          'next'.tr,
                          style: StyleConstants.textWhite14Bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget article() {
    return Obx(() {
      final articleItemModel = controller.articleModel.value;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: Column(
            spacing: 16,
            children: [
              TextCustom(
                articleItemModel.title ?? '',
                style: StyleConstants.textBlack14Bold,
              ),
              ImageUrlWidget(
                articleItemModel.images?.thumbnail ?? '',
                width: 100.w,
                fit: BoxFit.fill,
              ),
              TextCustom(
                articleItemModel.snippet ?? '',
                style: StyleConstants.textBlack14,
                textOverflow: TextOverflow.visible,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextCustom(
                      articleItemModel.timestamp
                              ?.formatEpochToDateTime()
                              .formatDMYHM() ??
                          '',
                      style: StyleConstants.textBlack12,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: TextCustom(
                      articleItemModel.publisher ?? '',
                      style: StyleConstants.textBlack14Bold,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
