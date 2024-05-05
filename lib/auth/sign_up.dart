import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/auth/sign_in.dart';
import 'package:lezazel_flutter/widget/form.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(text: '');
    final TextEditingController passwordController = TextEditingController(text: '');
    final TextEditingController emailController = TextEditingController(text: '');
    final TextEditingController phoneController = TextEditingController(text: '');
    bool isHidden = true;

    void toggleVisibility() {
      setState(() {
        isHidden = !isHidden;
      });
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: -40,
                  left: 280,
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.30),
                          blurRadius: 30,
                          offset: const Offset(0, -10),
                        )
                      ],
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                ),
                Positioned(
                  top: -50,
                  left: -40,
                  child: Transform.rotate(
                    angle: 0.30,
                    child: Container(
                      height: 190,
                      width: 190,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.30),
                            blurRadius: 30,
                            offset: const Offset(0, -10),
                          )
                        ],
                        color: const Color(0xff999999),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -75,
                  left: 5,
                  child: Transform.rotate(
                    angle: 0.20,
                    child: Container(
                      height: 190,
                      width: 420,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.30),
                            blurRadius: 30,
                            offset: const Offset(0, -10),
                          )
                        ],
                        color: const Color(0xffFEA300),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 160,
                  child: Text(
                    'Register',
                    style: GoogleFonts.inriaSans(
                        fontSize: 30, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 211,
                  left: 200,
                  child: Container(
                      child: Image.asset('images/ayam-removebg-preview.png',
                          height: 250)),
                ),
              ],
            ),
          ),
          Container(
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  blurRadius: 10,
                  offset: const Offset(0, -10),
                )
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomField(
                    title: 'Name',
                    controller: nameController,
                    hintText: 'Full name',
                    prefixIcon: const Icon(Icons.account_box),
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
                    obscureText: isHidden,
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      onPressed: toggleVisibility,
                      icon: Icon(
                          isHidden ? Icons.visibility : Icons.visibility_off),
                    ),
                    controller: passwordController,
                    hintText: 'ssst!',
                  ),
                  CustomField(
                    title: 'Confirm password',
                    obscureText: isHidden,
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      onPressed: toggleVisibility,
                      icon: Icon(
                          isHidden ? Icons.visibility : Icons.visibility_off),
                    ),
                    controller: passwordController,
                    hintText: 'ssst!',
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "forgot password?",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFEA300),
                      fixedSize: const Size(370, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Create an Account",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 30),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/sign_in');
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: Color(0xffFEA300),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
