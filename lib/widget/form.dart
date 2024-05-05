import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final String hintText;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final void Function(bool)? toggleVisibility;
  final TextEditingController? controller;

  const CustomField({
    super.key,
    required this.title,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.toggleVisibility,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: title,
          hintText: hintText,
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}
