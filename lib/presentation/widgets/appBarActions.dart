import 'package:flutter/material.dart';
import 'package:got/constants/constants.dart';
AppColors appColors = AppColors();

List<Widget> buildAppBarrActions(bool _isClickedSearch , Function _clearSearch , Function _startsearch , pop ) {
  if (_isClickedSearch) {
    return [
      IconButton(
          onPressed: () {
            _clearSearch();
            // Navigator.pop(context);
            pop();
          },
          icon: Icon(
            Icons.clear,
            color: appColors.tealColor,
          )),
    ];
  } else {
    return [
      IconButton(
          onPressed: (){_startsearch();},
          icon: Icon(
            Icons.search,
            color: appColors.tealColor,
          ))
    ];
  }
}

List<Widget> buildAppBarrActionsRAM(bool _isClickedSearch , Function _clearSearch , Function _startsearch , pop ) {
  if (_isClickedSearch) {
    return [
      IconButton(
          onPressed: () {
            _clearSearch();
            pop();
          },
          icon: Icon(
            Icons.clear,
            color: appColors.darkColor,
          )),
    ];
  } else {
    return [
      IconButton(
          onPressed: (){_startsearch();},
          icon: Icon(
            Icons.search,
            color: appColors.darkColor,
          ))
    ];
  }
}