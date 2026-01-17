import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_news_article/models/article_item_model.dart';

part 'article_response_model.freezed.dart';
part 'article_response_model.g.dart';

@freezed
abstract class ArticleResponseModel with _$ArticleResponseModel {
  const factory ArticleResponseModel({
    @JsonKey(name: "status") String? status,
    @Default([]) @JsonKey(name: "items") List<ArticleItemModel> items,
  }) = _ArticleResponseModel;

  factory ArticleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseModelFromJson(json);
}
