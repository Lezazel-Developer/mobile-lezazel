part of '../page.dart';


class _FoodDetail extends StatelessWidget {
  const _FoodDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.20),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            'Food Details',
            style: TextStyle(fontSize: 16, fontWeight: bold),
          ),
          12.0.h,
          const Text(
            textAlign: TextAlign.justify,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            'alham dulillahi robil aalamiin, arrohmaanirrohiim maalikiyaumiddiin iyya kana\' budu waiyyakverv a nastaiin ',
          ),
        ],
      ),
    );
  }
}
