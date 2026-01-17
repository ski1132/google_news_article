import 'package:get/get.dart';
import 'package:google_news_article/models/article_response_model.dart';
import 'package:google_news_article/remote/home_remote.dart';
import 'package:google_news_article/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemote remoteSource = Get.find();
  final String defaultLang = 'en-US';

  @override
  Future<ArticleResponseModel> getArticleByType(ArticleType type) {
    return switch (type) {
      ArticleType.latest => getArticleLatestList(),
      ArticleType.world => getArticleWorldList(),
      ArticleType.business => getArticleBusinessList(),
      ArticleType.entertainment => getArticleEntertainmentList(),
      ArticleType.health => getArticleHealthList(),
      ArticleType.science => getArticleScienceList(),
      ArticleType.sport => getArticleSportList(),
      ArticleType.technology => getArticleTechnologyList(),
    };
  }

  @override
  Future<ArticleResponseModel> getArticleLatestList({String? lang}) {
    return remoteSource.getArticleLatestList(lr: lang ?? defaultLang);
  }

  @override
  Future<ArticleResponseModel> getArticleWorldList({String? lang}) {
    return remoteSource.getArticleWorldList(lr: lang ?? defaultLang);
  }

  @override
  Future<ArticleResponseModel> getArticleBusinessList({String? lang}) {
    return remoteSource.getArticleBusinessList(lr: lang ?? defaultLang);
  }

  @override
  Future<ArticleResponseModel> getArticleEntertainmentList({String? lang}) {
    return remoteSource.getArticleEntertainmentList(lr: lang ?? defaultLang);
  }

  @override
  Future<ArticleResponseModel> getArticleHealthList({String? lang}) {
    return remoteSource.getArticleHealthList(lr: lang ?? defaultLang);
  }

  @override
  Future<ArticleResponseModel> getArticleScienceList({String? lang}) {
    return remoteSource.getArticleScienceList(lr: lang ?? defaultLang);
  }

  @override
  Future<ArticleResponseModel> getArticleSportList({String? lang}) {
    return remoteSource.getArticleSportList(lr: lang ?? defaultLang);
  }

  @override
  Future<ArticleResponseModel> getArticleTechnologyList({String? lang}) {
    return remoteSource.getArticleTechnologyList(lr: lang ?? defaultLang);
  }
}
