import 'package:flutter/material.dart';
import 'package:lezazel_flutter/thema.dart';
import 'package:lezazel_flutter/widget/widget.dart';

class DetailChat extends StatelessWidget {
  const DetailChat({super.key});

  static const routeName = '/detail-chat';

  @override
  Widget build(BuildContext context) {
    header() {
      return PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            backgroundColor: backgroundColor,
            centerTitle: false,
            title: Row(
              children: [
                Image.asset(
                  'assets/images/splash.png',
                  width: 60,
                ),
                const SizedBox(
                  width: 12,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lezazel Food',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Online',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ));
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: const [
          ChatBubbel(
            text: 'Hi, This item is still available?',
            isSender: true,
            hasProduct: true,
          ),
          ChatBubbel(
            text: 'beak broook',
            isSender: false,
          ),
        ],
      );
    }

    Widget productPrev() {
      return Container(
        width: 225,
        height: 80,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: lezazelColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/ayamGoreng.jpeg',
                  width: 54,
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ayam Goreng',
                    style: TextStyle(fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Rp 10.000',
                    style: priceTextStyle,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.close,
              color: lezazelColor,
              size: 20,
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            productPrev(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xffDAD9D9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type Message...',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: lezazelColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.send, color: Colors.white),
                )
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
