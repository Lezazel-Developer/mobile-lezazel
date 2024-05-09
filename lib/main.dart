import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/screen/cart_screen.dart';
import 'package:lezazel_flutter/screen/checkout_detail_screen.dart';
import 'package:lezazel_flutter/screen/checkout_success.dart';
import 'package:lezazel_flutter/screen/detail_prduct_screen.dart';
import 'package:lezazel_flutter/screen/favorite_screen.dart';
import 'package:lezazel_flutter/screen/home_screen.dart';
import 'package:lezazel_flutter/screen/splash_screen.dart';

import 'auth/sign-in-new.dart';
import 'auth/sign-up-new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SplashScreen(),
        '/sign-in': (context) => const SignInScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/cart': (context) => const CartScreen(),
        '/detail-product': (context) => const DetailProductScreen(),
        '/checkout-detail': (context) => const CheckoutScreen(),
        '/favorite': (context) => const FavoriteScreen(),
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
