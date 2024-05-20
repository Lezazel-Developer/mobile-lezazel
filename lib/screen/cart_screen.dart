import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/thema.dart';

import '../models/product-model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> quantities = [];

  @override
  void initState() {
    super.initState();
    quantities = List<int>.filled(products.length, 1, growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: 'Back to Home',
            backgroundColor: const Color(0xff888888),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/home'));
            },
            child: const Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            tooltip: 'Order',
            backgroundColor: const Color(0xff888888),
            onPressed: () {
              Navigator.pushNamed(context, '/checkout-detail');
            },
            child: const Icon(Icons.shopping_cart, color: Colors.black),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Order List',
            style: GoogleFonts.roboto(
                color: const Color(0xff35385A),
                fontSize: 24,
                fontWeight: FontWeight.w700)),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
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

  Widget buildProduct(ProductModel productmodel, int index) {
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
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage('assets/images/${productmodel.image}'),
                        fit: BoxFit.cover
                      )
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
                        productmodel.title,
                        style: GoogleFonts.manrope(
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
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff999999),
                          borderRadius: BorderRadius.circular(8)),
                      height: 30,
                      width: 30,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantities[index] > 0) {
                                quantities[index]--;
                                if (quantities[index] == 0) {
                                  quantities.removeAt(index);
                                  products.removeAt(index);
                                }
                              }
                            });
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${quantities[index]}',
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff2BAB29),
                          borderRadius: BorderRadius.circular(8)),
                      height: 30,
                      width: 30,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              quantities[index]++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}