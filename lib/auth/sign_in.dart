import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/auth/sign_up.dart';
import 'package:lezazel_flutter/screen/home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignUpState();
}

class _SignUpState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
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
                  top: -85,
                  left: -50,
                  child: Container(
                    height: 230,
                    width: 230,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.30),
                          blurRadius: 30,
                          offset: const Offset(0, -10),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(115)),
                    ),
                  ),
                ),

                Positioned(
                  top: -100,
                  left: -5,
                  child: Transform.rotate(
                    angle: 0.30,
                    child: Container(
                      height: 190,
                      width: 240,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.30),
                            blurRadius: 30,
                            offset: const Offset(0, -10),
                          )
                        ],
                        color: const Color(0xffFEA300),
                        borderRadius: const BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: -60,
                  left: 60,
                  child: Transform.rotate(
                    angle: 0.25,
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
                        color: const Color(0xff999999),
                        borderRadius: const BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 175,
                  child: Text('Login', style: GoogleFonts.inriaSans(fontSize: 30, color: Colors.black),),
                ),

                Positioned(
                  top: 250,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Image.asset('images/ayam_kecil.png', height: 200)
                  ),
                )
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

                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Enter your email',
                            hintText: 'example@gmail.com',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        child: TextField(
                          obscureText: isHidden,
                          controller: passwordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: IconButton(
                                onPressed: toggleVisibility,
                                icon: Icon(isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            labelText: 'Enter Your Password',
                            hintText: 'Ssst!!!',
                            border: const UnderlineInputBorder(),
                          ),
                        ),
                      ),

                      Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
                              MaterialPageRoute(builder: (context) => const HomeScreen()),
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
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 30),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => const SignUp()),
                                    (route) => false);
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: "Dont have an account? ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w200,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Register',
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
              ),
        ],
      ),

    );
  }
}
