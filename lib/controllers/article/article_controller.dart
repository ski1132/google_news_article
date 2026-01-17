import 'package:get/get.dart';
import 'package:google_news_article/controllers/home/home_controller.dart';
import 'package:google_news_article/controllers/storage_controller.dart';
import 'package:google_news_article/models/article_item_model.dart';

class ArticleController extends GetxController {
  ArticleController(this.articleModel, this.articleType);

  final Rx<ArticleItemModel> articleModel;
  final String articleType;
  final List<ArticleItemModel> articleList = [];
  final RxBool isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();

    HomeController homeController = Get.find();
    articleList.addAll(homeController.articleItemModelList);
    checkFavorite();
  }

  void onPreviousArticle() {
    final index = articleList.indexOf(articleModel.value);
    if (index > 0) {
      articleModel.value = articleList[index - 1];
      checkFavorite();
    }
  }

  void onNextArticle() {
    final index = articleList.indexOf(articleModel.value);
    if (index < articleList.length - 1) {
      articleModel.value = articleList[index + 1];
      checkFavorite();
    }
  }

  void checkFavorite() {
    StorageController storageController = Get.find();
    isFavorite.value = storageController.checkHasFavoriteArticle(
      articleModel.value,
    );
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
    StorageController storageController = Get.find();
    if (isFavorite.value) {
      storageController.saveFavoriteArticle(articleModel.value);
    } else {
      storageController.removeFavoriteArticle(articleModel.value);
    }
  }
}
