import 'package:flutter/material.dart';
import 'package:lezazel_flutter/auth/widget/custom_field.dart';
import 'package:lezazel_flutter/auth/widget/loading_button.dart';
import 'package:lezazel_flutter/extensions/extensions.dart';
import 'package:lezazel_flutter/providers/auth_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../widget/button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String routeName = '/sign-in';

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final TextEditingController passwordController =
      TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');

  bool isHidden = true;
  bool isLoading = false;

  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.login(
          email: emailController.text, password: passwordController.text)) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Login failed',
            textAlign: TextAlign.center,
          ),
        ));
      }
    }

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Sign In to Continue',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: CustomField(
              title: 'Email',
              hintText: 'example@gmail.com',
              prefixIcon: const Icon(Icons.email),
              controller: emailController,
            ),
          ),
          CustomField(
            title: 'Password',
            obscureText: isHidden,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: toggleVisibility,
              icon: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
            ),
            controller: passwordController,
            hintText: 'Enter your password',
          ),
          25.0.h,
          isLoading
              ? const LoadingButton()
              : CustomButton(
                  title: 'Sign In',
                  onPressed: handleSignIn,
                ),
          24.0.h,
        ],
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have an account? ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              header(),
              content(),
              footer(),
              Lottie.asset('assets/jsons/sign-in.json'),
            ],
          ),
        ),
      ),
    );
  }
}
