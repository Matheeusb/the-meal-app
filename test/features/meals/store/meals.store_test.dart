import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_meal_app/exceptions/network_exception.dart';
import 'package:the_meal_app/features/meals/store/meals.store.dart';
import 'package:the_meal_app/models/meal.dart';

import '../../../mocks/mocks.dart';

void main() {
  MockMealsRepository mockMealsRepository;
  MealsStore store;
  Meal meal;
  String categoryName;

  setUp(() {
    mockMealsRepository = MockMealsRepository();
    store = MealsStore(mockMealsRepository);
    meal = Meal(id: '1', name: 'Name test', image: 'Image test');
    categoryName = 'Beef';
  });

  test('Should return a list of meals', () async {
    when(mockMealsRepository.getMeals(any)).thenAnswer((_) async => [meal]);

    await store.findMeals(categoryName, () {});

    expect(store.meals, isNotEmpty);
    expect(store.meals.first, meal);
  });

  test('Should return a list of null meals', () async {
    when(mockMealsRepository.getMeals(any)).thenThrow(NetworkException());

    await store.findMeals(categoryName, () {
      return [];
    });

    expect(store.meals, null);
  });

  test('Should return a list of null meals after performing the dispose',
      () async {
    when(mockMealsRepository.getMeals(any)).thenAnswer((_) async => [meal]);

    await store.findMeals(categoryName, () {});
    store.dispose();

    expect(store.meals, null);
  });
}
