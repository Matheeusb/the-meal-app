import 'package:dio/dio.dart';

import '../../../constants/api.dart';
import '../../../exceptions/network_exception.dart';
import '../../../models/category.dart';

class CategoriesRepository {
  final Dio _dio;

  CategoriesRepository(this._dio);

  Future<List<Category>> getCategories() async {
    try {
      final response = await _dio.get('${theMealUrlBase}categories.php');
      return (response.data['categories'] as List)
          .map((category) => Category.fromJson(category))
          .toList();
    } on Exception catch (_) {
      throw NetworkException();
    }
  }
}
