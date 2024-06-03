import 'package:flutter/material.dart';
import 'package:lezazel_flutter/preferences/preferences.dart';
import '../../../../thema.dart';
import 'package:lezazel_flutter/widget/widget.dart';
import '../widgets/widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text(
          'Favorites',
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
      );
    }

    Widget emptyFavorite() {
      return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(MainAssets.heart, width: 150, height: 150),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'You are not favorite anything yet :)',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Let\'s find your favorite lezazel food',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: 'Explore Store',
                onPressed: () {},
                fixedSize: const Size(230, 45),
              ),
            ],
          ));
    }

    Widget content() {
      return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: const [
              FavoriteCard(),
              FavoriteCard(),
              FavoriteCard(),
              FavoriteCard(),
              FavoriteCard(),
            ],
          ));
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [header(), content()],
      ),
    );
  }
}
