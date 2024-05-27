import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/models/product_model.dart';
import 'package:lezazel_flutter/preferences/preferences.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => buildProduct(context, products[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: products.length,
    );
  }
}

Widget buildProduct(BuildContext context, ProductModel productModel) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed('/detail-product');
    },
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(vertical:  20), // Adjust top margin as needed
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff111111).withOpacity(.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 100), // Adjust width as needed
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        productModel.title,
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xfff1e5e5).withOpacity(.22),
                        ),
                        child: Text('Lezazel - Jatinangor',
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffaaaaaa),
                            )),
                      ),
                      const SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Rp.${productModel.price}',
                              style: GoogleFonts.manrope(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          Text(
                              '/Portion',
                              style: GoogleFonts.manrope(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffaaaaaa),
                              ),
                          ),

                          const SizedBox(width: 25),
                          Flexible(
                            child: Text(
                              '4.3',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffaaaaaa),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Image.asset(MainAssets.star, width: 15,),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          top: 5, // Adjust position as needed
          child: Container(
            width: 145,
            height: 145,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.white, // Optional: white border around image
                width: 15,
              ),
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
        ),
      ],
    ),
  );
}
