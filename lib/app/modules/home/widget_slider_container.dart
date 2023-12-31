import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/app_pref.dart';
import '../../extensions/ext_money.dart';
import '../../helpers/helper_decoration.dart';
import '../../repository/repo_trx.dart';
import '../../widgets/dash_divider.dart';
import 'home_controller.dart';

/// * WidgetSliderContainer
/// ? Appearance After Slide Opened ~
/// screenshoot: <img>https://img001.prntscr.com/file/img001/M3hN-fB9QoamsNMiNqVhsA.png</img>
class WidgetSliderContainer extends GetView<HomeController> {
  const WidgetSliderContainer({super.key, this.height});

  final double? height;
  @override
  Widget build(BuildContext context) {
    final trxTypeList = controller.initData.value.trxTipe ?? [];

    return AnimatedContainer(
      duration: 200.milliseconds,
      width: controller.sliderWidth.value,
      height: height,
      curve: Curves.easeInOut,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// slide menu :background
          SvgPicture.asset('assets/icons/slide_open.svg', height: height),

          /// slide menu :content
          VStack(
            [
              Container(
                width: 290,
                decoration: DecorationHelper.box(),
                child: VStack(
                  [
                    /// 0
                    HStack([
                      'Jumlah Barang'.text.size(11).minFontSize(11).neutral500.bold.make(),
                      DashDivider().pSymmetric(h: 12).expand(),
                      '${controller.transactionList.length}'.text.size(11).minFontSize(11).neutral500.bold.make(),
                    ]).pOnly(bottom: 8),

                    /// 1
                    HStack([
                      'Total IDR'.text.size(11).minFontSize(11).make(),
                      DashDivider().pSymmetric(h: 12).expand(),
                      '${controller.sumIDR.value.moneyFormat()}'.text.size(11).minFontSize(11).make(),
                    ]).pOnly(bottom: 5),

                    /// 2
                    HStack([
                      'Total USD'.text.size(11).minFontSize(11).make(),
                      DashDivider().pSymmetric(h: 12).expand(),
                      '${controller.sumUSD.value.moneyFormat(symbol: r'$ ')}'.text.size(11).minFontSize(11).make(),
                    ]).pOnly(bottom: 5),

                    /// 3
                    HStack([
                      'Total EUR'.text.size(11).minFontSize(11).make(),
                      DashDivider().pSymmetric(h: 12).expand(),
                      '${controller.sumEUR.value.moneyFormat(symbol: r'€ ')}'.text.size(11).minFontSize(11).make(),
                    ]).pOnly(bottom: 5),

                    /// 4
                    HStack([
                      'Total SGD'.text.size(11).minFontSize(11).make(),
                      DashDivider().pSymmetric(h: 12).expand(),
                      '${controller.sumSGD.value.moneyFormat(symbol: r'S$ ')}'.text.size(11).minFontSize(11).make(),
                    ]).pOnly(bottom: 5),
                  ],
                ).p8(),
              ).pOnly(bottom: 8, top: 8),

              /// slide menu :content :bottomMenu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// menu :masuk
                  Column(
                    children: [
                      SvgPicture.asset('assets/icons/ic_input_in.svg'),
                      'Masuk'.text.size(12).make(),
                    ],
                  ).onInkTap(() => controller.goInputInOrOut(TransactionType.debet)),

                  /// menu :keluar
                  Column(
                    children: [
                      SvgPicture.asset('assets/icons/ic_input_out.svg'),
                      'Keluar'.text.size(12).make(),
                    ],
                  ).onInkTap(() => controller.goInputInOrOut(TransactionType.kredit)),

                  /// menu :pindah -> admin or manager
                  if (AppPref.currentUserRole == 'Admin' || AppPref.currentUserRole == 'Manager') ...[
                    Column(
                      children: [
                        SvgPicture.asset('assets/icons/ic_input_move.svg'),
                        'Pindah'.text.size(12).make(),
                      ],
                    ).onInkTap(() => controller.goInputMove()),
                  ],

                  /// menu :mutasi
                  if (trxTypeList.length > 3) ...[
                    Column(
                      children: [
                        SvgPicture.asset('assets/icons/ic_input_mutation.svg'),
                        'Mutasi'.text.size(12).make(),
                      ],
                    ).onInkTap(() => controller.goInputMutation()),
                  ],

                  /// menu :kurs
                  if (trxTypeList.length > 4) ...[
                    Column(
                      children: [
                        SvgPicture.asset('assets/icons/ic_input_kurs.svg'),
                        'Kurs'.text.size(12).make(),
                      ],
                    ).onInkTap(() => controller.goInputKurs()),
                  ],
                ],
              ).w(290),
            ],
          ).positioned(left: 50, top: 8),

          /// slide menu :close
          SvgPicture.asset('assets/icons/ic_slide_close.svg').onInkTap(() => controller.onToggleSlider()).positioned(bottom: 0, top: 0, left: 24),
        ],
      ),
    ).cornerRadius(12).positioned(right: 0, top: 0);
  }
}
