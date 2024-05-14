import 'package:flutter/material.dart';
import 'package:lezazel_flutter/thema.dart';

class ProfileForm extends StatelessWidget {
  final String title;
  final bool obscureText;
  final String hintText;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  const ProfileForm({
    super.key,
    required this.title,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: secondaryTextStyle.copyWith(
              fontSize: 13,
            ),
          ),
          TextFormField(
            obscureText: obscureText,
            controller: controller,
            style: TextStyle(
              color: blackColor,
            ),
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(
                color: subtitleColor,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: subtitleColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
