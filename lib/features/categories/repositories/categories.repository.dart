
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:the_meal_app/constants/api.dart';
import 'package:the_meal_app/exceptions/network_exception.dart';
import 'package:the_meal_app/models/category.dart';

class CategoriesRepository {
  final Dio _dio;

  CategoriesRepository(this._dio);

  Future<List<Category>> getCategories() async {
    final response = await _dio.get(THE_MEAL_URL_BASE + 'categories.php');
    if (response.statusCode == HttpStatus.ok) {
      return (response.data['categories'] as List)
          .map((category) => Category.fromJson(category))
          .toList();
    } else {
      throw NetworkException();
    }
  }
}
