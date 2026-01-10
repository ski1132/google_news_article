import 'package:get/get.dart';
import 'package:google_news_article/bindings/prefs_binding.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    PrefsBindings().dependencies();
    // Get.put(StorageController(), permanent: true);
  }
}
