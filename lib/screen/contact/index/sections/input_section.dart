part of '../page.dart';

class _InputContact extends StatelessWidget {
  const _InputContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/jsons/contact.json',
            width: 200, height: 200),
        20.0.h,
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
        20.0.h,
      ],
    );
  }
}