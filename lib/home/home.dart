import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/category-model.dart';
import '../models/product-model.dart';
import '../widget/title.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedCategory = 0;
  var selectedPopular = 0;
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return homePage(context);
  }

  SafeArea homePage(BuildContext context) {
    return SafeArea(
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
                      // const SizedBox(height: 30),
                      // buildSearch(),
                      const SizedBox(height: 40),
                      categoryProduct(),
                      const SizedBox(height: 35),
                      const TitleHome(
                        title: 'Popular Products',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // _popularProducts(),
                      popularProduct(products),
                      const SizedBox(height: 35),
                      const TitleHome(
                        title: 'All Products',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
    );
  }

  SizedBox popularProduct(List<ProductModel> productModels) {
    return SizedBox(
      height: 278,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isFocused = selectedPopular == index;
          return Focus(
              onFocusChange: (hasFocus) {
            if (hasFocus) {
              setState(() {
                selectedPopular = index;
              });
            } else {
              setState(() {
                selectedPopular = -1;
              });
            }
          },
          child: GestureDetector(
          onTap: () {
          setState(() {
          selectedPopular = index;
          });
          },
            child: Container(
              width: 215,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isFocused ? const Color(0xffEFEFEF) : const Color(0xffF1F1F1),
                border: Border.all(
                  color: const Color(0xfff1e5e5).withOpacity(.22),
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assets/images/${productModels[index].image}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 30,
                    thickness: 1,
                    color: Color(0xffaaaaaa),
                  ),
                  Text(
                    Category.all()[index],
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: isFocused ? const Color(0xff000000) : const Color(0xff999999),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    productModels[index].title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff000000),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rp ${productModels[index].price}',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: isFocused ? const Color(0xff2C96F1) : const Color(0xffaaaaaa),
                    ),
                  ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        itemCount: productModels.length,
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

  ListView _products() {
    return ListView.separated(

        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => buildProduct(products[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: products.length);
  }

  Container buildProduct(ProductModel productModel) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
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
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/${productModel.image}',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
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
                  productModel.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  'Rp.${productModel.price}',
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w800, fontSize: 16, color:  Colors.green,),

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

  SizedBox categoryProduct() {
    return SizedBox(
      height: 46,
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
              color: selectedCategory == index ? const Color(0xfffea300) : const Color(0xffeeeeee),
              border: selectedCategory == index ? Border.all(color: const Color(0xfff1e5e5).withOpacity(.22), width: 2) : null,
            ),
            child: Center(
              child: Text(
                Category.all()[index],
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  color: selectedCategory == index ? Colors.white : const Color(0xff3f3e3f).withOpacity(.3),
                ),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemCount: Category.all().length,
      ),
    );
  }
}
