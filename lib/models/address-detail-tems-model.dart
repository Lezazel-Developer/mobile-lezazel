import 'package:flutter/material.dart';

import '../thema.dart';

class AddressDetailItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const AddressDetailItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: light,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: medium,
              ),
            ),
          ],
        )
      ],
    );
  }
}
