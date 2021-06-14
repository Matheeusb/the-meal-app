import 'package:flutter_test/flutter_test.dart';
import 'package:the_meal_app/models/meal_details.dart';

void main() {
  Map<String, dynamic> map;

  setUp(() {
    map = Map();
    map['idMeal'] = '1';
    map['strMeal'] = 'Name test';
    map['strDrinkAlternate'] = 'Drink test';
    map['strCategory'] = 'Category test';
    map['strArea'] = 'Area test';
    map['strInstructions'] = 'Instructions test';
    map['strMealThumb'] = 'Image test';
    map['strTags'] = 'Tags test';
    map['strYoutube'] = 'Video test';
    map['strMeasure1'] = 'Measure 1 test';
    map['strMeasure2'] = 'Measure 2 test';
    map['strIngredient1'] = 'Ingredient 1 test';
    map['strIngredient2'] = 'Ingredient 2 test';
  });

  test('Should return a meal details object from a map', () {
    MealDetails meal = MealDetails.fromJson(map);

    expect(meal.id, '1');
    expect(meal.name, 'Name test');
    expect(meal.drinkAlternate, 'Drink test');
    expect(meal.area, 'Area test');
    expect(meal.instructions, 'Instructions test');
    expect(meal.image, 'Image test');
    expect(meal.tags, 'Tags test');
    expect(meal.video, 'Video test');
    expect(meal.measures, ['Measure 1 test', 'Measure 2 test']);
    expect(meal.ingredients, ['Ingredient 1 test', 'Ingredient 2 test']);
  });

  test('Should return a meal details object from a map with a null attribute', () {
    map['strTags'] = null;

    MealDetails meal = MealDetails.fromJson(map);

    expect(meal.id, '1');
    expect(meal.name, 'Name test');
    expect(meal.drinkAlternate, 'Drink test');
    expect(meal.area, 'Area test');
    expect(meal.instructions, 'Instructions test');
    expect(meal.image, 'Image test');
    expect(meal.tags, null);
    expect(meal.video, 'Video test');
    expect(meal.measures, ['Measure 1 test', 'Measure 2 test']);
    expect(meal.ingredients, ['Ingredient 1 test', 'Ingredient 2 test']);
  });

  test('Should return a meal details object from a map with null ingredients', () {
    map['strIngredient1'] = null;
    map['strIngredient2'] = null;

    MealDetails meal = MealDetails.fromJson(map);

    expect(meal.measures, ['Measure 1 test', 'Measure 2 test']);
    expect(meal.ingredients, isEmpty);
  });
}