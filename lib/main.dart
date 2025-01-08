import 'package:delta_live/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Delta());
}

class Delta extends StatelessWidget {
  const Delta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashView(),
    );
  }
}
