import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;

  Slide({
    @required this.imageUrl,
  });
}

final slideList = [
  Slide(
    imageUrl: 'images/image1.jpg',
  ),
  Slide(
    imageUrl: 'images/image2.jpg',
    ),
  Slide(
    imageUrl: 'images/image3.jpg',
   ),
];
