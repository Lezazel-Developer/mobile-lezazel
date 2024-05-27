import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/thema.dart';
import 'package:lottie/lottie.dart';
import '../../models/product_model.dart';

export 'pages/favorite_page.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  static const routeName = '/favorite';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List<bool> likedList;

  @override
  void initState() {
    super.initState();
    likedList = List<bool>.generate(products.length, (index) => true);
  }

  void _toggleFavorite(int index) {
    setState(() {
      likedList[index] = !likedList[index];
      if (!likedList[index]) {
        _showDeleteConfirmation(context, index);
      }
    });
  }

  void _showDeleteConfirmation(BuildContext context, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Are you sure to remove this one?'),
        action: SnackBarAction(
          label: 'Yes',
          onPressed: () {
            setState(() {
              products.removeAt(index);
              likedList.removeAt(index);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.white,
        title: Text('Favorite List',
            style: GoogleFonts.roboto(
                color: const Color(0xff35385A),
                fontSize: 24,
                fontWeight: FontWeight.w700)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
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
      ),
    );
  }

  ListView _products() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => buildProduct(products[index], index),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: products.length);
  }

  Widget buildProduct(ProductModel productModel, int index) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xff111111).withOpacity(.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5))
                ]),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/${productModel.image}'),
                        fit: BoxFit.cover,
                      ),
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
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Rp.${productModel.price}',
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w100, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xffF1F1F1),
                      borderRadius: BorderRadius.circular(100)),
                  height: 50,
                  width: 50,
                  child: GestureDetector(
                    onTap: () {
                      _toggleFavorite(index);
                    },
                    child: Icon(
                      likedList[index]
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: likedList[index]
                          ? Colors.amber
                          : const Color(0xffFEA300),
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EmptyFavorite extends StatelessWidget {
  const EmptyFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/jsons/heart.json', width: 150, height: 150),
          const Text(
            'you are not favorite anything yet',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'let\'s find your favorite things',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xfffea300)),
              ),
              onPressed: () {},
              child: const Text(
                'Explore Store',
                style: TextStyle(color: Colors.black),
              )),
        ],
      ),
    );
  }
}
