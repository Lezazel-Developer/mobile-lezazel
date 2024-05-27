import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/models/product_model.dart';
import 'package:lezazel_flutter/preferences/preferences.dart';


class PopularProduct extends StatelessWidget {
  const PopularProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 278,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detail-product');
              },
              child: Container(
                padding: const EdgeInsets.all(1),
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color(0xfff1e5e5).withOpacity(.22),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/${products[index].image}'),
                            fit: BoxFit.cover,

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              products[index].title,
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 5,
                                height: 5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffaaaaaa),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  products[index].price,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffaaaaaa),
                                  ),
                                ),
                              ),

                              const Spacer(),
                              Image.asset(MainAssets.star, width: 20,),
                              const SizedBox(width: 5),

                              Text(
                                '4.3',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffaaaaaa),
                                ),
                              ),

                            ],
                          ),

                          const SizedBox(height: 20)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        itemCount: products.length,
      ),
    );
  }
}
