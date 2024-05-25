import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:lezazel_flutter/thema.dart';

import '../widget/profile_form.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  static const routeName = '/edit-profile';

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  AnimationController? _animationController;
  Animation<Offset>? _slideAnimation;
  Animation<double>? _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _showSnackbar(BuildContext context) {
    _animationController?.forward(from: 0.0);
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            content: SlideTransition(
              position: _slideAnimation!,
              child: FadeTransition(
                opacity: _fadeAnimation!,
                child: const Text(
                  'Profile changes saved!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            backgroundColor: Colors.blue,
            duration: const Duration(seconds: 1),
          ),
        )
        .closed
        .then((_) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    });
  }

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
              hintText:
                  'Perumahan Sari indah permai, Blok B/27, RT/021, RW/002',
              prefixIcon: Icon(FeatherIcons.mapPin),
              controller: null,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Edit Profile',
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.green,
            ),
            onPressed: () {
              _showSnackbar(context);
            },
          )
        ],
      ),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
