import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final String hintText;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  const CustomField({
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: TextFormField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8), // Atur padding secara vertikal di sini
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}