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
          'Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray.Combine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.Meanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.Place the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.*Meanwhile, steam or cook the vegetables according to package directions. Add the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!',
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
