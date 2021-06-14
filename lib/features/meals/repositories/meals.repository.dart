import 'dart:io';

import 'package:dio/dio.dart';
import 'package:the_meal_app/constants/api.dart';
import 'package:the_meal_app/exceptions/network_exception.dart';
import 'package:the_meal_app/models/meal.dart';

class MealsRepository {
  final Dio _dio;

  MealsRepository(this._dio);

  Future<List<Meal>> getMeals(String category) async {
    final response =
        await _dio.get(THE_MEAL_URL_BASE + 'filter.php?c=$category');
    if (response.statusCode == HttpStatus.ok) {
      return response.data['meals']
          .map<Meal>((map) => Meal.fromJson(map))
          .toList();
    } else {
      throw NetworkException();
    }
  }
}
