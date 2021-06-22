import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:the_meal_app/components/card.dart';
import 'package:the_meal_app/main.dart';
import 'package:the_meal_app/models/category.dart';

import '../../../mocks/mocks.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  MockCategoriesRepository repository;
  Category category;

  setUp(() {
    repository = MockCategoriesRepository();
    category = Category(
        id: '1',
        name: 'Beef',
        image: 'https://www.themealdb.com/images/category/beef.png',
        description:
            'Beef is the culinary name for meat from cattle, particularly ...');
  });

  testWidgets('Should display a card when categories page is opened',
      (tester) async {
    when(repository.getCategories()).thenAnswer((_) async => [category]);
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(TheMealApp(
          initialRoute: '/categories_page', categoriesRepository: repository));

      await tester.pumpAndSettle();
      final card = find.byType(TheCard);

      expect(card, findsOneWidget);
    });
  });

  testWidgets('Should display two cards when categories page is opened',
      (tester) async {
    when(repository.getCategories())
        .thenAnswer((_) async => [category, category]);
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(TheMealApp(
          initialRoute: '/categories_page', categoriesRepository: repository));

      await tester.pumpAndSettle();
      final card = find.byType(TheCard);

      expect(card, findsNWidgets(2));
    });
  });
}
