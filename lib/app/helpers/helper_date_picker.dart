import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/widgets.dart';
import 'helper_decoration.dart';

/*
 * DatePickerHelper
 * Created by AditP at (c) 2019, LLC. All rights reserved.
 */
mixin DatePickerHelper {
  /// ! DATE PICKER (CUPERTINO) —————————————————————————————————————————————————
  static void cupertino({
    required Function(DateTime) callback,
    String title = 'Select Date',
    String btnOKText = 'Select',
    String btnCancelText = 'Cancel',
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
  }) {
    var output = DateTime.now();
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (_) => CupertinoApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => Container(
          height: Get.size.height * 0.50,
          decoration: DecorationHelper.top(),
          child: Column(
            children: [
              DashDivider().pOnly(top: 12),
              HStack([
                title.text.size(14).color(Get.theme.textTheme.displayMedium?.color).fontWeight(FontWeight.w500).make().expand(),
              ]).pOnly(left: 20, top: 12, bottom: 12),
              Divider(),
              CupertinoTheme(
                data: CupertinoThemeData(
                  brightness: Get.isDarkMode ? Brightness.dark : Brightness.light,
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                      color: Get.theme.textTheme.bodyLarge?.color,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                child: CupertinoDatePicker(
                  minimumYear: 1980,
                  maximumYear: 2050,
                  mode: mode,
                  initialDateTime: initialDate ?? DateTime.now(),
                  minimumDate: minDate ?? DateTime.now().subtract(1.seconds),
                  maximumDate: maxDate?.add(1.minutes) ?? DateTime(2050),
                  dateOrder: DatePickerDateOrder.dmy,
                  onDateTimeChanged: (val) => output = val,
                  use24hFormat: true,
                ).w(double.infinity),
              ).expand(),
              HStack(
                [
                  ElevatedButton(
                    onPressed: Get.back,
                    child: Text(btnCancelText, style: TextStyle(color: Vx.red500)),
                  ).expand(),
                  1.widthBox,
                  ElevatedButton(
                    child: Text(btnOKText, style: TextStyle(color: Get.theme.textTheme.displayLarge?.color)),
                    onPressed: () {
                      callback.call(output);
                      Navigator.of(Get.context!).pop();
                    },
                  ).expand(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ! DATE PICKER (MATERIAL) ——————————————————————————————————————————————————
  static Future<void> material({
    required Function(DateTime) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: minDate ?? DateTime(2020),
      lastDate: maxDate ?? DateTime(2050),
    );
    if (picked != null) {
      callback.call(picked);
    }
  }
}
