import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_meal_app/exceptions/network_exception.dart';
import 'package:the_meal_app/features/details/repositories/details.repository.dart';
import 'package:the_meal_app/features/details/store/details.store.dart';
import 'package:the_meal_app/models/meal_details.dart';

import '../../../mocks/mocks.dart';

void main() {
  MealDetailsRepository mockMealDetailsRepository;
  MealDetailsStore store;
  MealDetails mealDetails;
  String idMeal;

  setUp(() {
    mockMealDetailsRepository = MockMealDetailsRepository();
    store = MealDetailsStore(mockMealDetailsRepository);
    mealDetails = MealDetails(
        id: '1',
        name: 'Name test',
        image: 'Image test',
        video: 'https://www.youtube.com/watch?v=5AxWC49ZMzs',
        instructions: 'Instructions test',
        ingredients: [
          'Ingredient1',
          'Ingredient2'
        ],
        measures: [
          'Measure1',
          'Measure2',
        ]);
    idMeal = '52772';
  });

  test('Should return the details of a meal', () async {
    when(mockMealDetailsRepository.getMealDetails(any))
        .thenAnswer((_) async => [mealDetails]);

    await store.findDetails(idMeal, () {});

    expect(store.mealDetails, mealDetails);
  });

  test('Should return the details of a meal as null', () async {
    when(mockMealDetailsRepository.getMealDetails(any))
        .thenThrow(NetworkException());

    await store.findDetails(idMeal, () {
      return [];
    });

    expect(store.mealDetails, null);
  });

  test(
      'Should return the details of a meal as null after performing the dispose',
      () async {
    when(mockMealDetailsRepository.getMealDetails(any))
        .thenAnswer((_) async => [mealDetails]);

    await store.findDetails(idMeal, () {});
    store.dispose();

    expect(store.mealDetails, null);
  });
}
