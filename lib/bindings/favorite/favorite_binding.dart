import 'package:get/get.dart';
import 'package:google_news_article/controllers/favorite/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteController());
  }
}
