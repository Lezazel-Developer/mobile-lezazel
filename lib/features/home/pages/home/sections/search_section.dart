import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          color: const Color(0xffE6E6E6),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ]),
      child: TextFormField(
          decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: const Icon(FeatherIcons.search),
        prefixIconColor: const Color(0xffAAA8A8),
        hintText: 'Search for partner xixi',
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0xffAAA8A8),
          height: 150 / 100,
        ),
      )),
    );
  }
}
