import 'package:authentication_app/core/constants/font_styles.dart';
import 'package:authentication_app/core/helpers/extentions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class NextIndicator extends StatelessWidget {
  final int currentIndex;
  final List onBoardingImagesList;

  final double width;
  final double height;
  final double widthCircular;
  final double heightCircular;
  final double strokeWidth;
  const NextIndicator(
      {super.key,
      required this.currentIndex,
      required this.onBoardingImagesList,
      required this.width,
      required this.height,
      required this.widthCircular,
      required this.heightCircular,
      required this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: currentIndex == onBoardingImagesList.length - 1 ? null : width,
      height: currentIndex == onBoardingImagesList.length - 1 ? null : height,
      padding: currentIndex == onBoardingImagesList.length - 1
          ? const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
          : null,
      decoration: BoxDecoration(
        shape: currentIndex == onBoardingImagesList.length - 1
            ? BoxShape.rectangle
            : BoxShape.circle,
        color: AppColors.primaryBlue,
        borderRadius: currentIndex == onBoardingImagesList.length - 1
            ? BorderRadius.circular(10)
            : null,
      ),
      child: currentIndex == onBoardingImagesList.length - 1
          ? Text(
              'get_started'.tr(),
              style:
                  AppStyles.style50014(context: context, color: Colors.white),
            )
          :  Icon(
             isEn? Icons.arrow_forward_ios: Icons.arrow_back_ios_sharp,
              color: Colors.white,
        size: isTablet?32:24,
            ),
    );
  }
}
