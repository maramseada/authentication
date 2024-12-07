import 'package:authentication_app/core/helpers/extentions.dart';
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

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});
  final _formKey = GlobalKey<FormState>(); // Global key for the form
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reEnterPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isTablet ? Gap(120 * ratio) : Gap(50 * ratio),
          Text(
            'full_name'.tr(),
            style: isTablet
                ? AppStyles.styleRegular18(
                context: context, color: AppColors.darkBlue)
                : AppStyles.styleRegular14(
                context: context, color: AppColors.darkBlue),

          ),
          isTablet ? Gap(ratio * 10) :     Gap(ratio * 5),
          CustomTextField(
            hint: 'enter_full_name'.tr(),
            hintStyle: AppStyles.styleRegular14(
                context: context, color: AppColors.greyTextColor),
            borderColor: AppColors.greyTextColor,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please_fill_field'.tr();
              }
              if (value.length < 3) {
                return 'name_valid'.tr();
              }
              return null;
            },
          ),
          isTablet ? Gap(ratio * 32) : Gap(ratio * 22),
          Text(
            'email'.tr(),
            style: isTablet
                ? AppStyles.styleRegular18(
                context: context, color: AppColors.darkBlue)
                : AppStyles.styleRegular14(
                context: context, color: AppColors.darkBlue),

          ),
          isTablet ? Gap(ratio * 10) :     Gap(ratio * 5),
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
          isTablet ? Gap(ratio * 32) : Gap(ratio * 22),
          Text(
            'password'.tr(),
            style: isTablet
                ? AppStyles.styleRegular18(
                context: context, color: AppColors.darkBlue)
                : AppStyles.styleRegular14(
                context: context, color: AppColors.darkBlue),

          ),
          isTablet ? Gap(ratio * 10) :     Gap(ratio * 5),
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
          isTablet ? Gap(ratio * 32) : Gap(ratio * 22),
          Text(
            'reenter_password'.tr(),
            style: isTablet
                ? AppStyles.styleRegular18(
                context: context, color: AppColors.darkBlue)
                : AppStyles.styleRegular14(
                context: context, color: AppColors.darkBlue),

          ),
          isTablet ? Gap(ratio * 10) :     Gap(ratio * 5),
          CustomTextField(
            hint: '********',
            controller: reEnterPasswordController,
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

              if (value != passwordController.text) {
                return 'passwords_do_not_match'.tr();
              }
              return null;
            },
          ),
          isTablet ? Gap(ratio * 40) : Gap(ratio * 22),
          CustomButton(
            backgroundColor: AppColors.primaryBlue,
            text: 'signup'.tr(),
            style: isTablet
                ? AppStyles.styleRegular22(
              context: context,
              color: AppColors.whiteTextColor,
            )
                : null,   radius: 6,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('kuh');
              } else {
                print('Form is invalid.');
              }
            },
          ),
          isTablet ? const Spacer() : Gap(ratio * 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'have_account'.tr(),
                style:  isTablet? AppStyles.styleRegular20(
    context: context,)
        : AppStyles.styleRegular14(context: context),
              ),
              Gap(10 * ratio),
              InkWell(
                onTap: () {
                  GlobalRouter.navigateTo(const LoginView());
                },
                child: Text(
                  'login'.tr(),
                  style: isTablet
                      ? AppStyles.styleBold20(
                      context: context, color: AppColors.primaryBlue)
                      : AppStyles.styleBold14(
                      context: context, color: AppColors.primaryBlue),

                ),
              ),
            ],
          ),
          Gap(32 * ratio)
        ],
      ),
    );
  }
}
