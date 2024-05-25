import 'package:flutter/material.dart';
import 'package:lezazel_flutter/preferences/preferences.dart';

class TitleHome extends StatelessWidget {
  final String title;
  const TitleHome({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SB.dp20),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
