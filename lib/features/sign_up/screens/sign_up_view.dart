import 'package:flutter/material.dart';
import '../../../core/helpers/responsive_layout.dart';
import '../components/sign_up_view_mobile.dart';
import '../components/sign_up_view_tablet.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutHelper.builder(
        mobile: const SignUpViewMobile(), tablet: const SignUpViewTablet());
  }
}
