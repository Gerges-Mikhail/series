import 'package:flutter/material.dart';
import 'package:got/constants/constants.dart';
AppColors appColors = AppColors();
Widget buildAppBarrTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      color: appColors.tealColor,
    ),
  );
}
