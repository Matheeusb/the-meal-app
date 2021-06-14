import 'dart:io';

import 'package:dio/dio.dart';

import '../../../constants/api.dart';
import '../../../exceptions/network_exception.dart';
import '../../../models/meal.dart';

class MealsRepository {
  final Dio _dio;

  MealsRepository(this._dio);

  Future<List<Meal>> getMeals(String category) async {
    final response =
        await _dio.get('$theMealUrlBase${'filter.php?c=$category'}');
    if (response.statusCode == HttpStatus.ok) {
      return response.data['meals']
          .map<Meal>((map) => Meal.fromJson(map))
          .toList();
    } else {
      throw NetworkException();
    }
  }
}
