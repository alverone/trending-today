import 'package:flutter/material.dart';

import './colors.dart';

final ThemeData theme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
  fontFamily: 'Aktiv Grotesk',
  splashFactory: InkRipple.splashFactory,
  highlightColor: AppColors.orange.withOpacity(0.1),
  splashColor: AppColors.orange.withOpacity(0.1),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 34.0,
      fontWeight: FontWeight.w700,
      height: 41 / 34,
      color: AppColors.heading,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 22.0,
      height: 28 / 22,
      color: AppColors.heading,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20.0,
      height: 25 / 20,
      color: AppColors.heading,
    ),
    bodyText1: TextStyle(
      fontSize: 13.0,
      height: 18 / 13,
      color: AppColors.mainText,
    ),
    bodyText2: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      height: 16 / 12,
      color: AppColors.orange,
    ),
  ),
);
