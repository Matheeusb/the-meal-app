import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_meal_app/exceptions/network_exception.dart';
import 'package:the_meal_app/features/categories/repositories/categories.repository.dart';
import 'package:the_meal_app/models/category.dart';

import '../../../mocks/categories_json_mock.dart';
import '../../../mocks/mocks.dart';


void main() {
  CategoriesRepository repository;
  DioMock dioMock;

  setUp(() {
    dioMock = DioMock();
    repository = CategoriesRepository(dioMock);
  });

  test('Should return a list of categories', () async {
    when(dioMock.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(categoriesJsonMock), statusCode: HttpStatus.ok));

    final list = await repository.getCategories();

    expect(list.isNotEmpty, true);
    expect(list.first, isA<Category>());
  });

  test('Should return a exception', () async {
    when(dioMock.get(any)).thenAnswer((_) async =>
        Response(data: '', statusCode: HttpStatus.serviceUnavailable));

    expect(() async => await repository.getCategories(),
        throwsA(isA<NetworkException>()));
  });
}
