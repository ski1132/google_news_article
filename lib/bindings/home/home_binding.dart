import 'package:get/get.dart';
import 'package:google_news_article/controllers/home/home_controller.dart';
import 'package:google_news_article/remote/home_remote.dart';
import 'package:google_news_article/repository/home_repository.dart';
import 'package:google_news_article/repository/home_repository_impl.dart';
import 'package:google_news_article/services/dio_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeRemote>(HomeRemote(Get.find<DioService>().dio));
    Get.put<HomeRepository>(HomeRepositoryImpl());
    Get.put(HomeController());
  }
}
