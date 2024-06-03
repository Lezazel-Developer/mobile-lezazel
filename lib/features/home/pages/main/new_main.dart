import 'package:flutter/material.dart';
import 'package:lezazel_flutter/preferences/assets.dart';
import 'package:lezazel_flutter/features/features.dart';
import 'package:lezazel_flutter/thema.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/home';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    HomePage(),
    FavoritePage(),
    MessagePage(),
    ContactScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: lezazelColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        child: Image.asset(MainAssets.bag, width: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: backgroundColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items:  [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset(MainAssets.home, width: 30, height: 30),
            ),
            label: 'Home',
          ),BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset(MainAssets.fav, width: 30, height: 30),
            ),
            label: 'Favorites',
          ),BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset(MainAssets.message, width: 30, height: 30),
            ),
            label: 'messages',
          ),BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset(MainAssets.contact, width: 30, height: 30),
            ),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
