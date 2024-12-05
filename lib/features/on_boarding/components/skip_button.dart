import 'package:authentication_app/core/helpers/extentions.dart';
import 'package:authentication_app/features/log_in/screens/login_view.dart';
import 'package:easy_localization/easy_localization.dart' as local;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/hive_helper.dart';
import '../../../core/router/router.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.directional(
      end: isTablet ? 12.w : 6,
      top: isTablet ? 12.h : null,
      textDirection: isEn ? TextDirection.ltr : TextDirection.rtl,
      child: TextButton(
          onPressed: () async {
            GlobalRouter.navigateAndPopAll(const LoginView());
            await HiveHelper.checkOnBoardingComplete();
          },
          style: TextButton.styleFrom(foregroundColor: Colors.black),
          child: Text(
            'skip'.tr(),
            style: isTablet ? TextStyle(fontSize: 10.sp) : null,
          )),
    );
  }
}
