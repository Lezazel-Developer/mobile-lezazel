import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Order List', style: GoogleFonts.roboto(
            color: Color(0xff35385A),
            fontSize: 24,
            fontWeight: FontWeight.w700
        )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children:  [
              const SizedBox(height: 15,),
              _products(),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
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
        color: Color(0xffFDFBF6),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(
            color: const Color(0xff35385A).withOpacity(.12),
            blurRadius: 30,
            offset: const Offset(0, 2)
        )]
    ),
    child: Row(
      children: [
        Container(

          decoration: BoxDecoration(
              color: Color(0xfffea300),
              borderRadius: BorderRadius.circular(100)
          ),
          child: Image.asset('assets/images/${productmodel.image}',
            height: 50,
            width: 50,),
        ),
        const SizedBox(width: 20,),
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productmodel.title,
                style: GoogleFonts.manrope(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Rp.${productmodel.price}',
                style: GoogleFonts.manrope(fontWeight: FontWeight.w100, fontSize: 16),
              ),


            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0xff999999),
              borderRadius: BorderRadius.circular(8)
          ),
          child: InkWell(
              onTap: () {},
              child: Icon(Icons.add, color: Colors.white,)
          ),
          height: 30,
          width: 30,),
      ],
    ),
  );
}
