import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TheCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: eternity,
      ),
    );
  }
}
