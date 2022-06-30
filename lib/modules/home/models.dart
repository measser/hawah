import 'package:flutter/material.dart';

class Model {
  final String image;
  final String title;
  final String info;
  final String description;

  Model(
      {
        required this.image,
        required this.title,
        required this.description,
        required this.info,
      });
}