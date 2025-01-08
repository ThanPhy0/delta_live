import 'package:delta_live/controller/splash_controller.dart';
import 'package:delta_live/model/splash_model.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = SplashController(SplashModel());
    controller.initializeApp(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage('images/splash_icon.webp')),
            SizedBox(height: 20),
            Text(
              'Welcome to MyApp!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
