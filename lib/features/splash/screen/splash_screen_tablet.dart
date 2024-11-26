import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/constants.dart';

class SplashScreenTablet extends StatelessWidget {
  const SplashScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: SvgPicture.asset(
            'assets/images/splash_screen_top_shadow.svg',
            width: ratio * 800,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SvgPicture.asset(
            'assets/images/splash_screen_bottom_shadow.svg',
            width: ratio * 500,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: SvgPicture.asset(
              AppImages.logo,
              color: Colors.white,
              width: ratio * 550,
            ),
          ),
        ),
      ],
    );
  }
}
