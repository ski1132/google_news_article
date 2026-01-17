import 'package:get/get.dart';
import 'package:google_news_article/bindings/prefs_binding.dart';
import 'package:google_news_article/controllers/storage_controller.dart';
import 'package:google_news_article/services/dio_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    PrefsBindings().dependencies();
    Get.put(DioService(), permanent: true);
    Get.put(StorageController(), permanent: true);
  }
}
