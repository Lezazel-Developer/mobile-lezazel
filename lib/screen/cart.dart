import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff888888),
        onPressed: () {
          Navigator.of(context).pushNamed('/checkout');
        },
        child: const Icon(Icons.shopping_bag_outlined),
      ),
      appBar: AppBar(
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 15,),
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
          onTap: () {
            // Tambahkan logika untuk menampilkan detail produk
          },
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: const Color(0xffFDFBF6),
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
                    height: 50,
                    width: 50,
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
                SizedBox(height: 20,),
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
                    const SizedBox(width: 10,),
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
                          color: const Color(0xff999999),
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
