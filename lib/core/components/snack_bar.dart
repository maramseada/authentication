import 'package:flutter/material.dart';

void showUpSnackBar(BuildContext context,
    {Color? color,
      required String message,
      required TextStyle textStyle,
      required double marginHorizontal}) {
  final snackBar = SnackBar(
    backgroundColor: color,
    content: Text(
      message,
      style: textStyle,
      textAlign: TextAlign.left,
    ),
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height - 150,
      left: marginHorizontal,
      right: marginHorizontal,
    ),
    duration: const Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}