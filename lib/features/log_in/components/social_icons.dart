import 'package:authentication_app/core/helpers/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
class SocialIcons extends StatelessWidget {
 final String assetPath;
 const SocialIcons({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return  Material(
      elevation: 2, // Adjust elevation for shadow intensity
      shape: const CircleBorder(),
      shadowColor: Colors.black54, // Customize shadow color
      child: Container(
        padding:  EdgeInsets.all(isTablet?16: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white, // Add background color for better contrast
          border: Border.all(color: AppColors.whiteTextColor),
        ),
        child: Image.asset(
          assetPath,
          width: 30,
        ),
      ),
    );
  }
}

