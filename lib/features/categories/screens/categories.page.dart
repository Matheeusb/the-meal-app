import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../components/card.dart';
import '../../../components/circular_progress_indicator.dart';
import '../../../components/snack_bar.dart';
import '../../../constants/colors.dart';
import '../store/categories.store.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  CategoriesStore store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<CategoriesStore>(context);
    store.findCategories(
      () {
        return ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo-the-meal.png',
          width: 200,
        ),
      ),
      body: Observer(
        builder: (_) {
          return Container(
            padding: EdgeInsets.all(16),
            color: deepOak,
            child: store.categories == null
                ? TheCircularProgressIndicator()
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return TheCard.categories(
                        title: store.categories[index].name,
                        description: store.categories[index].description,
                        image: store.categories[index].image,
                        onClick: () {
                          Navigator.of(context).pushNamed(
                            '/meals_page',
                            arguments: store.categories[index],
                          );
                        },
                      );
                    },
                    itemCount: store.categories.length,
                  ),
          );
        },
      ),
    );
  }
}
