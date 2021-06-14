import 'package:mobx/mobx.dart';
import 'package:the_meal_app/features/meals/repositories/meals.repository.dart';
import 'package:the_meal_app/models/meal.dart';

part 'meals.store.g.dart';

class MealsStore = _Meals with _$MealsStore;

abstract class _Meals with Store {
  final MealsRepository repository;

  @observable
  List<Meal> meals;

  _Meals(this.repository);

  @action
  findMeals(String category, Function onError) async {
    try {
      meals = await repository.getMeals(category);
    } catch (e) {
      onError();
    }
  }

  dispose() {
    meals = null;
  }
}