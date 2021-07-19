import 'package:flutter/material.dart';

import 'constants/colors.dart';

ThemeData appTheme() {
  return ThemeData(
      appBarTheme: AppBarTheme(
        color: eternity,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        bodyText2: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.normal,
        ),
      ),
      scaffoldBackgroundColor: deepOak);
}
