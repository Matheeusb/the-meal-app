import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:the_meal_app/features/categories/repositories/categories.repository.dart';
import 'package:the_meal_app/features/details/repositories/details.repository.dart';
import 'package:the_meal_app/features/meals/repositories/meals.repository.dart';

class DioMock extends Mock implements Dio {}

class MockCategoriesRepository extends Mock implements CategoriesRepository {}

class MockMealDetailsRepository extends Mock implements MealDetailsRepository {}

class MockMealsRepository extends Mock implements MealsRepository {}