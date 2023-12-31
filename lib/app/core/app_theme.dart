import 'package:flutter/material.dart';

import 'app_color.dart';

mixin AppTheme {
  static final light = ThemeData.light(useMaterial3: false).copyWith(
    /// ! appbar
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colorPrimary),
      iconTheme: IconThemeData(
        color: colorPrimary,
      ),
    ),
    scaffoldBackgroundColor: colorPrimary,

    /// ! button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorSecondary,
        foregroundColor: colorPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
      ),
    ),

    /// ! tabbar
    tabBarTheme: TabBarTheme(
      labelColor: colorPrimary,
      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
      unselectedLabelColor: colorSecondary,
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 11),
      labelPadding: EdgeInsets.zero,
      indicatorColor: Colors.transparent,
    ),

    /// ! text
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: colorPrimary),
      bodySmall: TextStyle(color: colorPrimary),
      bodyLarge: TextStyle(color: colorPrimary),
    ),

    /// ! icon
    iconTheme: IconThemeData(color: colorPrimary),
  );

  static final dark = ThemeData.dark(useMaterial3: true).copyWith();
  static ThemeMode get currentTheme => ThemeMode.light; // ! hardcode

  /// ! load theme from shared preference
  // static bool _isDarkMode() => pref.read(kIsDarkMode) ?? true;
  // static ThemeMode get currentTheme => _isDarkMode() ? ThemeMode.dark : ThemeMode.light;
  // static Future<void> switchTheme() async {
  //   Get.changeThemeMode(_isDarkMode() ? ThemeMode.light : ThemeMode.dark);
  //   await pref.write(kIsDarkMode, !_isDarkMode());
  //   await 600.milliseconds.delay();
  //   await Get.forceAppUpdate();
  // }
}
