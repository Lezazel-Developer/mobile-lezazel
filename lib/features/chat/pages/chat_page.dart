import 'package:flutter/material.dart';
import '../../../thema.dart';
import 'package:lezazel_flutter/widget/widget.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  static const routeName = '/message';

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text(
          'Message',
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
      );
    }

    Widget emptyChat() {
      return Expanded(
          child: Container(
        color: const Color(0xffEAEAEA),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/conversation.png',
                width: 150, height: 150),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Opss no message yet?',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'You have never done a transaction',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              title: 'Explore Store',
              onPressed: () {},
              fixedSize: const Size(230, 45),
            ),
          ],
        ),
      ));
    }

    Widget content() {
      return Expanded(
          child: Container(
              color: backgroundColor,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                children: const [ChatTile()],
              )));
    }

    return Scaffold(
      body: Column(
        children: [header(), content()],
      ),
    );
  }
}
