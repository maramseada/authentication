import 'package:flutter/material.dart';

import '../../../core/helpers/responsive_layout.dart';
import '../components/login_view_mobile.dart';
import '../components/login_view_tablet.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutHelper.builder(
            mobile: const LoginViewMobile(), tablet: const LoginViewTablet());
  }
}
