import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lezazel_flutter/screen/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          (route) => false);
    });

    return Scaffold(
        body: Center(
      child: Image.asset('assets/images/splash.png', width: 200, height: 200),
    ));
  }
}
