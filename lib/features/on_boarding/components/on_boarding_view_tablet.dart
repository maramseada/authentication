import 'package:authentication_app/core/helpers/extentions.dart';
import 'package:authentication_app/features/log_in/screens/login_view.dart';
import 'package:authentication_app/features/on_boarding/components/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/font_styles.dart';
import '../../../core/helpers/hive_helper.dart';
import '../../../core/router/router.dart';
import 'next_indicator.dart';


class OnBoardingViewTablet extends StatefulWidget {
  OnBoardingViewTablet(
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
  State<OnBoardingViewTablet> createState() => _OnBoardingViewTabletState();
}

class _OnBoardingViewTabletState extends State<OnBoardingViewTablet> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: widget.isEn ? TextDirection.ltr : TextDirection.rtl,
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
              Gap(height * 0.15),
              Image.asset(
                widget.onBoardingImagesList[index],
                fit: BoxFit.cover,
                height: 600,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.2, vertical: height * 0.02),
                child: Text(
                  widget.onBoardingLabelList[index],
                  textAlign: TextAlign.center,
                  style: AppStyles.styleBold20(context: context)

                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: width * 0.15),
              //   child: Text(
              //     widget.onBoardingDescriptionList[index],
              //     textAlign: TextAlign.center,
              //       style: AppStyles.styleRegular18(context: context, color: AppColors.greyTextColor)
              //
              //   ),
              // ),
            ],
          ),
        ),
        const SkipButton(),
        Positioned(
          bottom: height * 0.02,
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
                child: NextIndicator(
                  currentIndex: widget.currentIndex,
                  onBoardingImagesList: widget.onBoardingImagesList,
                  width: ratio * 88,
                  height: ratio * 88,
                  widthCircular: ratio * 105,
                  heightCircular: ratio * 105,
                  strokeWidth: 3,     )),
          ),
        ),

      ],
    );
  }
}
