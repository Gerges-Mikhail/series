import 'package:flutter/material.dart';
import 'package:got/presentation/widgets/appBarActions.dart';

Widget showLoadingIndicator() => Center(
      child: CircularProgressIndicator(
        color: appColors.thirdColor,
      ),
    );
