
part of '../page.dart';

class _CardSection extends StatelessWidget {
  const _CardSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.10),
            blurRadius: 7,
            offset: const Offset(5, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/ayamBakar.jpeg'))),
              ),
              const SizedBox(width: 12,),
               const Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Ayam Bakar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                       Text('Rp 55.000', style: TextStyle(fontSize: 12,color: Colors.green),),
                     ],
                   )
               ),
              Column(
                children: [
                  Image.asset('assets/images/add.png', width: 20,),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text('2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                  ),
                  Image.asset('assets/images/minus.png', width: 20,),
                ],
              )
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              Image.asset('assets/images/delete.png', width: 17,),
              const SizedBox(width: 4),
              const Text('Remove', style: TextStyle(fontSize: 10, color: Colors.red, fontWeight: FontWeight.w600),)
            ],
          )
        ],
      ),

    );
  }
}
