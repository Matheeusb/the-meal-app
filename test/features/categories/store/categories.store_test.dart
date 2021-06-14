import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_meal_app/exceptions/network_exception.dart';
import 'package:the_meal_app/features/categories/store/categories.store.dart';
import 'package:the_meal_app/models/category.dart';

import '../../../mocks/mocks.dart';

void main() {
  MockCategoriesRepository mockCategoriesRepository;
  CategoriesStore store;
  Category category;

  setUp(() {
    mockCategoriesRepository = MockCategoriesRepository();
    store = CategoriesStore(mockCategoriesRepository);
    category = Category(
        id: '1',
        name: 'Name test',
        image: 'Image test',
        description: 'Description test');
  });

  test('Should return a list of categories', () async {
    when(mockCategoriesRepository.getCategories())
        .thenAnswer((_) async => [category]);

    await store.findCategories(() {});

    expect(store.categories, isNotNull);
    expect(store.categories.first, category);
  });

  test('Should return a list of null categories', () async {
    when(mockCategoriesRepository.getCategories())
        .thenThrow(NetworkException());

    await store.findCategories(() {
      return [];
    });

    expect(store.categories, null);
  });
}
