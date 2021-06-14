import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:the_meal_app/components/card.dart';
import 'package:the_meal_app/components/circular_progress_indicator.dart';
import 'package:the_meal_app/components/snack_bar.dart';
import 'package:the_meal_app/constants/colors.dart';
import 'package:the_meal_app/features/meals/store/meals.store.dart';
import 'package:the_meal_app/models/category.dart';

class MealsPage extends StatefulWidget {
  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  MealsStore store;
  Category category;
  final scaffKey = GlobalKey<ScaffoldState>();

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
        return scaffKey.currentState.showSnackBar(snackBar);
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
      key: scaffKey,
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
            color: DEEP_OAK,
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
