import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/helpers/responsive_layout.dart';
import '../components/language_screen_mobile.dart';
import '../components/language_screen_tablet.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: ResponsiveLayoutHelper.builder(
          mobile: const LanguageScreenMobile(),
          tablet: const LanguageScreenTablet()),
    );
  }
}
