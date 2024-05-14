import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:lezazel_flutter/thema.dart';

import '../widget/profile_form.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isHidden = true;
  bool isLoading = false;

  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: const Icon(Icons.account_circle, size: 100),
            ),
            const ProfileForm(
              title: 'Name',
              hintText: 'Haidar Miqdad',
              prefixIcon: Icon(Icons.account_circle),
              controller: null,
            ),
            const ProfileForm(
              title: 'Email',
              hintText: 'HaidarMiqdad@gmail.com',
              prefixIcon: Icon(Icons.email),
              controller: null,
            ),
            ProfileForm(
              title: 'Password',
              hintText: '********',
              obscureText: isHidden,
              suffixIcon: IconButton(
                  onPressed: toggleVisibility,
                  icon: isHidden
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility)),
              prefixIcon: const Icon(Icons.account_circle),
              controller: null,
            ),
            const ProfileForm(
              title: 'Phone-number',
              hintText: '0813-1202-7507',
              prefixIcon: Icon(Icons.phone),
              controller: null,
            ),

            const ProfileForm(
              title: 'address',
              hintText: 'Perumahan Sari indah permai, Blok B/27, RT/021, RW/002',
              prefixIcon: Icon(FeatherIcons.mapPin),
              controller: null,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xffF8F8F8),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Edit Profile',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.green.shade500,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
