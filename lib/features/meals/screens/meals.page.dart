import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../components/card.dart';
import '../../../components/circular_progress_indicator.dart';
import '../../../components/snack_bar.dart';
import '../../../constants/colors.dart';
import '../../../models/category.dart';
import '../store/meals.store.dart';

class MealsPage extends StatefulWidget {
  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  MealsStore store;
  Category category;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    category = ModalRoute.of(context).settings.arguments ??
        Category(
            id: 'default',
            name: 'default',
            image: 'default',
            description: 'default');
    store = Provider.of<MealsStore>(context);
    store.findMeals(
      category.name,
      () {
        return ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    store.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(category.image, width: 50),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(category.name),
            )
          ],
        ),
      ),
      body: Observer(
        builder: (_) {
          return Container(
            padding: EdgeInsets.all(16),
            color: deepOak,
            child: store.meals == null
                ? TheCircularProgressIndicator()
                : ListView.builder(
                    itemCount: store.meals.length,
                    itemBuilder: (context, index) {
                      return TheCard.meals(
                        title: store.meals[index].name,
                        image: store.meals[index].image,
                        onClick: () {
                          Navigator.of(context).pushNamed(
                            '/meal_details_page',
                            arguments: store.meals[index],
                          );
                        },
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
