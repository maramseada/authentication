import 'package:authentication_app/core/router/router.dart';
import 'package:authentication_app/features/log_in/screens/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/components/custom_button.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/line_text.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/font_styles.dart';
import '../../log_in/components/social_icons.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: ratio * 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'create_account'.tr(),
                    style: AppStyles.styleBold36(
                        context: context, color: Colors.white),
                  ),
                  Gap(8 * ratio),
                  Text(
                    'sign_up_account'.tr(),
                    style: AppStyles.style40014(
                        context: context, color: AppColors.whiteTextColor),
                  ),
                  Gap(24 * ratio),

                ],
              ),
            ),
          ),
          Expanded(
            // Wrap in Expanded for flexibility
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16 * ratio),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(50 * ratio),
                    Text(
                      'full_name'.tr(),
                      style: AppStyles.styleRegular14(
                          context: context, color: AppColors.darkBlue),
                    ),
                    Gap(ratio * 5),
                    CustomTextField(
                      hint: 'enter_full_name'.tr(),
                      hintStyle: AppStyles.styleRegular14(
                          context: context, color: AppColors.greyTextColor),
                      borderColor: AppColors.greyTextColor,
                    ),
                    Gap(ratio * 16),
                    Text(
                      'email'.tr(),
                      style: AppStyles.styleRegular14(
                          context: context, color: AppColors.darkBlue),
                    ),
                    Gap(ratio * 5),
                    CustomTextField(
                      hint: 'pleaseEnterEmail'.tr(),
                      hintStyle: AppStyles.styleRegular14(
                          context: context, color: AppColors.greyTextColor),
                      type: TextInputType.emailAddress,
                      borderColor: AppColors.greyTextColor,
                    ),
                    Gap(ratio * 16),
                    Text(
                      'password'.tr(),
                      style: AppStyles.styleRegular14(
                          context: context, color: AppColors.darkBlue),
                    ),
                    Gap(ratio * 5),
                    CustomTextField(
                      hint: '********',
                      hintStyle: AppStyles.styleRegular18(
                          context: context, color: AppColors.greyTextColor),
                      borderColor: AppColors.greyTextColor,
                      type: TextInputType.visiblePassword,
                    ),
                    Gap(ratio * 16),
                    Text(
                      'reenter_password'.tr(),
                      style: AppStyles.styleRegular14(
                          context: context, color: AppColors.darkBlue),
                    ),
                    Gap(ratio * 5),
                    CustomTextField(
                      hint: '********',
                      hintStyle: AppStyles.styleRegular18(
                          context: context, color: AppColors.greyTextColor),
                      borderColor: AppColors.greyTextColor,
                      type: TextInputType.visiblePassword,
                    ),
                    Gap(ratio * 22),
                    CustomButton(
                      backgroundColor: AppColors.lightPurple,
                      text: 'signup'.tr(),
                      radius: 6,
                      onPressed: () {},
                    ),
                    Gap(ratio * 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'have_account'.tr(),
                          style: AppStyles.styleRegular14(context: context),
                        ),
                        Gap(10 * ratio),
                        InkWell(
                          onTap: () {
                            GlobalRouter.navigateTo(LoginView());
                          },
                          child: Text(
                            'login'.tr(),
                            style: AppStyles.styleBold14(
                                context: context, color: AppColors.lightPurple),
                          ),
                        ),
                      ],
                    ),
                    Gap(32 * ratio)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
