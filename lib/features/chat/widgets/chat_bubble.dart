import 'package:flutter/material.dart';
import 'package:lezazel_flutter/thema.dart';

class ChatBubbel extends StatelessWidget {
  final String text;
  final bool isSender;
  final bool hasProduct;

  const ChatBubbel(
      {super.key,
      this.text = '',
      this.isSender = false,
      this.hasProduct = false});

  @override
  Widget build(BuildContext context) {
    Widget productPrev() {
      return Container(
        width: 230,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSender ? Colors.white : const Color(0xffDDC8A8),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            bottomLeft: Radius.circular(isSender ? 12 : 0),
            bottomRight: const Radius.circular(12),
            topRight: Radius.circular(isSender ? 0 : 12),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/ayamBakar.jpeg',
                      width: 70,
                    )),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ayam Bakar',
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Rp. 15.000  ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 21,
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: greyColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: lezazelColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    child: const Text(
                      'Buy',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct ? productPrev() : const SizedBox(),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.65,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isSender ? Colors.white : const Color(0xffDDDDDD),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      bottomLeft: Radius.circular(isSender ? 12 : 0),
                      bottomRight: const Radius.circular(12),
                      topRight: Radius.circular(isSender ? 0 : 12),
                    ),
                  ),
                  child: Text(
                    text,
                    style: blackTextStyle,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
