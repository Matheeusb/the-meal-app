import 'dart:io';

import 'package:dio/dio.dart';

import '../../../constants/api.dart';
import '../../../exceptions/network_exception.dart';
import '../../../models/category.dart';

class CategoriesRepository {
  final Dio _dio;

  CategoriesRepository(this._dio);

  Future<List<Category>> getCategories() async {
    final response = await _dio.get('${theMealUrlBase}categories.php');
    if (response.statusCode == HttpStatus.ok) {
      return (response.data['categories'] as List)
          .map((category) => Category.fromJson(category))
          .toList();
    } else {
      throw NetworkException();
    }
  }
}
