import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/models/category.dart';
import 'package:lezazel_flutter/models/product.dart';

var selectedCategory = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      // backgroundColor: Color(0xffE4D8C6),
      bottomNavigationBar: bottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff888888),
        onPressed: () {
          Navigator.of(context).pushNamed('/cart');
        },
        child: const Icon(Icons.shopping_cart),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 30),
              buildProfile(context),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 10,
                      offset: const Offset(0, -10),
                    )
                  ],
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(45)),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 30),
                    buildSearch(),
                    const SizedBox(
                      height: 30,
                    ),
                    // categories(),
                    const SizedBox(
                      height: 8,
                    ),
                    // buildDivider(),
                    const SizedBox(
                      height: 15,
                    ),
                    _products(),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
                color: const Color(0xff999999),
                borderRadius: BorderRadius.circular(100)),
            height: 45,
            width: 45,
            child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }

  Container buildDivider() {
    return Container(
        width: 270,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color(0xffffffff).withOpacity(0.9),
            blurRadius: 20,
            offset: const Offset(5, 5),
          )
        ]),
        child: const Divider(
          thickness: 1.0,
          color: Color(0xffffffff),
        ));
  }

  Container bottomNavigationBar() {
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
          _buildIconButton(Icons.attach_money_sharp, 'Payment'),
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

  Container buildSearch() {
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
                'Welcome..',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                'Hallo Name',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
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

  Widget categories() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(2, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: selectedCategory == index
                        ? const Color(0xfffea300)
                        : const Color(0xffB6B4B4),
                    border: selectedCategory == index
                        ? Border.all(
                            color: const Color(0xffb5b5b5).withOpacity(.22),
                            width: 2)
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      Category.all()[index],
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: selectedCategory == index
                            ? Colors.white
                            : const Color(0xff3f3e3f).withOpacity(.3),
                      ),
                    ),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: Category.all().length),
    );
  }
}
