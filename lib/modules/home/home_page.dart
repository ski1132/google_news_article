import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_news_article/controllers/home/home_controller.dart';
import 'package:google_news_article/models/article_item_model.dart';
import 'package:google_news_article/styles/style_constants.dart';
import 'package:google_news_article/widgets/image_view/image_url_widget.dart';
import 'package:google_news_article/widgets/text/text_custom.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(
                () => DropdownButton<String>(
                  value: controller.dropdownValue.value,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: controller.setDropdownValue,
                  items: controller.dropdownItems.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // Add favorite logic here
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () => Skeletonizer(
              enabled: controller.isLoading.value,
              child: ListView.separated(
                itemCount: controller.isLoading.value
                    ? 3
                    : controller.articleItemModelList.length,
                itemBuilder: (context, index) => controller.isLoading.value
                    ? _skeletonItem()
                    : _articleItem(controller.articleItemModelList[index]),
                separatorBuilder: (context, index) => const Divider(),
              ),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
            maxLine: 3,
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
