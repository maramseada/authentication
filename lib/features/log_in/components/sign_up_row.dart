import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/font_styles.dart';
import '../../../core/router/router.dart';
import '../../sign_up/screens/sign_up_view.dart';

class SignUpRow extends StatelessWidget {
  const SignUpRow({super.key});

  @override
  Widget build(BuildContext context) {
    return              Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'dont_have_account'.tr(),
          style: AppStyles.styleRegular14(context: context),
        ),
        Gap(10 * ratio),
        InkWell(
          onTap: () {
            GlobalRouter.navigateTo( SignUpView());
          },
          child: Text(
            'signup'.tr(),
            style: AppStyles.styleBold14(
                context: context,
                color: AppColors.primaryBlue),
          ),
        ),
      ],
    );
  }
}
