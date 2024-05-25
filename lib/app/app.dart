import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/app/routes.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: routes,
      // routes: {
      //   '/': (context) => const SplashScreen(),
      //   '/sign-in': (context) => const SignInScreen(),
      //   '/sign-up': (context) => const SignUpScreen(),
      //   '/home': (context) => const HomeScreen(),
      //   '/cart': (context) => const CartScreen(),
      //   '/detail-product': (context) => const DetailProductScreen(),
      //   '/checkout-detail': (context) => const CheckoutScreen(),
      //   '/favorite': (context) => const FavoriteScreen(),
      //   '/my-profile': (context) => const EditProfilePage(),
      //   '/checkout-success': (context) => const CheckoutSuccessScreen(),
      //   '/message': (context) => const MessagePage(),
      //   '/detail-chat': (context) => const DetailChat(),
      // },
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