import 'package:mobx/mobx.dart';

import '../../../exceptions/network_exception.dart';
import '../../../models/category.dart';
import '../repositories/categories.repository.dart';

part 'categories.store.g.dart';

class CategoriesStore = _CategoriesStore with _$CategoriesStore;

abstract class _CategoriesStore with Store {
  final CategoriesRepository repository;

  @observable
  List<Category> categories;

  _CategoriesStore(this.repository);

  @action
  Future findCategories(Function onError) async {
    try {
      categories = await repository.getCategories();
    } on NetworkException catch (_) {
      onError();
    }
  }
}
