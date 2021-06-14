import 'package:mobx/mobx.dart';
import 'package:the_meal_app/features/details/repositories/details.repository.dart';
import 'package:the_meal_app/models/meal_details.dart';
import 'package:url_launcher/url_launcher.dart';

part 'details.store.g.dart';

class MealDetailsStore = _MealDetails with _$MealDetailsStore;

abstract class _MealDetails with Store {
  final MealDetailsRepository repository;

  @observable
  MealDetails mealDetails;

  _MealDetails(this.repository);

  @action
  findDetails(String idMeal, Function onError) async {
    try {
      List<MealDetails> meals = await repository.getMealDetails(idMeal);
      mealDetails = meals.first;
    } catch (e) {
      onError();
    }
  }

  @action
  openYoutube(String url, Function onError) async {
    try {
      await launch(url);
    } catch (e) {
      onError();
    }
  }

  dispose() {
    mealDetails = null;
  }
}
