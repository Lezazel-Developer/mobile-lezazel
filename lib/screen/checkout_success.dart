
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:lezazel_flutter/thema.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Checkout Success',
        ),
        elevation: 0,
      );
    }

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/shopping-cart.png',
              width: 150,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You made a transaction',
              style: TextStyle(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Stay at home while we\nprepare your dream shoes',
              style: secondaryTextStyle,
              textAlign: TextAlign.center,
            ),
            Container(
              width: 196,
              height: 44,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                style: TextButton.styleFrom(
                  backgroundColor: lezazelColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Order Other Shoes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
            Container(
              width: 196,
              height: 44,
              margin: EdgeInsets.only(
                top: 12,
              ),
              child: TextButton(
                onPressed: () {
                  Flushbar(
                    flushbarStyle: FlushbarStyle.GROUNDED,
                    flushbarPosition: FlushbarPosition.TOP,
                    title: "Hello Yudi Oli Samping",
                    message: "Thank you for your order! We will process it as soon as possible.\n happy nice day🥳",
                    duration: Duration(seconds: 3),
                    isDismissible: false,
                  )..show(context); },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xffB7B6BF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'View My Order',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: semiBold,
                    color: Color(0xff777777),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      // appBar: header(), // You can uncomment this if you want the AppBar
      body: content(),
    );
  }
}
