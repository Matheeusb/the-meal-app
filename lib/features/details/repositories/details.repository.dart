import 'dart:io';

import 'package:dio/dio.dart';
import 'package:the_meal_app/constants/api.dart';
import 'package:the_meal_app/exceptions/network_exception.dart';
import 'package:the_meal_app/models/meal_details.dart';

class MealDetailsRepository {
  final Dio _dio;

  MealDetailsRepository(this._dio);

  Future<List<MealDetails>> getMealDetails(String idMeal) async {
    final response = await _dio.get(THE_MEAL_URL_BASE + 'lookup.php?i=$idMeal');
    if (response.statusCode == HttpStatus.ok) {
      return response.data['meals']
          .map<MealDetails>((mealDetails) => MealDetails.fromJson(mealDetails))
          .toList();
    } else {
      throw NetworkException();
    }
  }
}
