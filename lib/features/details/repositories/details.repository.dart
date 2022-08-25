import 'package:dio/dio.dart';

import '../../../constants/api.dart';
import '../../../exceptions/network_exception.dart';
import '../../../models/meal_details.dart';

class MealDetailsRepository {
  MealDetailsRepository();

  Future<List<MealDetails>> getMealDetails(String idMeal) async {
    try {
      final response =
          await Dio().get('$theMealUrlBase${'lookup.php?i=$idMeal'}');
      return response.data['meals']
          .map<MealDetails>((mealDetails) => MealDetails.fromJson(mealDetails))
          .toList();
    } on Exception catch (_) {
      throw NetworkException();
    }
  }
}
