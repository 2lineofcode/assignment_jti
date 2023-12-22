import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TabTools extends StatelessWidget {
  const TabTools({super.key});

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        'Tab Tools'.text.white.make(),
        Placeholder().pSymmetric(v: 16),
      ],
    ).pOnly(top: 55, left: 12, right: 12);
  }
}
