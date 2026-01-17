import 'package:get/get.dart';
import 'package:google_news_article/models/article_item_model.dart';
import 'package:google_news_article/repository/home_repository.dart';
import 'package:google_news_article/widgets/dialog/basic_alert_widget.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  final repository = Get.find<HomeRepository>();

  final dropdownValue = ArticleType.latest.name.obs;
  final List<String> dropdownItems = ArticleType.values
      .map((e) => e.name)
      .toList();

  final RxBool isLoading = false.obs;
  final RxList<ArticleItemModel> articleItemModelList =
      <ArticleItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchArticleList(ArticleType.latest);
  }

  void setDropdownValue(String? value) {
    if (value != null) {
      dropdownValue.value = value;
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
                'fetchBannerList response status ${response.status} : ${response.message}',
              );
              BasicAlertWidget.alertWarning(
                contents: response.message.toString(),
              );
            }
          } catch (e) {
            BasicAlertWidget.alertWarning(contents: '${e.toString()}!');
            Logger().e('fetchBannerList catch : $e');
          }
        })
        .onError((e, s) async {
          BasicAlertWidget.alertWarning(contents: e.toString());
          Logger().e('fetchBannerList onError : $e');
        })
        .whenComplete(() {
          isLoading.value = false;
        });
  }
}
