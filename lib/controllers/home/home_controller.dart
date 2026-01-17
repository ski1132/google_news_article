import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:google_news_article/models/article_item_model.dart';
import 'package:google_news_article/repository/home_repository.dart';
import 'package:google_news_article/routes/app_pages.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  final repository = Get.find<HomeRepository>();

  final dropdownValue = ArticleType.latest.obs;
  final List<ArticleType> dropdownItems = ArticleType.values.toList();

  final RxBool isLoading = false.obs;
  final RxList<ArticleItemModel> articleItemModelList =
      <ArticleItemModel>[].obs;

  final RxString errorText = 'no_data'.tr.obs;

  @override
  void onInit() {
    super.onInit();

    fetchArticleList(ArticleType.latest);
  }

  void setDropdownValue(ArticleType? value) {
    if (value != null) {
      dropdownValue.value = value;
      fetchArticleList(value);
    }
  }

  void fetchArticleList(ArticleType articleType) async {
    articleItemModelList.clear();
    isLoading.value = true;
    await repository
        .getArticleByType(articleType)
        .then((response) async {
          try {
            if (response.status == 'success') {
              articleItemModelList.addAll(response.items);
            } else {
              Logger().e(
                'fetchArticleList response status ${response.status} : ${response.message}',
              );
              errorText.value = response.message.toString();
            }
          } catch (e) {
            errorText.value = e.toString();
            Logger().e('fetchArticleList catch : $e');
          }
        })
        .onError((e, s) async {
          if (e is DioException) {
            if (e.response?.statusCode == 422 ||
                e.response?.statusCode == 429) {
              errorText.value = 'exceed_limit'.tr;
            } else {
              errorText.value = e.message.toString();
            }
          } else {
            errorText.value = e.toString();
          }
          Logger().e('fetchArticleList onError : $e');
        })
        .whenComplete(() {
          isLoading.value = false;
        });
  }

  void routeToArticle(ArticleItemModel articleItemModel) {
    Get.toNamed(
      AppRoutes.article,
      arguments: {
        'articleModel': articleItemModel,
        'articleType': dropdownValue.value.name.tr,
      },
    );
  }
}
