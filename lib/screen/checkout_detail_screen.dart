import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/models/payment-items-model.dart';
import 'package:lezazel_flutter/thema.dart';
import 'package:lottie/lottie.dart';

import '../widget/adress_detail_item.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _addressController = TextEditingController();

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Checkout success!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
    Navigator.pushNamedAndRemoveUntil(context, '/checkout-success', (route) => false);

    setState(() {
      isLoading = false;
    });
  }
  bool isLoading = false;

  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    handleCheckout() async {
      setState(() {
        isLoading = true;
      });

      setState(() {
        isLoading = false;
      });
    }

    Widget content() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.20),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      color: const Color(0xfffea300),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.20),
                          blurRadius: 10,
                          offset: const Offset(0, 10),
                        )
                      ]),
                  child: Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assets/images/ayamRica.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Chicken Leg',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp. 20.000',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                const Text(
                  'x1',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.20),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const AddressDetailItem(
                  title: 'Lezazel Restaurant',
                  subtitle: 'Resaturant Location',
                  icon: Icons.home_work,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Image.asset(
                    'assets/images/icon_line.png',
                    height: 30,
                  ),
                ),
                GestureDetector(
                  onTap: () => _focusNode.unfocus(),
                  child: TextFormField(
                    controller: _addressController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(FeatherIcons.mapPin),
                      hintText: '|  Enter your address..',
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // NOTE: PAYMENT SUMMARY
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.20),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const PaymentItem(
                  title: 'Product Quantity',
                  price: '2 items',
                ),
                const SizedBox(
                  height: 15,
                ),
                const PaymentItem(
                  title: 'Product Price',
                  price: '55.000',
                ),
                const SizedBox(
                  height: 25,
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xff999999),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '55.000',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NOTE: CHECKOUT BUTTON
          SizedBox(
            height: defaultMargin,
          ),
          const Divider(
            thickness: 1,
            color: Color(0xff999999),
          ),
          isLoading
              ? Container(
                  margin: const EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              :Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  handleCheckout();
                  _showSnackbar(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: lezazelColor,
                  fixedSize: const Size(380, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Checkout Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          Lottie.asset('assets/jsons/check-out.json', width: 400),
        ],
      );
    }


    return Scaffold(
      backgroundColor: const Color(0xffF4F2EF),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F2EF),
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Checkout Detail',
            style: GoogleFonts.poppins(
                color: const Color(0xff35385A),
                fontSize: 24,
                fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: content()),
    );
  }
}
