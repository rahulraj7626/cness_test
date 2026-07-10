import 'package:flutter/material.dart';

///Appstyle classess define all textstyles here

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle h1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );
  static const TextStyle bodyXSmall = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );

  static const TextStyle hintText = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  static const TextStyle errorText = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: Colors.red,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
