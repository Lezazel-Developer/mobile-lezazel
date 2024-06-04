import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lezazel_flutter/extensions/extensions.dart';
import 'package:lezazel_flutter/preferences/assets.dart';
import 'package:lezazel_flutter/thema.dart';

part 'sections/food_detail_section.dart';
part 'sections/price_section.dart';
part 'sections/familiar_section.dart';



class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  static const String routeName = '/detail-product';

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;

  AnimationController? _animationController;
  Animation<Offset>? _slideAnimation;
  Animation<double>? _fadeAnimation;


  String shoppingBag = 'assets/images/shopping-bag.png';

  String foodDesc = 'assets/images/foodDescription.png';

  List images = [
    'assets/images/ayamBakar.jpeg',
    'assets/images/ayamGoreng.jpeg',
    'assets/images/ayamPenyet.jpeg'
  ];


  //NOTE: SNACKBAR
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      _animationController?.forward(from: 0.0);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: isFavorite ? Colors.green : Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          content: SlideTransition(
            position: _slideAnimation!,
            child: FadeTransition(
              opacity: _fadeAnimation!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    isFavorite
                        ? 'Added to favorites'
                        : 'Removed from favorites',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //NOTE:
    Future<void> showSuccessDialog() async {
      showDialog(
        context: context,
        builder: (BuildContext context) => SizedBox(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/success.png',
                  width: 100,
                ),
                12.0.h,
                Text(
                  'Yeayyy!!',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
                12.0.h,
                Text(
                  'Item added successfully',
                  style: blackTextStyle,
                ),
                20.0.h,
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Container(
                    width: 154,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green.shade300,
                    ),
                    child: const Center(
                      child: Text(
                        'view my cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      );
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).pop();
    }



    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          //NOTE: HEADER
          SliverAppBar(
            leading: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffE6E6E6).withOpacity(.5),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            actions: [
              Image.asset(shoppingBag, width: 40, height: 40),
              16.0.w,
            ],
            backgroundColor: const Color(0xfffea300),
            pinned: true,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: CarouselSlider(
                  items: images
                      .map(
                        (image) => SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    height: 500, // Adjust height as needed
                    autoPlay: true, // Optional: if you want auto play
                  )),
              title: const Text('Nama Product'),
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
            ),
          ),

          //NOTE: DETAIL PRODUCT
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const _Price(),
                      GestureDetector(
                        onTap: _toggleFavorite,
                        child: Image.asset(
                          isFavorite ? MainAssets.enableLike : MainAssets.disableLike,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                  20.0.h,

                  // NOTE: Description
                  const _FoodDetail(),

                  40.0.h,

                  const _FamiliarProduct(),

                  50.0.h,
                  // NOTE: BUTTON
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/message');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xff8E8D8B)),
                            color: const Color(0xff8E8D8B),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Icon(Icons.message_rounded,
                              color: Colors.black),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showSuccessDialog();
                        },
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xffEEC27F)),
                            color: lezazelColor,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Center(
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.0.h,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



