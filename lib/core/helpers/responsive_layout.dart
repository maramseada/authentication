
import 'package:flutter/cupertino.dart';

import '../router/router.dart';

class ResponsiveLayoutHelper {
  static double width = MediaQuery.sizeOf(GlobalRouter.currentContext!).width;
  static bool isMobile() => width < 600;

  static bool isTablet() => width >= 600 && width < 1200;

  static Widget builder({
    required Widget mobile,
    required Widget tablet,
  }) {
    if (isMobile()) {
      return mobile;
    } else {
      return tablet;
    }
  }
}
