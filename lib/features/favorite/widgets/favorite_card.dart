import 'package:flutter/material.dart';
import 'package:lezazel_flutter/preferences/assets.dart';
import 'package:lezazel_flutter/thema.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 10, left: 12, right: 20, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: cardColor,
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                MainAssets.ayamBakar,
                width: 70,
              )),
          const SizedBox(
            width: 12,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ayam Bakar',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Rp. 15.000',
                style: priceTextStyle,
              ),
            ],
          )),
          Icon(
            Icons.favorite,
            color: lezazelColor,
            size: 26,
          ),
        ],
      ),
    );
  }
}
