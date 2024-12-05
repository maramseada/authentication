import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';


class HiveHelper {
  static final Box _appBox = Hive.box('app_box');

  static Box get appBox => _appBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox('app_box');
  }

  static Future<void> write({
    required String key,
    required dynamic value,
  }) async =>
      await _appBox.put(key, value);

  static dynamic read({required String key}) async => await _appBox.get(key);

  static bool hasData({required String key}) => _appBox.containsKey(key);

//==== OnBoarding Caching Methods ====
  static Future<void> checkOnBoardingComplete() async =>
      await write(key: 'onBoarding', value: true);

  static Future<bool> getOnBoardingValue() async {
    bool isOnBoardingChecked = false;
    if (hasData(key: 'onBoarding')) {
      isOnBoardingChecked = await read(key: 'onBoarding');
    }
    return isOnBoardingChecked;
  }

//==== User Caching Methods ====
}