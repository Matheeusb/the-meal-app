import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';
import 'package:the_meal_app/components/card.dart';
import 'package:the_meal_app/components/snack_bar.dart';
import 'package:the_meal_app/exceptions/network_exception.dart';
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
            'Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]');
  });

  testWidgets('Should display a card when categories page is opened',
      (tester) async {
    when(repository.getCategories()).thenAnswer((_) async => [category]);
    provideMockedNetworkImages(() async {
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
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(TheMealApp(
          initialRoute: '/categories_page', categoriesRepository: repository));

      await tester.pumpAndSettle();
      final card = find.byType(TheCard);

      expect(card, findsNWidgets(2));
    });
  });
}
