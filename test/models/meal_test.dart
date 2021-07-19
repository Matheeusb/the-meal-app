import 'package:flutter_test/flutter_test.dart';
import 'package:the_meal_app/models/meal.dart';

void main() {

  Map<String, dynamic> map;

  setUp((){
    map = {};
    map['idMeal'] = '1';
    map['strMeal'] = 'Name test';
    map['strMealThumb'] = 'Image test';
  });

  test('Should return a meal object from a map', () {
    var meal = Meal.fromJson(map);

    expect(meal.id, '1');
    expect(meal.name, 'Name test');
    expect(meal.image, 'Image test');
  });

  test('Should return a meal object from a map with a null attribute', () {
    map['strMealThumb'] = null;

    var meal = Meal.fromJson(map);

    expect(meal.id, '1');
    expect(meal.name, 'Name test');
    expect(meal.image, null);
  });
}