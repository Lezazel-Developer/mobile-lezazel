import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/screen/cart_screen.dart';
import 'package:lezazel_flutter/screen/checkout_detail_screen.dart';
import 'package:lezazel_flutter/screen/detail_prduct_screen.dart';
import 'package:lezazel_flutter/screen/home_screen.dart';
import 'package:lezazel_flutter/screen/splash_screen.dart';

import 'auth/sign_in.dart';
import 'auth/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const CheckoutScreen(),
        '/sign-in': (context) => const SignIn(),
        '/sign-up': (context) => const SignUp(),
        '/home': (context) => const HomeScreen(),
        '/cart': (context) => const CartScreen(),
        '/checkout-detail': (context) => const CheckoutScreen(),
        '/detail-product': (context) => const DetailProductScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Lezazel',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
