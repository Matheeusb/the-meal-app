import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_meal_app/exceptions/network_exception.dart';
import 'package:the_meal_app/features/details/repositories/details.repository.dart';
import 'package:the_meal_app/models/meal_details.dart';

import '../../../mocks/details_json_mock.dart';
import '../../../mocks/mocks.dart';

void main() {
  MealDetailsRepository repository;
  DioMock dioMock;

  setUp(() {
    dioMock = DioMock();
    repository = MealDetailsRepository(dioMock);
  });

  test('Should return a list of meal details', () async {
    when(dioMock.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(detailsJsonMock), statusCode: HttpStatus.ok));

    final list = await repository.getMealDetails('52772');

    expect(list.isNotEmpty, true);
    expect(list.first, isA<MealDetails>());
  });

  test('Should return a exception', () async {
    when(dioMock.get(any))
        .thenAnswer((_) async => Response(data: '', statusCode: HttpStatus.serviceUnavailable));

    expect(() async => await repository.getMealDetails('52772'),
        throwsA(isA<NetworkException>()));
  });
}
