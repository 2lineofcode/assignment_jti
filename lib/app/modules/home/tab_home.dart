import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/app_color.dart';

import '../../extensions/ext_money.dart';
import '../../helpers/helper_decoration.dart';
import '../../widgets/dash_divider.dart';
import 'home_controller.dart';
import 'widget_slider_container.dart';

class TabHome extends GetView<HomeController> {
  const TabHome({super.key});

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        Container(
          width: double.infinity,
          decoration: DecorationHelper.box(),
          child: Stack(
            children: [
              VStack(
                [
                  /// outletName
                  Obx(() => '# Outlet: ${controller.initData.value.outlet?.outletName ?? '...'}'.text.bold.color(primaryColor).make().pOnly(bottom: 12)),

                  /// list
                  GetBuilder<HomeController>(
                    init: HomeController(),
                    initState: (_) {},
                    builder: (_) => ListView.builder(
                      itemCount: controller.initData.value.curTipe?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final itemCurr = controller.initData.value.curTipe?[index];
                        final groupingCurrSum = [
                          controller.sumIDR.value,
                          controller.sumUSD.value,
                          controller.sumSGD.value,
                          controller.sumEUR.value,
                        ];
                        return HStack(
                          [
                            SvgPicture.asset('assets/icons/ic_curr_${itemCurr?.ctNama?.toLowerCase()}.svg').pOnly(right: 8),
                            '${itemCurr?.ctNama}'.text.neutral700.make(),
                            DashDivider().pSymmetric(h: 12).expand(),
                            '${groupingCurrSum[index].moneyFormat(symbol: '')}'.text.make(),
                            32.widthBox,
                          ],
                        ).p8();
                      },
                    ),
                  ),
                ],
              ).p12(),

              /// slide menu :close
              AnimatedContainer(
                duration: 1.seconds,
                child: SvgPicture.asset('assets/icons/slide_close.svg', height: 180, width: 47) //
                    .onInkTap(() => controller.onToggleSlider())
                    .cornerRadius(12)
                    .positioned(right: 0, top: 0),
              ),

              /// slide menu :open
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (_) => WidgetSliderContainer(),
              ),
            ],
          ),
        ),
      ],
    ).pOnly(top: 65, left: 12, right: 12);
  }
}
