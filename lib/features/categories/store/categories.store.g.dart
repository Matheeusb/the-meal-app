// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriesStore on _CategoriesStore, Store {
  final _$categoriesAtom = Atom(name: '_CategoriesStore.categories');

  @override
  List<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$findCategoriesAsyncAction =
      AsyncAction('_CategoriesStore.findCategories');

  @override
  Future<dynamic> findCategories(Function onError) {
    return _$findCategoriesAsyncAction.run(() => super.findCategories(onError));
  }

  @override
  String toString() {
    return '''
categories: ${categories}
    ''';
  }
}
