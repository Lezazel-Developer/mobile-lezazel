import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lezazel_flutter/auth/sign_up.dart';
import 'package:lottie/lottie.dart';
import '../auth/sign_in.dart';

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
                    'assets/jsons/welcome.json',
                    width: 370,
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Welcome to Lezazel',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Lorem ipsum dolor elit elit elit Volupta consectetur adipisicing elit. reprehenderit iusto  .',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff777777),
                      fontSize: 16,
                      fontWeight: FontWeight.w100),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const SignUp()),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFEA300),
                    fixedSize: const Size(370, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Create an Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 27),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const SignIn()),
                        (route) => false);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 2, color: Colors.grey),
                    fixedSize: const Size(370, 50),
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
