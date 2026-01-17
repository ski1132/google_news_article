import 'package:get/get.dart';
import 'package:google_news_article/controllers/article/article_controller.dart';
import 'package:google_news_article/models/article_item_model.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    final dynamic args = Get.arguments;
    final articleModel = args['articleModel'] as ArticleItemModel;
    final articleType = args['articleType'] as String;
    Get.put(ArticleController(articleModel.obs, articleType));
  }
}
