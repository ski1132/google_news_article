import 'package:get/get.dart';

import '../prefs/prefs_service.dart';
import '../prefs/prefs_service_impl.dart';

class PrefsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreferenceManager>(
      () => PreferenceManagerImpl(),
      fenix: true, //คงไว้ถาวร ไว้ใช้งานได้ทุกเมื่อ
    );
  }
}
