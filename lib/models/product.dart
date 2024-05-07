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
      title: 'Breast', image: 'chicken-breast.png', price: '20.000'),
  const ProductModel(title: 'Leg', image: 'chicken-leg.png', price: '30.000'),
  const ProductModel(
      title: 'Wings', image: 'chicken-wings.png', price: '10.000'),
  const ProductModel(
      title: 'Top Leg', image: 'chicken-legtop.png', price: '50.000'),
  const ProductModel(title: 'Legs', image: 'leg.png', price: '6354634'),
  const ProductModel(
      title: 'Bucket', image: 'chicken-bucket.png', price: '3456345'),
];
