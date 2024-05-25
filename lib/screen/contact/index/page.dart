import 'package:flutter/material.dart';
import 'package:lezazel_flutter/extensions/extensions.dart';
import 'package:lezazel_flutter/thema.dart';
import 'package:lottie/lottie.dart';

part 'sections/content_section.dart';
part 'sections/input_section.dart';


class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: backgroundColor,
        title: const Text('Contact Admin'),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _InputContact(),
                _ContentContact(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





