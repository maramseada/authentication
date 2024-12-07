import 'package:authentication_app/core/helpers/extentions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/components/custom_button.dart';
import '../../../core/components/snack_bar.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/font_styles.dart';
import '../../../core/router/router.dart';
import '../../on_boarding/screens/on_boarding_view.dart';

class LanguageScreenTablet extends StatefulWidget {
  const LanguageScreenTablet({super.key});

  @override
  State<LanguageScreenTablet> createState() => _LanguageScreenTabletState();
}

class _LanguageScreenTabletState extends State<LanguageScreenTablet> {
  bool? lang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      resizeToAvoidBottomInset:
          true, // This adjusts the layout for the keyboard
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ratio * 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'choose_language'.tr(),
                    style: AppStyles.styleBold52(
                        context: context, color: Colors.white),
                  ),
                  Gap(8 * ratio),
                  Text(
                    'choose_language_desc'.tr(),
                    style: AppStyles.styleRegular22(
                        context: context, color: AppColors.whiteTextColor),
                  ),
                  Gap(40 * ratio),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16 * ratio),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(180 * ratio),
                    SvgPicture.asset(
                      'assets/images/globe-icon.svg',
                      color: AppColors.primaryBlue,
                      width: 150,
                    ),
                    Gap(60 * ratio),
                    // Arabic Language Option
                    InkWell(
                      onTap: () {
                        setState(() {
                          lang = true;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: 300,
                        decoration: BoxDecoration(
                          color: lang == true
                              ? AppColors.primaryBlue.withOpacity(0.3)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: lang == true
                                ? AppColors.primaryBlue
                                : Colors.grey.shade300,
                            width: lang == true ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Gap(10 * ratio),
                            Image.asset(
                              'assets/images/saudi-arabia-flag-icon.png',
                              width: 30,
                            ),
                            Gap(20 * ratio),
                            Text(
                              'مرحباً',
                              style: AppStyles.style60016(
                                context: context,
                                color: AppColors.darkBlue,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Gap(20 * ratio),

                    // English Language Option
                    InkWell(
                      onTap: () {
                        setState(() {
                          lang = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: 300,
                        decoration: BoxDecoration(
                          color: lang == false
                              ? AppColors.primaryBlue.withOpacity(0.3)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: lang == false
                                ? AppColors.primaryBlue
                                : Colors.grey.shade300,
                            width: lang == false ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Gap(10 * ratio),
                            Image.asset(
                              'assets/images/united-kingdom-flag-icon.png',
                              width: 30,
                            ),
                            Gap(20 * ratio),
                            Text(
                              'Hello',
                              style: AppStyles.style60016(
                                context: context,
                                color: AppColors.darkBlue,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Gap(40 * ratio),

                    // Next Button
                    CustomButton(
                      text: 'next'.tr(),
                      style: widget.isTablet
                          ? AppStyles.styleRegular22(
                        context: context,
                        color: AppColors.whiteTextColor,
                      )
                          : null,   width: 380,
                      radius: 10,
                      padding: EdgeInsets.symmetric(vertical: 12 * ratio),
                      onPressed: () async {
                        if (lang == true) {
                          if (widget.isEn) {
                            await context.setLocale(const Locale('ar', 'EG'));
                          }
                        } else if (lang == false) {
                          if (!widget.isEn) {
                            await context.setLocale(const Locale('en', 'US'));
                          }
                        } else {
                          showUpSnackBar(
                            context,
                            color: AppColors.primaryBlue,
                            message: 'Please select a language',
                            textStyle: AppStyles.styleRegular18(
                              context: context,
                              color: Colors.white,
                            ),
                            marginHorizontal: ratio * 10,
                          );

                          return;
                        }
                        setState(() {
                          GlobalRouter.navigateTo(const OnBoardingView());
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
