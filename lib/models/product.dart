import 'package:flutter/material.dart';

class ProductModel  {
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
  ProductModel(
      title: 'Breast',
      image: 'chicken-breast.png',
      price: '20.000'),

ProductModel(
      title: 'Leg',
      image: 'chicken-leg.png',
      price: '30.000'),

ProductModel(
      title: 'Wings',
      image: 'chicken-wings.png',
      price: '10.000'),

ProductModel(
      title: 'Bucket',
      image: 'chicken-bucket.png',
      price: '50.000'),

  ProductModel(
      title: 'Dr. Haidar',
      image: 'chicken-bucket.png',
      price: '6354634'),

  ProductModel(
      title: 'Dr. Haidar',
      image: 'chicken-bucket.png',
      price: '3456345'),

  ProductModel(
      title: 'Dr. Haidar',
      image: 'chicken-bucket.png',
      price: '356354'),


];
