import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/app_color.dart';

mixin DecorationHelper {
  /// #### textfield :decorator :input
  static InputDecoration input({
    String? hint,
    Color? fillColor,
    Widget? suffix,
    Widget? suffixIcon,
    Widget? prefix,
    Widget? prefixIcon,
    Widget? icon,
    String? label,
    InputBorder? border,
    EdgeInsetsGeometry? contentPadding,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: fillColor,
      hintText: hint,
      hintStyle: TextStyle(fontSize: 13),
      border: border ?? OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: border ?? OutlineInputBorder(borderSide: BorderSide.none),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide.none),
      contentPadding: contentPadding ?? EdgeInsets.only(top: 2, bottom: 2, left: 12, right: 12),
      icon: icon,
      labelText: label,
      labelStyle: TextStyle(fontSize: 13, color: colorPrimary),
      // prefix
      prefix: prefix,
      prefixIcon: prefixIcon,
      // suffix
      suffix: suffix,
      suffixIcon: suffixIcon,
    );
  }

  /// #### container :decorator :box
  static BoxDecoration box({
    Color? borderColor = Colors.white,
    Color? fillColor = Colors.white,
    double borderRadius = 12,
    double? borderWidth = 0,
  }) {
    return BoxDecoration(
      color: fillColor ?? Get.theme.cardColor,
      border: Border.all(
        color: borderColor ?? Get.theme.hintColor.withAlpha(100),
        width: borderWidth ?? 1,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  /// #### container :decorator :top
  static BoxDecoration top({
    Color? fillColor,
    double radius = 16,
  }) {
    return BoxDecoration(
      color: fillColor ?? Get.theme.cardColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
    );
  }

  /// #### container :decorator :custom
  static BoxDecoration custom({
    Color? fillColor,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return BoxDecoration(
      color: fillColor ?? Get.theme.cardColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft ?? 0),
        topRight: Radius.circular(topRight ?? 0),
        bottomLeft: Radius.circular(bottomLeft ?? 0),
        bottomRight: Radius.circular(bottomRight ?? 0),
      ),
    );
  }
}
