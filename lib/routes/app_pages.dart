import 'package:get/get.dart';
import 'package:google_news_article/bindings/article/article_binding.dart';
import 'package:google_news_article/bindings/favorite/favorite_binding.dart';
import 'package:google_news_article/bindings/home/home_binding.dart';
import 'package:google_news_article/modules/article/article_page.dart';
import 'package:google_news_article/modules/favorite/favorite_page.dart';
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
    GetPage(
      name: _Paths.article,
      page: () => ArticlePage(),
      binding: ArticleBinding(),
      transition: defaultTransition,
    ),
    GetPage(
      name: _Paths.favorite,
      page: () => FavoritePage(),
      binding: FavoriteBinding(),
      transition: defaultTransition,
    ),
  ];
}
