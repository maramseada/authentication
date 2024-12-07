import 'package:authentication_app/core/constants/font_styles.dart';
import 'package:authentication_app/core/helpers/extentions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = AppColors.primaryBlue,
      this.radius = 50.0,
      this.textColor = Colors.white,
      this.fontWeight = FontWeight.bold,
      this.style,
      this.padding,
      this.borderColor,
      this.overlayColor,
      this.child,
      this.width,
      this.fontSize,
      this.textAlign});
  final String text;
  final double radius;
  final TextAlign? textAlign;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? overlayColor;

  final Color? borderColor;
  final FontWeight fontWeight;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final double? width;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.sizeOf(context).width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          overlayColor: overlayColor,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 12.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(color: borderColor ?? Colors.transparent)),
        ),
        child: child ??
            Text(text,
                textAlign: textAlign,
                style: style ??

                    AppStyles.style50016(
                      context: context,
                      color: textColor ?? AppColors.whiteTextColor,
                    ),


            ),
      ),
    );
  }
}
