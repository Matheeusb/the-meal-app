import 'dart:io';

import 'package:dio/dio.dart';

import '../../../constants/api.dart';
import '../../../exceptions/network_exception.dart';
import '../../../models/meal_details.dart';

class MealDetailsRepository {
  final Dio _dio;

  MealDetailsRepository(this._dio);

  Future<List<MealDetails>> getMealDetails(String idMeal) async {
    final response = await _dio.get('$theMealUrlBase${'lookup.php?i=$idMeal'}');
    if (response.statusCode == HttpStatus.ok) {
      return response.data['meals']
          .map<MealDetails>((mealDetails) => MealDetails.fromJson(mealDetails))
          .toList();
    } else {
      throw NetworkException();
    }
  }
}
