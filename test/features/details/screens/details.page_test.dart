import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';
import 'package:the_meal_app/main.dart';
import 'package:the_meal_app/models/meal_details.dart';

import '../../../mocks/mocks.dart';

void main() {
  MockMealDetailsRepository repository;
  MealDetails mealDetails;

  setUp(() {
    repository = MockMealDetailsRepository();
    mealDetails = MealDetails(
      id: '52772',
      name: 'Teriyaki Chicken Casserole',
      category: 'Chicken',
      instructions:
          'Preheat oven to 350° F. Spray a 9x13-inch baking pan with ...',
      image:
          'https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg',
      video: 'https://www.youtube.com/watch?v=4aZr5hZXP_s',
      ingredients: ['soy sauce', 'water'],
      measures: ['3/4 cup', '1/2 cup'],
    );
  });

  testWidgets('Should display widgets when meals page is opened',
      (tester) async {
    provideMockedNetworkImages(
      () async {
        when(repository.getMealDetails(any))
            .thenAnswer((_) async => [mealDetails]);
        await tester.pumpWidget(
          TheMealApp(
            initialRoute: '/meal_details_page',
            mealDetailsRepository: repository,
          ),
        );

        await tester.pumpAndSettle();

        final sliverAppBar = find.byType(SliverAppBar);
        final sliverList = find.byType(SliverList);
        final listTile = find.byType(ListTile);
        final iconButton = find.byType(IconButton);
        final divider = find.byType(Divider);
        final text = find.byType(Text);
        final list = find.byType(ListView);

        expect(sliverAppBar, findsOneWidget);
        expect(sliverList, findsWidgets);
        expect(listTile, findsOneWidget);
        expect(iconButton, findsNWidgets(2));
        expect(divider, findsNWidgets(2));
        expect(text, findsNWidgets(8));
        expect(list, findsOneWidget);
      },
    );
  });
}
