import 'package:authentication_app/features/sign_up/components/sign_up_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/font_styles.dart';

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
                child: SignUpForm()
              ),
            ),
          ),
        ],
      ),
    );
  }
}



