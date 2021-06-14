import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_meal_app/exceptions/network_exception.dart';
import 'package:the_meal_app/features/meals/repositories/meals.repository.dart';
import 'package:the_meal_app/models/meal.dart';

import '../../../mocks/meals_json_mock.dart';
import '../../../mocks/mocks.dart';

void main() {
  MealsRepository repository;
  DioMock dioMock;

  setUp((){
    dioMock = DioMock();
    repository = MealsRepository(dioMock);
  });

  test('Should return a list of meals', () async {
    when(dioMock.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(mealsJsonMock), statusCode: HttpStatus.ok));

    final list = await repository.getMeals('Beef');

    expect(list.isNotEmpty, true);
    expect(list.first, isA<Meal>());
  });

  test('Should return a exception', () async {
    when(dioMock.get(any))
        .thenAnswer((_) async => Response(data: '', statusCode: HttpStatus.serviceUnavailable));

    expect(() async => await repository.getMeals('Beef'),
        throwsA(isA<NetworkException>()));
  });
}