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
      title: 'Lunak Bakar', image: 'chicken-breast.png', price: '20.000'),
  const ProductModel(title: 'Lunak Penyet', image: 'chicken-leg.png', price: '30.000'),
  const ProductModel(
      title: 'Lunak Goreng', image: 'chicken-wings.png', price: '10.000'),
  const ProductModel(
      title: 'Lunak Rica-Rica', image: 'chicken-legtop.png', price: '50.000'),
  const ProductModel(
      title: 'Lunak Original', image: 'chicken-bucket.png', price: '3456345'),
];
