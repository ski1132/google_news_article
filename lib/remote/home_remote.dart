import 'package:dio/dio.dart';
import 'package:google_news_article/models/article_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_remote.g.dart';

@RestApi()
abstract class HomeRemote {
  factory HomeRemote(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _HomeRemote;

  @GET('/latest')
  Future<ArticleResponseModel> getArticleLatestList({
    @Query('lr') required String lr,
  });

  @GET('/world')
  Future<ArticleResponseModel> getArticleWorldList({
    @Query('lr') required String lr,
  });

  @GET('/business')
  Future<ArticleResponseModel> getArticleBusinessList({
    @Query('lr') required String lr,
  });

  @GET('/entertainment')
  Future<ArticleResponseModel> getArticleEntertainmentList({
    @Query('lr') required String lr,
  });

  @GET('/health')
  Future<ArticleResponseModel> getArticleHealthList({
    @Query('lr') required String lr,
  });

  @GET('/science')
  Future<ArticleResponseModel> getArticleScienceList({
    @Query('lr') required String lr,
  });

  @GET('/sport')
  Future<ArticleResponseModel> getArticleSportList({
    @Query('lr') required String lr,
  });

  @GET('/technology')
  Future<ArticleResponseModel> getArticleTechnologyList({
    @Query('lr') required String lr,
  });
}
