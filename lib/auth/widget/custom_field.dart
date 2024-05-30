import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final String hintText;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomField({
    super.key,
    required this.title,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
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
              fillColor: Colors.grey[200],
              filled: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
