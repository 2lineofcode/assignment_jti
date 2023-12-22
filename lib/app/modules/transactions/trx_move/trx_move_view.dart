import 'dart:convert';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/app_color.dart';
import '../../../core/app_pref.dart';
import '../../../helpers/helpers.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/dash_divider.dart';
import 'trx_move_controller.dart';

class TrxMoveView extends GetView<TrxMoveController> {
  const TrxMoveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pindah'),
      ),
      body: VStack(
        [
          /// dropdown :outletA :outletB
          Container(
            width: double.infinity,
            decoration: DecorationHelper.custom(bottomLeft: 16, bottomRight: 16, fillColor: Colors.white),
            child: Row(
              children: [
                /// dropdown :from
                VStack(
                  [
                    'Dari:'.text.minFontSize(11).size(11).bold.make().pOnly(left: 4, bottom: 8),
                    Obx(
                      () => CustomDropdown(
                        hint: 'Nama Outlet',
                        value: controller.selectedOutlet1Name.value,
                        dropdownItems: controller.listOutlet1,
                        onChanged: (s) => controller.selectedOutlet1Name.value = s ?? '',
                      ).centered(),
                    ),
                  ],
                ).pSymmetric(v: 24, h: 12),

                DashDivider(color: Vx.neutral300).centered().pOnly(top: 18).expand(),

                /// dropdown :to
                VStack(
                  [
                    'Ke:'.text.minFontSize(11).size(11).bold.make().pOnly(left: 4, bottom: 8),
                    Obx(
                      () => CustomDropdown(
                        hint: 'Nama Outlet',
                        value: controller.selectedOutlet2Name.value,
                        dropdownItems: controller.listOutlet2,
                        onChanged: (s) => controller.selectedOutlet2Name.value = s ?? '',
                      ).centered(),
                    ),
                  ],
                ).pSymmetric(v: 24, h: 12),
              ],
            ),
          ),

          VStack(
            [
              /// start date
              'Start Date'.text.white.size(12).make().pOnly(bottom: 8),
              Obx(
                () => Container(
                  width: double.infinity,
                  decoration: DecorationHelper.box(),
                  child: '${controller.startDateSelected.value}'.text.make().p12(),
                ).pOnly(bottom: 12).onTap(() {
                  DatePickerHelper.material(callback: (dt) {
                    controller.startDateSelected.value = DateFormat(kDateFormatYMD).format(dt);
                  });
                }),
              ),

              /// input
              'Input'.text.white.size(12).make().pOnly(bottom: 8),
              Container(
                width: double.infinity,
                decoration: DecorationHelper.box(),
                child: HStack(
                  [
                    TextField(
                      controller: controller.tfAmount,
                      style: TextStyle(color: primaryColor, fontSize: 13),
                      decoration: DecorationHelper.input(hint: '0', fillColor: Colors.white),
                      inputFormatters: [CurrencyTextInputFormatter(symbol: '', decimalDigits: 0)],
                      keyboardType: TextInputType.number,
                    ).expand(),
                    SvgPicture.asset('assets/icons/ic_line.svg', height: 32),
                    Obx(
                      () => CustomDropdown(
                        hint: 'Currency',
                        currencyMode: true,
                        value: controller.selectedCurrency.value,
                        bgColor: Colors.white,
                        dropdownItems: controller.listCurrency,
                        onChanged: (s) => controller.selectedCurrency.value = s ?? '',
                      ).centered(),
                    ),
                  ],
                ),
              ).pOnly(bottom: 12),

              /// upload photo
              'Photo'.text.white.size(12).make().pOnly(bottom: 8),
              Obx(
                () => Container(
                  width: double.infinity,
                  decoration: DecorationHelper.box(),
                  child: HStack(
                    [
                      Visibility(
                        visible: controller.photos.length < 4,
                        child: Container(
                          height: 63,
                          constraints: BoxConstraints(minWidth: 70),
                          color: secondaryColor,
                          child: IconButton(
                            onPressed: () async {
                              if (controller.photos.length >= 4) {
                                SnackbarHelper.warning('max upload photo 4');
                                return;
                              }
                              await PickerHelper.image(callback: (img64) => controller.photos.add(img64));
                            },
                            icon: Icon(Icons.add_box_outlined),
                          ),
                        ).cornerRadius(12).pOnly(right: 12),
                      ),
                      for (var i = 0; i < controller.photos.length; i++) ...[
                        Container(
                          height: 63,
                          constraints: BoxConstraints(minWidth: 70, maxWidth: 70),
                          color: secondaryColor,
                          child: Stack(
                            children: [
                              Image.memory(
                                base64Decode(controller.photos[i]),
                                fit: BoxFit.cover,
                                height: 70,
                                width: 70,
                              ),
                              Icon(
                                Icons.remove_circle,
                                color: Vx.red400,
                              ).onTap(() => controller.photos.removeAt(i)).positioned(right: 2, top: 2),
                            ],
                          ),
                        ).cornerRadius(12).pOnly(right: 12),
                      ],
                    ],
                  ).p12(),
                ).pOnly(bottom: 12),
              ),

              /// description
              'Keterangan'.text.white.size(12).make().pOnly(bottom: 8),
              Container(
                width: double.infinity,
                decoration: DecorationHelper.box(),
                child: HStack(
                  [
                    TextField(
                      controller: controller.tfDescription,
                      style: TextStyle(color: primaryColor, fontSize: 13),
                      decoration: DecorationHelper.input(
                        fillColor: Colors.white,
                        hint: 'Write something for more information...',
                      ),
                      minLines: 2,
                      maxLines: 10,
                    ).expand(),
                  ],
                ),
              ).pOnly(bottom: 12),
            ],
          ).p16(),
        ],
      ).scrollVertical(),
      bottomNavigationBar: ElevatedButton(
        onPressed: () => controller.onSubmit(),
        child: 'Submit'.text.make(),
      ).h(44).p12(),
    );
  }
}
