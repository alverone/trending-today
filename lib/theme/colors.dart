import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color heading = Colors.white;
  static const Color headingGradientRed = Color(0xFFD93636);

  static const Color purple = Color(0xFFA824EA);
  static const Color purpleShadow = Color(0xFF280838);
  static const Color orange = Color(0xFFF2BC3D);
  static const Color orangeShadow = Color(0xFF392904);
  static const Color red = Color(0xFFC30912);
  static const Color redShadow = Color(0xFF380305);

  static Color playlistProgressBarShadow =
      const Color(0xFF866009).withOpacity(0.6);
  static const Color navigationShadow = Color(0xFF866009);

  static const Color mainText = Color(0xFFA19DAA);
  static const Color subtext = Color(0xFF645F6D);
  static const Color subtextCount = Color(0xFF8C8797);

  static const Color idleTabColor = Color(0xFF504C57);
}
