import 'package:e_commerce_app/Router/router.dart';
import 'package:e_commerce_app/Views/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class SplachScreen extends StatelessWidget {
  navigateFun(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    AppRouter.NavigateToWidget(HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    navigateFun(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 1.0),
            colors: [Color(0xff667eea), Color(0xff64b6ff)],
            stops: [0.0, 1.0],
          ),
          border: Border.all(width: 1.0, color: const Color(0xff707070)),
        ),
        child: const Center(
          child: Image(
            image: AssetImage("assets/images/Logo.png"),
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
