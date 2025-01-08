import 'package:delta_live/view/home_view.dart';
import 'package:delta_live/model/splash_model.dart';
import 'package:flutter/material.dart';

class SplashController {
  final SplashModel model;

  SplashController(this.model);

  Future<void> initializeApp(BuildContext context) async {
    await model.loadResources();
    // Navigate to the home screen after loading resources.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
    );
  }
}
