import 'package:flutter/material.dart';
import 'package:the_meal_app/constants/colors.dart';

class TheCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: ETERNITY,
      ),
    );
  }
}
