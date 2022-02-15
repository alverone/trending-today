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
      fontSize: 34,
      fontWeight: FontWeight.w700,
      height: 1.205,
      color: AppColors.heading,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 22,
      height: 1.27,
      color: AppColors.heading,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      height: 1.25,
      color: AppColors.heading,
    ),
    bodyText1: TextStyle(
      fontSize: 13,
      height: 1.39,
      color: AppColors.mainText,
    ),
    bodyText2: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.34,
      color: AppColors.orange,
    ),
  ),
);
