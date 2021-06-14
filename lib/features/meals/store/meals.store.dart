import 'package:mobx/mobx.dart';

import '../../../exceptions/network_exception.dart';
import '../../../models/meal.dart';
import '../repositories/meals.repository.dart';

part 'meals.store.g.dart';

class MealsStore = _Meals with _$MealsStore;

abstract class _Meals with Store {
  final MealsRepository repository;

  @observable
  List<Meal> meals;

  _Meals(this.repository);

  @action
  Future findMeals(String category, Function onError) async {
    try {
      meals = await repository.getMeals(category);
    } on NetworkException catch (_) {
      onError();
    }
  }

  void dispose() {
    meals = null;
  }
}
