import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lezazel_flutter/extensions/extensions.dart';
import 'package:lezazel_flutter/widget/button.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: ListView(children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35.0,
            ),
            child: Column(
              children: [
                Center(
                  child: Lottie.asset(
                    'assets/jsons/check-out.json',
                    width: 370,
                  ),
                ),
                50.0.h,
                const Text(
                  'Welcome to Lezazel',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Dengan bahan dasar ayam pedaging sebagai pilar protein, lezazel tak hanya memberikan fleksibilitas dinamis, tapi juga kelezatan dalam setiap gigitannya .',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff777777),
                      fontSize: 16,
                      fontWeight: FontWeight.w100),
                ),
                50.0.h,
                CustomButton(
                    title: 'Create an account',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/sign-up');
                    }
                ),
                20.0.h,
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/sign-in');
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    fixedSize: const Size(370, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
