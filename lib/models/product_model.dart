import 'package:flutter/material.dart';

class ProductModel {
  final String image;
  final String title;
  final String price;

  const ProductModel({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
  });
}

var products = [
  const ProductModel(
      title: 'Lunak Bakar', image: 'ayamBakar.jpeg', price: '20.000'),
  const ProductModel(
      title: 'Lunak Penyet', image: 'ayamGoreng.jpeg', price: '30.000'),
  const ProductModel(
      title: 'Lunak Goreng', image: 'ayamPenyet.jpeg', price: '10.000'),
  const ProductModel(
      title: 'Lunak Rica-Rica', image: 'ayamRica.jpeg', price: '50.000'),
  const ProductModel(
      title: 'Lunak Original', image: 'lezazelOriginal.jpeg', price: '55.000'),
];
