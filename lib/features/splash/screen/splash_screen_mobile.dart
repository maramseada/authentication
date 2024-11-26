import 'package:authentication_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_images.dart';

class SplashScreenMobile extends StatelessWidget {
  const SplashScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Positioned(
          bottom: 300,
          right: 50,
          child: Image.asset(
            'assets/images/light.png',
            height: 100,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: SvgPicture.asset(
              AppImages.logo,
              color: AppColors.whiteBackGround,
            ),
          ),
        ),
      ],
    );
  }
}
