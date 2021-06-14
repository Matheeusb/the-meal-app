import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    Future.delayed(
      Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacementNamed('/categories_page');
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: _animation,
            child: Center(
              child: Image.asset(
                'assets/images/logo-the-meal.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
