import 'dart:async';

import 'package:authentication_app/features/on_boarding/screens/on_boarding_view.dart';
import 'package:authentication_app/features/splash/screen/splash_screen_mobile.dart';
import 'package:authentication_app/features/splash/screen/splash_screen_tablet.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/helpers/responsive_layout.dart';
import '../../../core/router/router.dart';
import '../../log_in/screens/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      Timer(const Duration(seconds: 5),
              () => GlobalRouter.navigateToFadeAnimation( const OnBoardingView()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: ResponsiveLayoutHelper.builder(
          mobile: const SplashScreenMobile(),
          tablet: const SplashScreenTablet()),
    );
  }
}
