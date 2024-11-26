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
        const Expanded(
          child: Divider(
            thickness: .5, // Adjust for desired thickness
            color: AppColors.greyTextColor,
          ),
        ),
        Padding(
          padding:
               EdgeInsets.symmetric(horizontal: padding.toDouble()), // Adjust spacing
          child: Text(
            text,
            style: AppStyles.styleRegular14(
              context: context,
              color: AppColors.greyColor,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: .5,
            color: AppColors.greyTextColor,
          ),
        ),
      ],
    );
  }
}
