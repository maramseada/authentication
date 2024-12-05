import 'package:authentication_app/core/constants/app_colors.dart';
import 'package:authentication_app/core/constants/font_styles.dart';
import 'package:authentication_app/core/helpers/extentions.dart';
import 'package:authentication_app/features/log_in/screens/login_view.dart';
import 'package:authentication_app/features/on_boarding/components/skip_button.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/constants.dart';
import '../../../core/helpers/hive_helper.dart';
import '../../../core/router/router.dart';
import 'next_indicator.dart';


class OnBoardingViewMobile extends StatefulWidget {
  OnBoardingViewMobile(
      {super.key,
      this.controller,
      required this.onBoardingImagesList,
      required this.currentIndex,
      required this.onBoardingLabelList,
   });
  final PageController? controller;
  final List<String> onBoardingImagesList;
  final List<String> onBoardingLabelList;
  int currentIndex;
  @override
  State<OnBoardingViewMobile> createState() => _OnBoardingViewMobileState();
}

class _OnBoardingViewMobileState extends State<OnBoardingViewMobile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: widget.isEn ? TextDirection.rtl : TextDirection.ltr,
      children: [
        PageView.builder(
          controller: widget.controller,
          itemCount: widget.onBoardingImagesList.length,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) => setState(() => widget.currentIndex = value),
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Gap(ratio * 100),
              Image.asset(widget.onBoardingImagesList[index], height: height* .43,),
              Gap(ratio * 20),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.15, vertical: height * 0.02),
                child: Text(
                  widget.onBoardingLabelList[index],
                  textAlign: TextAlign.center,
                  style: AppStyles.style40016(context: context, color: AppColors.greyTextColor)
                ),
              ),
              Gap(32* ratio ),
              SmoothPageIndicator(
                controller:  widget.controller!,
                count:  3,
                axisDirection: Axis.horizontal,
                effect:  const JumpingDotEffect(
                    dotWidth:  12.0,
                    dotHeight:  12.0,
                    paintStyle:  PaintingStyle.stroke,
                    strokeWidth:  1.5,
                    activeDotColor:  AppColors.primaryBlue
                ),
              )
            ],
          ),
        ),
        const SkipButton(),
        Positioned(
          bottom: height * 0.02,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
                onTap: () async {
                  if (widget.currentIndex ==
                      widget.onBoardingImagesList.length - 1) {
                    GlobalRouter.navigateAndPopAll(const LoginView());
                    await HiveHelper.checkOnBoardingComplete();
                  } else {
                    setState(() {
                      widget.currentIndex++;
                      widget.controller!.animateToPage(
                        widget.currentIndex,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.decelerate,
                      );
                    });
                  }
                },
                child: Center(
                  child: NextIndicator(
                    currentIndex: widget.currentIndex,
                    onBoardingImagesList: widget.onBoardingImagesList,
                    width: ratio * 44,
                    height: ratio * 44,
                    widthCircular: ratio * 52,
                    heightCircular: ratio * 52,
                    strokeWidth: 1.5,
                  ),
                )),
          ),
        ),

      ],
    );
  }
}
