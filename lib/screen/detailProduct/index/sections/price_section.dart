// ignore_for_file: unused_element

part of '../page.dart';

class _Price extends StatelessWidget {
  const _Price({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/money.png',
            width: 40, height: 40),
        const SizedBox(width: 10),
        Text(
          overflow: TextOverflow.ellipsis,
          'Rp. 100.000',
          style: TextStyle(fontSize: 20, fontWeight: bold),
        ),
      ],
    );
  }
}