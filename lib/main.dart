import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';
import 'features/categories/repositories/categories.repository.dart';
import 'features/categories/screens/categories.page.dart';
import 'features/categories/store/categories.store.dart';
import 'features/details/repositories/details.repository.dart';
import 'features/details/screens/details.page.dart';
import 'features/details/store/details.store.dart';
import 'features/meals/repositories/meals.repository.dart';
import 'features/meals/screens/meals.page.dart';
import 'features/meals/store/meals.store.dart';
import 'features/splash/screens/splash.page.dart';

void main() {
  runApp(TheMealApp());
}

class TheMealApp extends StatelessWidget {
  final Dio dio = Dio();
  final String initialRoute;
  final CategoriesRepository categoriesRepository;
  final MealsRepository mealsRepository;
  final MealDetailsRepository mealDetailsRepository;

  TheMealApp({
    this.initialRoute,
    this.categoriesRepository,
    this.mealsRepository,
    this.mealDetailsRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => CategoriesStore(
            categoriesRepository ?? CategoriesRepository(dio),
          ),
        ),
        Provider(
          create: (_) => MealsStore(
            mealsRepository ?? MealsRepository(dio),
          ),
        ),
        Provider(
          create: (_) => MealDetailsStore(
            mealDetailsRepository ?? MealDetailsRepository(dio),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'The Meal App',
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute ?? '/splash_screen_page',
        theme: appTheme(),
        routes: <String, WidgetBuilder>{
          '/splash_screen_page': (context) => SplashScreenPage(),
          '/categories_page': (context) => CategoriesPage(),
          '/meals_page': (context) => MealsPage(),
          '/meal_details_page': (context) => MealDetailsPage(),
        },
      ),
    );
  }
}