import 'package:dio/dio.dart';

import '../../../constants/api.dart';
import '../../../exceptions/network_exception.dart';
import '../../../models/meal.dart';

class MealsRepository {
  final Dio _dio;

  MealsRepository(this._dio);

  Future<List<Meal>> getMeals(String category) async {
    try {
      final response =
          await _dio.get('$theMealUrlBase${'filter.php?c=$category'}');
      return response.data['meals']
          .map<Meal>((map) => Meal.fromJson(map))
          .toList();
    } on Exception catch (_) {
      throw NetworkException();
    }
  }
}
