import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_news_article/controllers/home/home_controller.dart';
import 'package:google_news_article/models/article_item_model.dart';
import 'package:google_news_article/repository/home_repository.dart';
import 'package:google_news_article/styles/style_constants.dart';
import 'package:google_news_article/utils/format/date_format.dart';
import 'package:google_news_article/utils/format/string_format.dart';
import 'package:google_news_article/widgets/image_view/image_url_widget.dart';
import 'package:google_news_article/widgets/text/text_custom.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          SizedBox(width: 20),
          Image.asset(
            'assets/images/google_news_icon.png',
            width: 60,
            height: 60,
          ),
          Spacer(),
          dropdown(),
          Spacer(),
          IconButton(
            icon: const Icon(Icons.format_list_bulleted, size: 32),
            onPressed: () => controller.routeToFavorite(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () =>
                !controller.isLoading.value &&
                    controller.articleItemModelList.isEmpty
                ? Center(
                    child: TextCustom(
                      controller.errorText.value,
                      style: StyleConstants.textBlack12,
                    ),
                  )
                : Skeletonizer(
                    enabled: controller.isLoading.value,
                    child: ListView.separated(
                      itemCount: controller.isLoading.value
                          ? 3
                          : controller.articleItemModelList.length,
                      itemBuilder: (context, index) =>
                          controller.isLoading.value
                          ? _skeletonItem()
                          : _articleItem(
                              controller.articleItemModelList[index],
                            ),
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget dropdown() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () => DropdownButtonHideUnderline(
            child: DropdownButton<ArticleType>(
              value: controller.dropdownValue.value,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              onChanged: controller.setDropdownValue,
              dropdownColor: Colors.white,
              items: controller.dropdownItems
                  .map<DropdownMenuItem<ArticleType>>((ArticleType value) {
                    return DropdownMenuItem<ArticleType>(
                      value: value,
                      child: TextCustom(
                        value.name.tr,
                        style: StyleConstants.textBlack14Bold,
                      ),
                    );
                  })
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  //widget item
  Widget _skeletonItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 16,
        children: [
          TextCustom(
            'Title skeleton Title skeleton Title skeleton',
            style: StyleConstants.textBlack14Bold,
          ),
          Container(
            width: 100.w,
            height: 30.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          TextCustom(
            'Snippet skeleton Snippet skeleton Snippet skeleton ...',
            style: StyleConstants.textBlack14,
            maxLine: 3,
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
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
