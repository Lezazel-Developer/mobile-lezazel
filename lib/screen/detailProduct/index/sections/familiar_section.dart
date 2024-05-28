part of '../page.dart';

class _FamiliarProduct extends StatefulWidget {
  const _FamiliarProduct({
    super.key,
  });

  @override
  State<_FamiliarProduct> createState() => _FamiliarProductState();
}

class _FamiliarProductState extends State<_FamiliarProduct> {
  int index = -1;
  List familiarProduct = [
    'assets/images/ayamBakar.jpeg',
    'assets/images/ayamGoreng.jpeg',
    'assets/images/ayamPenyet.jpeg',
    'assets/images/ayamRica.jpeg',
    'assets/images/ayamBakar.jpeg',
    'assets/images/ayamGoreng.jpeg',
    'assets/images/ayamPenyet.jpeg',
    'assets/images/ayamRica.jpeg',
  ];

  Widget familiarProductCard(String imageUrl) {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.only(
        right: 16,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageUrl)),
        borderRadius: BorderRadius.circular(12 / 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            overflow: TextOverflow.ellipsis,
            'Familiar Products',
            style: TextStyle(fontSize: 16, fontWeight: bold),
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: familiarProduct.map((image) {
              index++;
              return Container(
                  margin: EdgeInsets.only(
                      left: index == 0 ? defaultMargin : 0),
                  child: familiarProductCard(image));
            }).toList(),
          ),
        )
      ],
    );
  }
}