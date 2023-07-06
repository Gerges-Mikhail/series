import 'package:flutter/material.dart';
import 'package:got/constants/constants.dart';
AppColors appColors = AppColors();
Widget ErrorConnectionWidget(){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.signal_wifi_statusbar_connected_no_internet_4_sharp,
          size: 60,
          color: appColors.tealColor,
        ),
        Text("Please Check Your Internet Connection",style: TextStyle(color: appColors.blackColor),)
      ],
    ),
  );
}