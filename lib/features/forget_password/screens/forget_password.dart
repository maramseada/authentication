import 'package:authentication_app/core/components/custom_button.dart';
import 'package:authentication_app/core/constants/app_colors.dart';
import 'package:authentication_app/core/constants/font_styles.dart';
import 'package:authentication_app/features/log_in/screens/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/components/custom_text_field.dart';
import '../../../core/constants/constants.dart';
import '../../../core/router/router.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      resizeToAvoidBottomInset: true, // This adjusts the layout for the keyboard
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ratio * 12.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),    Text(
                      'forget_password'.tr(),
                      style: AppStyles.styleBold30(
                          context: context, color: Colors.white),
                    ),
                    Gap(ratio * 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: ratio * 300,
                        child: Text(
                          'forget_password_desc'.tr(),
                          style: AppStyles.style40014(
                              context: context, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16 * ratio),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(70 * ratio),
                  Center(
                      child: Image.asset(
                    'assets/images/confidential-email_11840424.png',
                    height: 100 * ratio,
                  )),
                  Gap(ratio * 32),
                  Text(
                    'email'.tr(),
                    style: AppStyles.styleRegular14(
                        context: context, color: AppColors.darkBlue),
                  ),
                  Gap(ratio * 8),
                  CustomTextField(
                    hint: 'pleaseEnterEmail'.tr(),
                    hintStyle: AppStyles.style40016(
                        context: context, color: AppColors.greyTextColor),
                    type: TextInputType.emailAddress,
                    borderColor: AppColors.greyTextColor,
                  ),
                  Gap(ratio * 18),
                  CustomButton(
                    text: 'send_otp'.tr(),
                    onPressed: () {},
                    radius: 10,
                  ),
                  const Spacer(),
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'remember_password'.tr(),
                          style: AppStyles.styleRegular14(context: context),
                        ),
                        Gap(10 * ratio),
                        InkWell(
                          onTap: () {
                            GlobalRouter.navigateAndPopAll(const LoginView());
                          },
                          child: Text(
                            'login'.tr(),
                            style: AppStyles.styleBold14(
                                context: context, color: AppColors.lightPurple),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
