import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/app_color.dart';
import '../../../core/app_pref.dart';
import '../../../helpers/helper_date_picker.dart';
import '../../../helpers/helper_decoration.dart';
import '../../../widgets/custom_dropdown.dart';
import 'trx_in_controller.dart';

class TrxInView extends GetView<TrxInController> {
  const TrxInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Masuk')),
      body: VStack(
        [
          /// dropdown :outlet
          Container(
            width: double.infinity,
            decoration: DecorationHelper.custom(bottomLeft: 16, bottomRight: 16, fillColor: Colors.white),
            child: VStack(
              [
                Obx(
                  () => CustomDropdown(
                    hint: 'Nama Outlet',
                    prefixText: 'Outlet: ',
                    value: controller.selectedOutlet.value,
                    dropdownItems: controller.listOutlet,
                    onChanged: (s) => controller.selectedOutlet.value = s ?? '',
                  ).centered(),
                ),
              ],
            ).pSymmetric(v: 24),
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
                  DatePickerHelper.materialDatePicker(callback: (dt) {
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
              Container(
                width: double.infinity,
                decoration: DecorationHelper.box(),
                child: HStack(
                  [
                    Container(
                      height: 63,
                      constraints: BoxConstraints(minWidth: 70),
                      color: secondaryColor,
                      child: IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
                    ).cornerRadius(12).pOnly(right: 12),
                    for (var i = 0; i < 3; i++) ...[
                      Container(
                        height: 63,
                        constraints: BoxConstraints(minWidth: 70),
                        color: secondaryColor,
                      ).cornerRadius(12).opacity(value: 0.3).pOnly(right: 12),
                    ],
                  ],
                ).p12(),
              ).pOnly(bottom: 12),

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
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () => controller.onSubmit(),
        child: 'Submit'.text.make(),
      ).h(44).p12(),
    );
  }
}
