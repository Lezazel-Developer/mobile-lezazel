import 'package:flutter/material.dart';
import 'package:lezazel_flutter/thema.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 33),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail-chat');
        },
        child: Column(
          children: [
            Row(children: [
              Image.asset(
                'assets/images/splash.png',
                width: 56,
              ),
              const SizedBox(
                width: 12,
              ),
              const Expanded(
                child: Column(
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
                      'Good night, This item is on.. Good night, This item is on',
                      style: TextStyle(color: Colors.black54),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Text(
                'Now',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ]),
            const SizedBox(
              height: 12,
            ),
            Divider(
              thickness: 1,
              color: disabledColor,
            ),
          ],
        ),
      ),
    );
  }
}
