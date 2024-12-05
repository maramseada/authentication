
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/responsive_layout.dart';
import '../components/on_boarding_view_mobile.dart';
import '../components/on_boarding_view_tablet.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

late PageController _pageController;

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentIndex = 0;
  final onBoardingImagesList = [
    'assets/images/3243574.jpg',
    'assets/images/onboarding2.jpg',
    'assets/images/onboarding3.jpg'
  ];
  final onBoardingLabelList = ['onboarding1'.tr(), 'onboarding1'.tr(), 'onboarding1'.tr()];
  // final onBoardingDescriptionList = ['description'.tr(), 'features_description'.tr(), 'contact_description'.tr()];
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ResponsiveLayoutHelper.builder(
          mobile: OnBoardingViewMobile(
            currentIndex: currentIndex,
            controller: _pageController,
            onBoardingImagesList: onBoardingImagesList,
            onBoardingLabelList: onBoardingLabelList,
          ),
          tablet: OnBoardingViewTablet(
            currentIndex: currentIndex,
            controller: _pageController,
            onBoardingImagesList: onBoardingImagesList,
            onBoardingLabelList: onBoardingLabelList,
          ),
        ),
      ),
    );
  }
}
