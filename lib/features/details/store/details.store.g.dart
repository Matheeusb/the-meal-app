// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MealDetailsStore on _MealDetails, Store {
  final _$mealDetailsAtom = Atom(name: '_MealDetails.mealDetails');

  @override
  MealDetails get mealDetails {
    _$mealDetailsAtom.reportRead();
    return super.mealDetails;
  }

  @override
  set mealDetails(MealDetails value) {
    _$mealDetailsAtom.reportWrite(value, super.mealDetails, () {
      super.mealDetails = value;
    });
  }

  final _$findDetailsAsyncAction = AsyncAction('_MealDetails.findDetails');

  @override
  Future<dynamic> findDetails(String idMeal, Function onError) {
    return _$findDetailsAsyncAction
        .run(() => super.findDetails(idMeal, onError));
  }

  final _$openYoutubeAsyncAction = AsyncAction('_MealDetails.openYoutube');

  @override
  Future<dynamic> openYoutube(String url, Function onError) {
    return _$openYoutubeAsyncAction.run(() => super.openYoutube(url, onError));
  }

  @override
  String toString() {
    return '''
mealDetails: ${mealDetails}
    ''';
  }
}
