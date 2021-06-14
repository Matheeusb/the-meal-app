import 'package:flutter_test/flutter_test.dart';
import 'package:the_meal_app/models/category.dart';

void main() {

  Map<String, dynamic> map;

  setUp((){
    map = {};
    map['idCategory'] = '1';
    map['strCategory'] = 'Name test';
    map['strCategoryThumb'] = 'Image test';
    map['strCategoryDescription'] = 'Description test';
  });

  test('Should return a category object from a map', () {
    var category = Category.fromJson(map);

    expect(category.id, '1');
    expect(category.name, 'Name test');
    expect(category.image, 'Image test');
    expect(category.description, 'Description test');
  });

  test('Should return a category object from a map with a null attribute', () {
    map['strCategoryDescription'] = null;

    var category = Category.fromJson(map);

    expect(category.id, '1');
    expect(category.name, 'Name test');
    expect(category.image, 'Image test');
    expect(category.description, null);
  });
}