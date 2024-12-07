import 'package:authentication_app/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/font_styles.dart';

class LineText extends StatelessWidget {
  final String text;
  final num padding;
  const LineText({super.key, required this.text, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: isTablet? .8:.5, // Adjust for desired thickness
            color: AppColors.greyTextColor,
          ),
        ),
        Padding(
          padding:
               EdgeInsets.symmetric(horizontal: padding.toDouble()), // Adjust spacing
          child: Text(
            text,
            style:isTablet? AppStyles.styleRegular20(context: context,        color: AppColors.greyColor,): AppStyles.styleRegular14(
              context: context,
              color: AppColors.greyColor,
            ),
          ),
        ),
         Expanded(
          child: Divider(
            thickness: isTablet? .8:.5, // Adjust for desired thickness
            color: AppColors.greyTextColor,
          ),
        ),
      ],
    );
  }
}
