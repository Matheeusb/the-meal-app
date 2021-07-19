import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:the_meal_app/components/card.dart';
import 'package:the_meal_app/main.dart';
import 'package:the_meal_app/models/meal.dart';

import '../../../mocks/mocks.dart';

void main() {
  MockMealsRepository repository;
  Meal meal;

  setUp(() {
    repository = MockMealsRepository();
    meal = Meal(
        id: '52874',
        name: 'Beef and Mustard Pie',
        image:
            'https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg');
  });

  testWidgets('Should display a card when meals page is opened',
      (tester) async {
        mockNetworkImagesFor(() async {
      when(repository.getMeals(any)).thenAnswer((_) async => [meal]);
      await tester.pumpWidget(TheMealApp(
        initialRoute: '/meals_page',
        mealsRepository: repository,
      ));

      await tester.pumpAndSettle();
      final card = find.byType(TheCard);

      expect(card, findsOneWidget);
    });
  });

  testWidgets('Should display two cards when meals page is opened',
      (tester) async {
        mockNetworkImagesFor(() async {
      when(repository.getMeals(any)).thenAnswer((_) async => [meal, meal]);
      await tester.pumpWidget(TheMealApp(
        initialRoute: '/meals_page',
        mealsRepository: repository,
      ));

      await tester.pumpAndSettle();
      final card = find.byType(TheCard);

      expect(card, findsNWidgets(2));
    });
  });
}
