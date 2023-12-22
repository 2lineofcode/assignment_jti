import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

mixin LoadingUiHelper {
  /// -- example implementation
  /// ```dart
  /// void loading() {
  ///    ExLoading.show(context: Get.context!);
  ///    Future.delayed(3.seconds).then((value) => ExLoading.dismiss(Get.context!));
  /// }
  /// ```
  static void show({
    bool isDismissible = true,
    Widget? child,
    Color? barrierColor,
    String? message,
    double? paddingSymmetric,
  }) {
    final showCancel = false.obs;
    Future.delayed(5.seconds, () {
      showCancel.value = true;
    });

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: child?.p24() ??
            VStack(
              [
                CupertinoActivityIndicator().centered(),
                if (message != null) Text(message, textAlign: TextAlign.center).centered().pOnly(top: 16),
                Obx(
                  () => showCancel.value == true
                      ? OutlinedButton(
                          onPressed: Get.back,
                          child: 'Cancel'.text.make(),
                        ).pOnly(top: 24).centered()
                      : Container(),
                ),
              ],
            ).p24(),
      ).pSymmetric(h: paddingSymmetric ?? 90),
      barrierDismissible: isDismissible,
      barrierColor: barrierColor,
    );
  }

  static void dismiss() {
    if (Get.isDialogOpen == true) Get.back();
  }
}
