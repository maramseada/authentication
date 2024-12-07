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
import '../../../core/helpers/responsive_layout.dart';
import '../../../core/router/router.dart';
import '../components/forget_password_mobile.dart';
import '../components/forget_password_tablet.dart';
import '../components/otp_bottom_dialog.dart';
class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutHelper.builder(mobile: ForgetPasswordMobile(), tablet: ForgetPasswordTablet());
  }
}



