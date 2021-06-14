import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../../components/circular_progress_indicator.dart';
import '../../../components/snack_bar.dart';
import '../../../models/meal.dart';
import '../store/details.store.dart';

class MealDetailsPage extends StatefulWidget {
  @override
  _MealDetailsPageState createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  MealDetailsStore store;
  Meal meal;
  final scaffKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    meal = ModalRoute.of(context).settings.arguments ??
        Meal(id: 'default', name: 'default', image: 'default');
    store = Provider.of<MealDetailsStore>(context);
    store.findDetails(
      meal.id,
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
      body: Observer(
        builder: (_) {
          return store.mealDetails == null
              ? TheCircularProgressIndicator()
              : CustomScrollView(
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: <Widget>[
                    SliverAppBar(
                      stretch: true,
                      expandedHeight: 300.0,
                      flexibleSpace: FlexibleSpaceBar(
                        stretchModes: <StretchMode>[
                          StretchMode.zoomBackground,
                          StretchMode.blurBackground,
                          StretchMode.fadeTitle,
                        ],
                        centerTitle: true,
                        title: Text(meal.name),
                        background: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              meal.image,
                              fit: BoxFit.cover,
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.0, 0.5),
                                  end: Alignment.center,
                                  colors: <Color>[
                                    Color(0x60000000),
                                    Color(0x00000000),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: store.mealDetails == null
                                ? TheCircularProgressIndicator()
                                : Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          title: Text(
                                            store.mealDetails.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1,
                                          ),
                                          subtitle: Text(
                                            store.mealDetails.category,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          trailing: Wrap(
                                            spacing: 10,
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                    Icons.video_collection),
                                                color: Colors.white,
                                                onPressed: () {
                                                  store.openYoutube(
                                                      store.mealDetails.video,
                                                      () => scaffKey
                                                          .currentState
                                                          .showSnackBar(
                                                              snackBar));
                                                },
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.share),
                                                color: Colors.white,
                                                onPressed: () {
                                                  Share.share(
                                                      store.mealDetails
                                                          .toString(),
                                                      subject: store
                                                          .mealDetails.name);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Ingredients:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                        ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: store
                                              .mealDetails.ingredients.length,
                                          itemBuilder: (context, index) {
                                            return Text(
                                              '• ${store.mealDetails.measures[index]} ${store.mealDetails.ingredients[index]}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            );
                                          },
                                        ),
                                        Divider(
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Instructions:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16),
                                          child: Text(
                                            store.mealDetails.instructions,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
