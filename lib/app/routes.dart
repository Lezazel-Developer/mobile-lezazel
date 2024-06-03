import 'package:flutter/material.dart';
import 'package:lezazel_flutter/features/home/pages/main/new_main.dart';
import '../screen/screen.dart';
import 'package:lezazel_flutter/features/features.dart';

Route<dynamic> routes(RouteSettings settings) {
  switch (settings.name){
    case SignInScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SignInScreen());
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpScreen());
    case MainPage.routeName:
      return MaterialPageRoute(builder: (context) => const MainPage());
    case CartScreen.routeName:
      return MaterialPageRoute(builder: (context) => const CartScreen());
    case DetailProductScreen.routeName:
      return MaterialPageRoute(builder: (context) => const DetailProductScreen());
    case CheckoutScreen.routeName:
      return MaterialPageRoute(builder: (context) => const CheckoutScreen());
    case FavoriteScreen.routeName:
      return MaterialPageRoute(builder: (context) => const FavoriteScreen());
    case EditProfilePage.routeName:
      return MaterialPageRoute(builder: (context) => const EditProfilePage());
    case CheckoutSuccessScreen.routeName:
      return MaterialPageRoute(builder: (context) => const CheckoutSuccessScreen());
    case MessagePage.routeName:
      return MaterialPageRoute(builder: (context) => const MessagePage());
    case DetailChat.routeName:
      return MaterialPageRoute(builder: (context) => const DetailChat());
    default: return MaterialPageRoute(builder: (context) => const MainPage());
  }
}