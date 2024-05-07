import 'package:flutter/material.dart';

class Category {
  static String paha = "Paha ";
  static String sayap = "Sayap";
  static String dada = "Dada";
  static String ceker = "Ceker";
  static String pala = "Pala";
  static String bulu = "Bulu";

  static List<String> all() {
    return [paha, sayap, dada, ceker, pala, bulu];
  }
}




Container bottomNavigationBar() {
  return Container(
    height: 100,
    decoration: BoxDecoration(
      boxShadow: [BoxShadow(
        color: Colors.black.withOpacity(.03),
        blurRadius: 30,
        offset: Offset(0, -10),
      )],
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

      ],
    ),
  );
}