import 'package:flutter/material.dart';
import 'package:got/constants/constants.dart';
AppColors appColors = AppColors();
Widget showLoadingIndicator() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: CircularProgressIndicator(
            color: Colors.teal,
          ),
        ),
        Text('Loading...', style: TextStyle(
          fontSize: 25,
          color: appColors.tealColor,
        ),)
      ],
    ),
  );
}