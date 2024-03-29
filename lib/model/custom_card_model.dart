import 'package:flutter/material.dart';

class CustomCardModel {
  final Color firstColor;
  final Color secondColor;
  final Text text;

  final String firstPathImage;
  final String secondPathImage;

  CustomCardModel({required this.firstColor,
    required this.secondColor,
    required this.text,
    required this.firstPathImage,
    required this.secondPathImage});
}
