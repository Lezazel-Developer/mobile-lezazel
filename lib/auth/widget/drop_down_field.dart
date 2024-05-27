import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final String title;
  final String prefixIcon;
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;


  const DropdownField({
    super.key,
    required this.title,
    required this.prefixIcon,
    this.value,
    required this.items,
    required this.onChanged,

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
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 27,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Image.asset(prefixIcon, width: 30, height: 30,),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: value,
                      items: items,
                      onChanged: onChanged,
                      isExpanded: true,
                      hint: const Text(
                        'Select an option',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
