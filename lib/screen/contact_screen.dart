import 'package:flutter/material.dart';
import 'package:lezazel_flutter/thema.dart';
import 'package:lezazel_flutter/widget/button.dart';
import 'package:lottie/lottie.dart';

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
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/jsons/contact.json', width: 200, height: 200),
                const SizedBox(height: 20),
                const Text(
                  'Muadz Hanan Miqdad',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Our customer service team is here to assist you with any questions, feedback, or issues you may have. We are committed to providing you with the best possible service and ensuring your satisfaction.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Phone Number'),
                  subtitle: const Text('+1 234 567 890'),
                  onTap: () {
                    // Implement your logic here to call the admin
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('Email Address'),
                  subtitle: const Text('lezazelf@gmail.com'),
                  onTap: () {
                    // Implement your logic here to send an email to the admin
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Address'),
                  subtitle: const Text('123 Main Street, City, Country'),
                  onTap: () {
                    // Implement your logic here to show the admin's location on a map
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement your logic here to start a chat with the admin
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(lezazelColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(fontSize: 16),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 40),
                    ),
                  ),
                  icon: const Icon(Icons.chat),
                  label: const Text('Start Chat'),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
