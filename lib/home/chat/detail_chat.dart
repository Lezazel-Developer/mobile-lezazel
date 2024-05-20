import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lezazel_flutter/thema.dart';

class DetailChat extends StatelessWidget {
  const DetailChat({super.key});

  @override
  Widget build(BuildContext context) {
     header(){
       return PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            backgroundColor: backgroundColor,
            centerTitle: false,
            title: Row(
              children: [
                Image.asset('assets/images/splash.png', width: 60,),
                const SizedBox(width: 12,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lezazel Food', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4,),
                    Text('Online',
                      style: TextStyle(color: Colors.black54 , fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ));
    }

    Widget productPrev(){
      return Container(
       width: 225,
        height: 80,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: lezazelColor
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/ayamGoreng.jpeg',
                  width: 54,)
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ayam Goreng', style: TextStyle(fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                  Text('Rp 10.000', style: priceTextStyle,),
                ],
              ),
            ),
            Icon(Icons.close, color: lezazelColor, size: 20,)
          ],
        ),
      );
    }

    Widget chatInput(){
       return Container(
         margin: const EdgeInsets.all(20),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisSize: MainAxisSize.min,
           children: [
             productPrev(),
             Row(
               children: [
                 Expanded(
                   child: Container(
                     height: 45,
                     padding: const EdgeInsets.symmetric(horizontal: 16),
                     decoration: BoxDecoration(
                       color: const Color(0xff999999),
                       borderRadius: BorderRadius.circular(12),
                     ),
                     child: Center(
                       child: TextField(
                         decoration: InputDecoration.collapsed(
                           hintText: 'Type Message...',
                           hintStyle: subtitleTextStyle,
                         ),
                       ),
                     ),
                   ),
                 ),
                 const SizedBox(width: 18,),
                 Container(
                   height: 45,
                   width: 45,
                   decoration: BoxDecoration(
                     color: lezazelColor,
                     borderRadius: BorderRadius.circular(12),
                   ),
                   child: const Icon(Icons.send, color: Colors.white),
                 )
               ],
             ),
           ],
         ),
       );
    }

    return Scaffold(
        backgroundColor: backgroundColor,
      appBar: header(),
      bottomNavigationBar: chatInput(),
    );
  }
}
