import 'package:flutter/material.dart';

import '../thema.dart';

class PaymentItem extends StatelessWidget {
  final String title;
  final String price;
  const PaymentItem({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: secondaryTextStyle.copyWith(
            fontSize: 14,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontWeight: medium,
          ),
        ),
      ],
    );
  }
}
