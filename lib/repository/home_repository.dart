import 'package:google_news_article/models/article_response_model.dart';

abstract class HomeRepository {
  Future<ArticleResponseModel> getArticleByType(ArticleType type);
  Future<ArticleResponseModel> getArticleLatestList({String? lang});
  Future<ArticleResponseModel> getArticleWorldList({String? lang});
  Future<ArticleResponseModel> getArticleBusinessList({String? lang});
  Future<ArticleResponseModel> getArticleEntertainmentList({String? lang});
  Future<ArticleResponseModel> getArticleHealthList({String? lang});
  Future<ArticleResponseModel> getArticleScienceList({String? lang});
  Future<ArticleResponseModel> getArticleSportList({String? lang});
  Future<ArticleResponseModel> getArticleTechnologyList({String? lang});
}

enum ArticleType {
  latest,
  world,
  business,
  entertainment,
  health,
  science,
  sport,
  technology,
}
