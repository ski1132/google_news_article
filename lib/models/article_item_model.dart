import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_item_model.freezed.dart';
part 'article_item_model.g.dart';

@freezed
abstract class ArticleItemModel with _$ArticleItemModel {
  const factory ArticleItemModel({
    @JsonKey(name: "timestamp") String? timestamp,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "snippet") String? snippet,
    @JsonKey(name: "images") Images? images,
    @JsonKey(name: "subnews") List<ArticleItemModel>? subnews,
    @JsonKey(name: "hasSubnews") bool? hasSubnews,
    @JsonKey(name: "newsUrl") String? newsUrl,
    @JsonKey(name: "publisher") String? publisher,
  }) = _ArticleItemModel;

  factory ArticleItemModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleItemModelFromJson(json);
}

@freezed
abstract class Images with _$Images {
  const factory Images({
    @JsonKey(name: "thumbnail") String? thumbnail,
    @JsonKey(name: "thumbnailProxied") String? thumbnailProxied,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}
