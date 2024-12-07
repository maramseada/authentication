import 'package:authentication_app/core/constants/constants.dart';
import 'package:authentication_app/core/constants/font_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/components/custom_button.dart';
import '../../core/constants/app_colors.dart';

class OtpBottomDialog extends StatelessWidget {
  const OtpBottomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(   decoration:const BoxDecoration(
      color: Colors.white,  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: ratio * 16),
          Center(
              child: Image.asset(
            'assets/images/confidential-email_11840424.png',
            height: 70 * ratio,
          )),
          SizedBox(height: ratio * 16),
          Text('check_mail'.tr(),
              style: AppStyles.style70018(context: context)),
          SizedBox(height: ratio * 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('check_mail_desc'.tr(),
                textAlign: TextAlign.center,
                style: AppStyles.styleRegular14(
                    context: context, color: AppColors.greyTextColor)),
          ),
          const SizedBox(height: 24),
          CustomButton(
              radius: 10,
              text: 'close'.tr(),
              style: AppStyles.styleRegular14(
                  context: context, color: Colors.white),
              onPressed: () => Navigator.pop(context)),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
