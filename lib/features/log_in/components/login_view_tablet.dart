import 'package:authentication_app/core/components/line_text.dart';
import 'package:authentication_app/core/constants/app_colors.dart';
import 'package:authentication_app/core/helpers/extentions.dart';
import 'package:authentication_app/features/log_in/components/sign_up_row.dart';
import 'package:authentication_app/features/log_in/components/social_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/font_styles.dart';
import 'log_in_form.dart';

class LoginViewTablet extends StatelessWidget {
  const LoginViewTablet({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: ratio * 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'sign_in'.tr(),
                    style: AppStyles.styleBold52(
                        context: context, color: Colors.white),
                  ),
                  Gap(8 * ratio),
                  Text(
                    'sign_in'.tr(),
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
              padding: EdgeInsets.symmetric(horizontal: 32 * ratio),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(120 * ratio),
                  LogInForm(),
                  Gap(ratio * 40),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: isTablet ? 18 : 8.0),
                    child: LineText(
                        text: 'login_with'.tr(), padding: isTablet ? 18 : 5),
                  ),
                  Gap(ratio * 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SocialIcons(
                          assetPath: 'assets/images/apple_icon.png'),
                      Gap(ratio * 32),
                      const SocialIcons(
                        assetPath: 'assets/images/google_icon.png',
                      ),
                      Gap(ratio * 32),
                      const SocialIcons(
                        assetPath: 'assets/images/facebook.png',
                      ),
                    ],
                  ),
                  const Spacer(),
                  const SignUpRow(),
                  Gap(32 * ratio)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
