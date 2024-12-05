import 'package:authentication_app/core/router/router.dart';
import 'package:authentication_app/features/log_in/screens/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/components/custom_button.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/font_styles.dart';
import '../../forget_password/screens/forget_password.dart';

class LogInForm extends StatelessWidget {
  LogInForm({super.key});
  final _formKey = GlobalKey<FormState>(); // Global key for the form
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
Text(
            'email'.tr(),
            style: AppStyles.styleRegular14(
                context: context, color: AppColors.darkBlue),
          ),          Gap(ratio * 8),

          CustomTextField(
            controller: emailController,
            hint: 'pleaseEnterEmail'.tr(),
            hintStyle: AppStyles.styleRegular14(
                context: context, color: AppColors.greyTextColor),
            type: TextInputType.emailAddress,
            borderColor: AppColors.greyTextColor,
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
          Gap(ratio * 16),
          Text(
            'password'.tr(),
            style: AppStyles.styleRegular14(
                context: context, color: AppColors.darkBlue),
          ),
          Gap(ratio * 5),
          CustomTextField(
            hint: '********',
            controller: passwordController,
            hintStyle: AppStyles.styleRegular18(
                context: context, color: AppColors.greyTextColor),
            borderColor: AppColors.greyTextColor,
            type: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please_fill_field'.tr();
              }
              if (value.length < 6) {
                return 'password_validation'.tr();
              }
              return null;
            },
          ),
          Gap(ratio * 8),
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: InkWell(
                onTap: () {
                  GlobalRouter.navigateTo(ForgetPassword());
                },
                child: Text(
                  'forget_password'.tr(),
                  style: AppStyles.styleRegular14(
                      decoration: TextDecoration.underline,
                      context: context,
                      color: AppColors.lightPurple),
                ),
              )),
          Gap(ratio * 16),
          CustomButton(
            backgroundColor: AppColors.lightPurple,
            text: 'login'.tr(),
            radius: 6,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('kuh');
              } else {
                print('Form is invalid.');
              }
            },
          ),


        ],
      ),
    );
  }
}