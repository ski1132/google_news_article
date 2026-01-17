import 'package:get/get.dart';
import 'package:google_news_article/controllers/storage_controller.dart';
import 'package:google_news_article/models/article_item_model.dart';
import 'package:google_news_article/routes/app_pages.dart';

class FavoriteController extends GetxController {
  RxList<ArticleItemModel> favoriteList = RxList<ArticleItemModel>([]);

  @override
  void onInit() {
    super.onInit();

    loadFavoriteArticleList();
  }

  void loadFavoriteArticleList() {
    StorageController storageController = Get.find();
    storageController.loadFavoriteArticleList().then(
      (articleItemModelList) => favoriteList.value = articleItemModelList,
    );
  }

  void routeToArticle(ArticleItemModel articleItemModel) {
    Get.toNamed(
      AppRoutes.article,
      arguments: {
        'articleModel': articleItemModel,
        'articleType': 'saved_article'.tr,
        'articleList': favoriteList,
      },
    )?.then((v) => loadFavoriteArticleList());
  }
}
