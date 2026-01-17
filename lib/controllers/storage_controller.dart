import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_news_article/models/article_item_model.dart';
import 'package:google_news_article/prefs/prefs_service.dart';

class StorageController extends GetxController {
  final PreferenceManager _preferenceManager = Get.find();
  final String _favoriteArticleListKey = 'favorite_article_list_key';
  final RxList<ArticleItemModel> _favoriteArticleList =
      <ArticleItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    loadFavoriteArticleList().then((v) {
      _favoriteArticleList.value = v;
    });
  }

  Future<void> saveFavoriteArticle(ArticleItemModel articleItemModel) async {
    _favoriteArticleList.add(articleItemModel);
    String jsonString = jsonEncode(
      _favoriteArticleList.map((e) => e.toJson()).toList(),
    );
    await _preferenceManager.setString(_favoriteArticleListKey, jsonString);
  }

  Future<void> removeFavoriteArticle(ArticleItemModel articleItemModel) async {
    _favoriteArticleList.remove(articleItemModel);
    String jsonString = jsonEncode(
      _favoriteArticleList.map((e) => e.toJson()).toList(),
    );
    await _preferenceManager.setString(_favoriteArticleListKey, jsonString);
  }

  Future<List<ArticleItemModel>> loadFavoriteArticleList() async {
    String? jsonString = await _preferenceManager.getString(
      _favoriteArticleListKey,
    );
    if (jsonString == '') {
      return [];
    }
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<ArticleItemModel> articleItemModelList = jsonList
        .map((json) => ArticleItemModel.fromJson(json))
        .toList();
    return articleItemModelList;
  }

  bool checkHasFavoriteArticle(ArticleItemModel articleItemModel) {
    return _favoriteArticleList.contains(articleItemModel);
  }
}
