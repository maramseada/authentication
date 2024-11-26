import 'package:authentication_app/features/splash/screen/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/constants.dart';
import 'core/router/router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    path: 'assets/translation',
    supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
    fallbackLocale: const Locale('en', 'US'),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;

    ratio = width /
        (width < 600
            ? 375
            : width >= 600 && width < 1200
                ? 1024 // Suitable for older iPads and medium-sized tablets
                : width >= 1200 && width < 1600
                    ? 1300 // Suitable for newer iPads (like iPad Air or smaller iPad Pros)
                    : 1300 // Suitable for larger iPads (like iPad Pro 12.9") and large tablets
        );

    textSize = ratio * 0.91;
    return ScreenUtilInit(
      // designSize: const Size(360, 690),
      designSize: MediaQuery.of(context).size.width > 600
          ? const Size(600, 1024) // Design size for tablets
          : const Size(360, 690), // Design size for mobile
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Elmadrasah',
          home: child,
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          onGenerateRoute: onGenerateRoute,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
        );
      },
      child: const SplashScreen(),
    );
  }
}
