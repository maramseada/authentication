import 'package:authentication_app/core/components/line_text.dart';
import 'package:authentication_app/core/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/font_styles.dart';
import '../components/log_in_form.dart';
import '../components/sign_up_row.dart';
import '../components/social_icons.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  SizedBox(
                    width: 300,
                    child: Text(
                      'sign_in'.tr(),
                      style: AppStyles.styleBold36(
                          context: context, color: Colors.white),
                    ),
                  ),
                  Gap(8 * ratio),
                  Text(
                    'sign_in'.tr(),
                    style: AppStyles.style40014(
                        context: context, color: AppColors.whiteTextColor),
                  ),
                  Gap(24 * ratio),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16 * ratio),
              decoration: const BoxDecoration(
                  color: Colors.white,  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(50 * ratio),
                    LogInForm(),
                    Gap(ratio * 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: LineText(text: 'login_with'.tr(), padding: 5),
                    ),
                    Gap(ratio * 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SocialIcons(
                            assetPath: 'assets/images/apple_icon.png'),
                        Gap(ratio * 16),
                        const SocialIcons(
                          assetPath: 'assets/images/google_icon.png',
                        ),
                        Gap(ratio * 16),
                        const SocialIcons(
                          assetPath: 'assets/images/facebook.png',
                        ),
                      ],
                    ),
                    Gap(50 * ratio),
                    const SignUpRow(),
                    Gap(32 * ratio)
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
