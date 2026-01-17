import 'package:get/get.dart';
import 'package:google_news_article/controllers/home/home_controller.dart';
import 'package:google_news_article/models/article_item_model.dart';

class ArticleController extends GetxController {
  ArticleController(this.articleModel, this.articleType);

  final Rx<ArticleItemModel> articleModel;
  final String articleType;
  final List<ArticleItemModel> articleList = [];

  @override
  void onInit() {
    super.onInit();

    HomeController homeController = Get.find();
    articleList.addAll(homeController.articleItemModelList);
  }

  void onPreviousArticle() {
    final index = articleList.indexOf(articleModel.value);
    if (index > 0) {
      articleModel.value = articleList[index - 1];
    }
  }

  void onNextArticle() {
    final index = articleList.indexOf(articleModel.value);
    if (index < articleList.length - 1) {
      articleModel.value = articleList[index + 1];
    }
  }
}
