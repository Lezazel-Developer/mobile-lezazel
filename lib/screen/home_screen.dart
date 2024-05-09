import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/models/category-model.dart';
import 'package:lezazel_flutter/models/product-model.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

var selectedCategory = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }
  //state appbar
  // int _selectedIndex = 0;
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
    ),
    child: Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xfffea300),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        child: const Icon(Icons.shopping_bag, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //appbar gagal
      //appbar
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: const BorderRadius.vertical(top: Radius.circular(50.0)),
      //   child: BottomAppBar(
      //     notchMargin: 10,
      //     shape: const CircularNotchedRectangle(),
      //     clipBehavior: Clip.antiAlias,
      //     elevation: 0,
      //     // color: Color(0xffE6E6E6),
      //     child: BottomNavigationBar(
      //
      //       type: BottomNavigationBarType.fixed,
      //       selectedItemColor: Colors.amber,
      //       unselectedItemColor: Colors.black,
      //       showUnselectedLabels: true,
      //       showSelectedLabels: true,
      //       selectedLabelStyle: const TextStyle(
      //         color: Colors.amber,
      //         fontSize: 10,
      //       ),
      //       elevation: 0,
      //       currentIndex: _selectedIndex,
      //       onTap: _onItemTapped,
      //       items: [
      //         BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.home_rounded,
      //             color: _selectedIndex == 0 ? Colors.amber : Colors.grey,
      //           ),
      //           label: 'Home',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.favorite_rounded,
      //             color: _selectedIndex == 1 ? Colors.amber : Colors.grey,
      //           ),
      //           label: 'Favorites',
      //         ),
      //
      //         BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.watch_later_rounded,
      //             color: _selectedIndex == 2 ? Colors.amber : Colors.grey,
      //           ),
      //           label: 'History',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.message_rounded,
      //             color: _selectedIndex == 3 ? Colors.amber : Colors.grey,
      //           ),
      //           label: 'Message',
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
        child: WaterDropNavBar(
          backgroundColor: navigationBarColor,
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
              filledIcon: Icons.watch_later_sharp,
              outlinedIcon: Icons.watch_later_outlined,
            ),
            BarItem(
              filledIcon: Icons.message_rounded,
              outlinedIcon: Icons.message_outlined,
            ),
          ],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          SafeArea(
            top: true,
            bottom: false,
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      buildProfile(context),
                      const SizedBox(height: 40),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff6f6f6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.08),
                              blurRadius: 10,
                              offset: const Offset(0, -10),
                            )
                          ],
                          borderRadius:
                              const BorderRadius.vertical(top: Radius.circular(45)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            buildSearch(),
                            const SizedBox(height: 30),
                            categoryProduct(),
                            const SizedBox(height: 30),
                            _products(),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                      // bottomAppbar(),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Center(child: Text('Favorites')),
          const Center(child: Text('History')),
          const Center(child: Text('Message')),
        ],
      ),
      ),
    );
  }

  SizedBox categoryProduct() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: selectedCategory == index
                        ? const Color(0xfffea300)
                        : const Color(0xffeeeeee),
                    border: selectedCategory == index
                        ? Border.all(
                            color: const Color(0xfff1e5e5).withOpacity(.22),
                            width: 2)
                        : null,
                  ),
                  child: Center(
                      child: Text(
                    Category.all()[index],
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: selectedCategory == index
                          ? Colors.white
                          : const Color(0xff3f3e3f).withOpacity(.3),
                    ),
                  )),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
          itemCount: Category.all().length),
    );
  }

  Widget bottomAppbar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.03),
            blurRadius: 30,
            offset: const Offset(0, -10),
          )
        ],
        color: const Color(0xffE6E6E6),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(45)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIconButton(FeatherIcons.home, 'Home'),
          _buildIconButton(Icons.favorite_border_rounded, 'Favorites'),
          _buildIconButton(Icons.history, 'History'),
          _buildIconButton(Icons.message_outlined, 'Message'),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon),
          tooltip: label,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  ListView _products() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => buildProduct(products[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: products.length);
  }

  Container buildProduct(ProductModel productmodel) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: const Color(0xffEEE4D6),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff111111).withOpacity(.3),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xfffea300),
                borderRadius: BorderRadius.circular(100)),
            child: Image.asset(
              'assets/images/${productmodel.image}',
              height: 60,
              width: 60,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productmodel.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  'Rp.${productmodel.price}',
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w100, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffC1C1C1),
                borderRadius: BorderRadius.circular(100)),
            height: 40,
            width: 40,
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/detail-product');
                },
                child: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          color: const Color(0xffE6E6E6),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ]),
      child: TextFormField(
          decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: const Icon(FeatherIcons.search),
        prefixIconColor: const Color(0xffAAA8A8),
        hintText: 'Search for partner xixi',
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0xffAAA8A8),
          height: 150 / 100,
        ),
      )),
    );
  }

  Widget buildProfile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hallo, Name',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '@email registered',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/my-profile');
            },
            icon: const Icon(Icons.account_circle_sharp,
                color: Color(0xff6b6a6a), size: 45),
          ),
        ],
      ),
    );
  }


}
