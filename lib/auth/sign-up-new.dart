import 'package:flutter/material.dart';
import 'package:lezazel_flutter/widget/form.dart';

import '../widget/button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      // Simulate login process
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Register',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Sign Up to Continue',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account? ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/sign-in', (route) => false);
              },
              child: const Text(
                'Sign In',
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
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: CustomField(
                    title: 'Name',
                    controller: nameController,
                    hintText: 'Yudi Oli Samping',
                    prefixIcon: const Icon(Icons.account_box),
                  ),
                ),
                CustomField(
                    title: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'example@gmail.com',
                    controller: emailController),
                CustomField(
                    title: 'Phone number',
                    prefixIcon: const Icon(Icons.phone),
                    hintText: '08**-****-****',
                    controller: phoneController),
                CustomField(
                  title: 'Password',
                  obscureText: _isPasswordHidden,
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: IconButton(
                    onPressed: _togglePasswordVisibility,
                    icon: Icon(_isPasswordHidden
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  controller: passwordController,
                  hintText: 'Enter your password',
                ),
                CustomField(
                  title: 'Confirm password',
                  obscureText: _isConfirmPasswordHidden,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: _toggleConfirmPasswordVisibility,
                    icon: Icon(_isConfirmPasswordHidden
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  controller: confirmPasswordController,
                  hintText: 'Confirm your password',
                ),
                isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(22.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.blue), // Ganti warna di sini
                          ),
                        ),
                      )
                    : CustomButton(
                        title: 'Sign In',
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/home', (route) => false);
                        },
                      ),
                const SizedBox(height: 24),
                footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
