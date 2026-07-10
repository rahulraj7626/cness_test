import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  ///AppColors Singleton class define constant Colors  here
  ///Colors and gradients added

  static const Color transparent = Colors.transparent;

  ///White Shades
  static const Color white = Color(0xFFFFFFFF);
  static const Color greyLight = Color(0xFFF5F6F9);
  static const Color greyBorder = Color(0xFFEFF0F6);

  ///Red Shades

  static const Color red = Colors.red;

  ///Blue shades
  static const Color blueDark = Color(0xFF353188);
  static const Color bluePrimary = Color(0xFF4D81E7);
  static const Color blueSecondary = Color(0xFF575FFF);
  static const Color blueTertiary = Color(0xFF4330CE);

  ///Black Shades
  static const Color blackPrimary = Color(0xFF1A1C1E);
  static const Color blackText = Color(0xFF2D3F7B);
  static const Color blackSecondary = Color(0xFF6C7278);
  static const Color blackTertiary = Color(0xFF929AB3);

  ///Gradients
  static const LinearGradient gradientButton = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Color(0xFF375DFB), Color(0xFF575FFF)],
  );

  static const LinearGradient bgGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF0e0f58), Color(0xFF2f20b6)],
  );
}
