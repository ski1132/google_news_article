import 'package:get/get.dart';
import 'package:google_news_article/bindings/home/home_binding.dart';
import 'package:google_news_article/modules/home/home_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.home;
  static const defaultTransition = Transition.rightToLeft;

  static final List<GetPage> routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: defaultTransition,
    ),
  ];
}
