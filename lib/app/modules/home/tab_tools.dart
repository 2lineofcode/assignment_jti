import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_controller.dart';

class TabTools extends GetView<HomeController> {
  const TabTools({super.key});

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        'Tab Tools'.text.white.makeCentered().pOnly(bottom: 4),
        ElevatedButton(
          onPressed: () => controller.logout(),
          child: 'Logout'.text.make(),
        ).centered(),
      ],
    ).centered();
  }
}
