// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MealsStore on _Meals, Store {
  final _$mealsAtom = Atom(name: '_Meals.meals');

  @override
  List<Meal> get meals {
    _$mealsAtom.reportRead();
    return super.meals;
  }

  @override
  set meals(List<Meal> value) {
    _$mealsAtom.reportWrite(value, super.meals, () {
      super.meals = value;
    });
  }

  final _$findMealsAsyncAction = AsyncAction('_Meals.findMeals');

  @override
  Future<dynamic> findMeals(String category, Function onError) {
    return _$findMealsAsyncAction.run(() => super.findMeals(category, onError));
  }

  @override
  String toString() {
    return '''
meals: ${meals}
    ''';
  }
}
