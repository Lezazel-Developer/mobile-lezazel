import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/screen/cart_screen.dart';
import 'package:lezazel_flutter/screen/checkout_detail_screen.dart';
import 'package:lezazel_flutter/screen/checkout_success.dart';
import 'package:lezazel_flutter/screen/contact_screen.dart';
import 'package:lezazel_flutter/screen/detail_product_screen.dart';
import 'package:lezazel_flutter/home/favorite.dart';
import 'package:lezazel_flutter/screen/home_screen.dart';
import 'package:lezazel_flutter/screen/profile_item.dart';
import 'package:lezazel_flutter/screen/splash_screen.dart';

import 'auth/sign-in-new.dart';
import 'auth/sign-up-new.dart';
import 'home/chat/detail_chat.dart';
import 'home/chat/chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SplashScreen(),
        '/sign-in': (context) => const SignInScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/cart': (context) => const CartScreen(),
        '/detail-product': (context) => const DetailProductScreen(),
        '/checkout-detail': (context) => const CheckoutScreen(),
        '/favorite': (context) => const FavoriteScreen(),
        '/my-profile': (context) => const EditProfilePage(),
        '/checkout-success': (context) => const CheckoutSuccessScreen(),
        '/message': (context) => const MessagePage(),
        '/detail-chat': (context) => const DetailChat(),
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
