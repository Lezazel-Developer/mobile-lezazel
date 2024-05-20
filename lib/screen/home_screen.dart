import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lezazel_flutter/home/home.dart';
import 'package:lezazel_flutter/home/favorite.dart';
import 'package:lezazel_flutter/screen/contact_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import '../home/chat/chat_page.dart';
import '../thema.dart';


var selectedCategory = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xffDDDDDC),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
          child: WaterDropNavBar(
            bottomPadding: 20,
            backgroundColor: const Color(0xffDDDDDC),
            onItemSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
              pageController.animateToPage(selectedIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad);
            },
            selectedIndex: selectedIndex,
            barItems: <BarItem>[
              BarItem(
                filledIcon: Icons.home_rounded,
                outlinedIcon: Icons.home_outlined,
              ),
              BarItem(
                  filledIcon: Icons.favorite_rounded,
                  outlinedIcon: Icons.favorite_border_rounded),
              BarItem(
                filledIcon: Icons.message_rounded,
                outlinedIcon: Icons.message_outlined,
              ),
              BarItem(
                filledIcon: Icons.manage_accounts,
                outlinedIcon: Icons.manage_accounts_outlined,
              ),

            ],

          ),

        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const <Widget>[
            HomePage(),
            Center(child: FavoriteScreen()),
            Center(child: MessagePage()),
            ContactScreen()
          ],
        ),
      ),
    );
  }
}
