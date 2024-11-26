
import 'package:flutter/cupertino.dart';

import '../constants/constants.dart';
import '../router/router.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension DoubleExtension on double {
  double toFahrenheit() => (this * 1.8 + 32).toDouble();
}

extension BaseWidth on Widget {
  double get baseWidth => isTablet ? 1024 : 375;
}

extension TabletHorizontalPadding on Widget {
  double get tabletHorizontalPadding => width * 0.08;
}

extension IsMobile on Widget {
  bool get isMobile => width < 600;
}
extension IsTablet on Widget {
  bool get isTablet => width >= 600 && width < 1200;
}extension IsTabletRotate on Widget {
  bool get isTabletRotate => width >= 1200 && width < 1600;
}
extension StringExtension on String {
  String get capitalize =>
      isNotEmpty ? this[0].toUpperCase() + substring(1) : this;
}

// extension IsEn on Widget {
//   bool get isEn => GlobalRouter.currentContext!.locale.languageCode == 'en';
// }
