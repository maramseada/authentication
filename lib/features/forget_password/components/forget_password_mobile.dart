import 'package:authentication_app/core/components/custom_button.dart';
import 'package:authentication_app/core/constants/app_colors.dart';
import 'package:authentication_app/core/constants/font_styles.dart';
import 'package:authentication_app/core/helpers/extentions.dart';
import 'package:authentication_app/features/log_in/screens/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/components/custom_text_field.dart';
import '../../../core/constants/constants.dart';
import '../../../core/router/router.dart';

import '../components/otp_bottom_dialog.dart';

class ForgetPasswordMobile extends StatelessWidget {
  ForgetPasswordMobile({super.key});
  final _formKey = GlobalKey<FormState>(); // Global key for the form

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      resizeToAvoidBottomInset:
          true, // This adjusts the layout for the keyboard
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
                    const Spacer(),
                    Text(
                      'forget_password'.tr(),
                      style: AppStyles.styleBold30(
                          context: context, color: Colors.white),
                    ),
                    Gap(ratio * 8),
                    Align(
                      alignment:
                          isEn ? Alignment.centerLeft : Alignment.centerRight,
                      child: SizedBox(
                        width: ratio * 300,
                        child: Text(
                          'forget_password_desc'.tr(),
                          style: AppStyles.style40014(
                            context: context,
                            color: Colors.white,
                          ),
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
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
                  Form(
                    key: _formKey,
                    child: CustomTextField(
                      controller: emailController,
                      hint: 'pleaseEnterEmail'.tr(),
                      hintStyle: AppStyles.style40016(
                          context: context, color: AppColors.greyTextColor),
                      borderColor: AppColors.greyTextColor,
                      type: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please_fill_field'.tr();
                        }
                        if (!regex.hasMatch(value)) {
                          return 'enter_valid_email'.tr();
                        }
                        return null;
                      },
                    ),
                  ),
                  Gap(ratio * 18),
                  CustomButton(
                    text: 'send_otp'.tr(),
                    style: isTablet
                        ? AppStyles.styleRegular22(
                            context: context,
                            color: AppColors.whiteTextColor,
                          )
                        : null,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return const OtpBottomDialog();
                          },
                        );
                      } else {
                        debugPrint('Form is invalid.');
                      }
                    },
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
                                context: context, color: AppColors.primaryBlue),
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
