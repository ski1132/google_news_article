import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:google_news_article/controllers/home/home_controller.dart';
import 'package:google_news_article/models/article_item_model.dart';
import 'package:google_news_article/models/article_response_model.dart';
import 'package:google_news_article/repository/home_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late MockHomeRepository mockRepository;
  late HomeController controller;

  setUp(() {
    mockRepository = MockHomeRepository();
    Get.put<HomeRepository>(mockRepository);
  });

  tearDown(() {
    Get.reset();
  });

  test('should fetch article list successfully', () async {
    // Arrange
    final mockArticles = [
      ArticleItemModel(title: 'Test Title 1', snippet: 'Test Snippet 1'),
      ArticleItemModel(title: 'Test Title 2', snippet: 'Test Snippet 2'),
    ];
    final mockResponse = ArticleResponseModel(
      status: 'success',
      items: mockArticles,
    );

    when(
      () => mockRepository.getArticleByType(ArticleType.latest),
    ).thenAnswer((_) async => mockResponse);

    // Act
    controller = Get.put(HomeController());

    // Assert initial loading state
    expect(controller.isLoading.value, true);

    // Wait for the async operation to complete
    await Future.delayed(const Duration(milliseconds: 100));

    // Assert final state
    expect(controller.isLoading.value, false);
    expect(controller.articleItemModelList.length, 2);
    expect(controller.articleItemModelList[0].title, 'Test Title 1');
    expect(controller.articleItemModelList[1].title, 'Test Title 2');
    verify(() => mockRepository.getArticleByType(ArticleType.latest)).called(1);
  });

  test('should handle error when fetching article list fails', () async {
    // Arrange
    final mockResponse = ArticleResponseModel(
      status: 'error',
      message: 'Failed to fetch',
    );

    when(
      () => mockRepository.getArticleByType(ArticleType.latest),
    ).thenAnswer((_) async => mockResponse);

    // Act
    controller = Get.put(HomeController());

    // Assert initial loading state
    expect(controller.isLoading.value, true);

    // Wait for the async operation to complete
    await Future.delayed(const Duration(milliseconds: 100));

    // Assert final state
    expect(controller.isLoading.value, false);
    expect(controller.articleItemModelList.isEmpty, true);
    expect(controller.errorText.value, 'Failed to fetch');
  });

  test('should update list when dropdown value changes', () async {
    // Arrange
    final mockArticlesLatest = [ArticleItemModel(title: 'Latest News')];
    final mockArticlesBusiness = [ArticleItemModel(title: 'Business News')];

    when(() => mockRepository.getArticleByType(ArticleType.latest)).thenAnswer(
      (_) async =>
          ArticleResponseModel(status: 'success', items: mockArticlesLatest),
    );
    when(
      () => mockRepository.getArticleByType(ArticleType.business),
    ).thenAnswer(
      (_) async =>
          ArticleResponseModel(status: 'success', items: mockArticlesBusiness),
    );

    controller = Get.put(HomeController());
    await Future.delayed(const Duration(milliseconds: 100)); // Wait for init

    // Act
    controller.setDropdownValue(ArticleType.business);

    // Assert
    expect(controller.dropdownValue.value, ArticleType.business);
    expect(controller.isLoading.value, true); // Should trigger loading again

    await Future.delayed(
      const Duration(milliseconds: 100),
    ); // Wait for second call

    expect(controller.isLoading.value, false);
    expect(controller.articleItemModelList.length, 1);
    expect(controller.articleItemModelList.first.title, 'Business News');
  });
}
