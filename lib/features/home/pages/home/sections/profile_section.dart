import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/preferences/preferences.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hallo, Name',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '@email registered',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/my-profile');
              },
              child: Image.asset(MainAssets.profile,
                  width: 60, height: 60)),
        ],
      ),
    );
    ();
  }
}
