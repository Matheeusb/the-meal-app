import 'package:mobx/mobx.dart';
import 'package:the_meal_app/features/categories/repositories/categories.repository.dart';
import 'package:the_meal_app/models/category.dart';

part 'categories.store.g.dart';

class CategoriesStore = _CategoriesStore with _$CategoriesStore;

abstract class _CategoriesStore with Store {
  final CategoriesRepository repository;

  @observable
  List<Category> categories;

  _CategoriesStore(this.repository);

  @action
  findCategories(Function onError) async {
    try {
      categories = await repository.getCategories();
    } catch (e) {
      onError();
    }
  }
}