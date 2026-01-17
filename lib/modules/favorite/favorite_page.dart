import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_news_article/controllers/favorite/favorite_controller.dart';
import 'package:google_news_article/models/article_item_model.dart';
import 'package:google_news_article/styles/style_constants.dart';
import 'package:google_news_article/utils/format/date_format.dart';
import 'package:google_news_article/utils/format/string_format.dart';
import 'package:google_news_article/widgets/image_view/image_url_widget.dart';
import 'package:google_news_article/widgets/text/text_custom.dart';
import 'package:sizer/sizer.dart';

class FavoritePage extends GetView<FavoriteController> {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TextCustom(
          'saved_articles'.tr,
          style: StyleConstants.textBlack14Bold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () => controller.favoriteList.isEmpty
                ? Center(
                    child: TextCustom(
                      'no_data'.tr,
                      style: StyleConstants.textBlack12,
                    ),
                  )
                : ListView.separated(
                    itemCount: controller.favoriteList.length,
                    itemBuilder: (context, index) =>
                        _articleItem(controller.favoriteList[index]),
                    separatorBuilder: (context, index) => const Divider(),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _articleItem(ArticleItemModel articleItemModel) {
    return InkWell(
      onTap: () => controller.routeToArticle(articleItemModel),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 16,
          children: [
            TextCustom(
              articleItemModel.title ?? '',
              style: StyleConstants.textBlack14Bold,
              maxLine: 2,
              textOverflow: TextOverflow.ellipsis,
            ),
            ImageUrlWidget(
              articleItemModel.images?.thumbnail ?? '',
              width: 100.w,
              fit: BoxFit.fill,
            ),
            TextCustom(
              articleItemModel.snippet ?? '',
              style: StyleConstants.textBlack14,
              maxLine: 3,
              textOverflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Expanded(
                  child: TextCustom(
                    articleItemModel.timestamp
                            ?.formatEpochToDateTime()
                            .formatDMYHM(symbol: ' ') ??
                        '',
                    style: StyleConstants.textBlack12,
                  ),
                ),
                TextCustom(
                  articleItemModel.publisher ?? '',
                  style: StyleConstants.textBlack14Bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
