import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../exceptions/network_exception.dart';
import '../../../models/meal_details.dart';
import '../repositories/details.repository.dart';

part 'details.store.g.dart';

class MealDetailsStore = _MealDetails with _$MealDetailsStore;

abstract class _MealDetails with Store {
  final MealDetailsRepository repository;

  @observable
  MealDetails mealDetails;

  _MealDetails(this.repository);

  @action
  Future findDetails(String idMeal, Function onError) async {
    try {
      var meals = await repository.getMealDetails(idMeal);
      mealDetails = meals.first;
    } on NetworkException catch (_) {
      onError();
    }
  }

  @action
  Future openYoutube(String url, Function onError) async {
    try {
      await launch(url);
    } on NetworkException catch (_) {
      onError();
    }
  }

  void dispose() {
    mealDetails = null;
  }
}
