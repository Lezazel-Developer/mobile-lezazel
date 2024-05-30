import 'package:flutter/material.dart';
import 'package:lezazel_flutter/auth/widget/loading_button.dart';
import 'package:lezazel_flutter/preferences/assets.dart';
import 'package:lezazel_flutter/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'widget/widget.dart';

import '../widget/button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/sign-up';

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  String? selectedGender;

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
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  bool isLoading = false;

  void handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        bool isRegistered = await Provider.of<AuthProvider>(context, listen: false).register(
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          phone: phoneController.text,
          gender: selectedGender ?? 'Male',
          password: passwordController.text,
        );
        setState(() {
          isLoading = false;
        });
        if (isRegistered) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Registration failed',
              textAlign: TextAlign.center,
            ),
          ));
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Registration Failed: $e',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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

    Widget content() {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: CustomField(
                title: 'Name',
                controller: nameController,
                hintText: 'Yudi Oli Samping',
                prefixIcon: const Icon(Icons.account_box),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ),
            CustomField(
              title: 'Username',
              prefixIcon: const Icon(Icons.person),
              hintText: 'yudiolisamping',
              controller: usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            CustomField(
              title: 'Email',
              prefixIcon: const Icon(Icons.email),
              hintText: 'example@gmail.com',
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            CustomField(
              title: 'Phone number',
              prefixIcon: const Icon(Icons.phone),
              hintText: '08**-****-****',
              controller: phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            DropdownField(
              title: 'Gender',
              prefixIcon: MainAssets.gender,
              value: selectedGender,
              items: const [
                DropdownMenuItem(
                  value: 'Male',
                  child: Text('Male'),
                ),
                DropdownMenuItem(
                  value: 'Female',
                  child: Text('Female'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            CustomField(
              title: 'Password',
              obscureText: _isPasswordHidden,
              prefixIcon: const Icon(Icons.key),
              suffixIcon: IconButton(
                onPressed: _togglePasswordVisibility,
                icon: Icon(
                    _isPasswordHidden ? Icons.visibility : Icons.visibility_off),
              ),
              controller: passwordController,
              hintText: 'Enter your password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 25),
            isLoading
                ? const LoadingButton()
                : CustomButton(
                    title: 'Sign Up',
                    onPressed: handleSignUp,
                  ),
            const SizedBox(height: 24),
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              header(),
              content(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
