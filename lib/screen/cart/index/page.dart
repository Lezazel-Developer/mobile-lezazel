import 'package:flutter/material.dart';
import '../../../../../../thema.dart';

part 'sections/card_section.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text(
          'Cart',
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
      );
    }

    Widget emptyCart() {
      return Expanded(
        child: Container(
          color: backgroundColor,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/cart.png', width: 150,),
                const SizedBox(height: 20,),
                const Text(
                  'Opss! Your Cart is Empty',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 12,),
                const Text(
                  'Let\'s find your favorite shoes',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  width: 154,
                  height: 44,
                  margin: const EdgeInsets.only(top: 20),
                  child: TextButton(
                      onPressed: (){
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: lezazelColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                      child: const Text('Explore Store', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),)
                  ),
                )
              ],
            ),
          ),

        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin
        ),
        children: const [
          _CardSection(),
        ],
      );
    }

    Widget customButtonNav(){
      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
        ),
        height: 180,
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: TextStyle(fontSize: 14),),
                Text('Rp 55.000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),)
              ],
            ),
            const SizedBox(height: 30,),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: lezazelColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout-detail');
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Checkout Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward_rounded, color: Colors.white,),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: content(),
      bottomNavigationBar: customButtonNav(),
    );
  }
}
