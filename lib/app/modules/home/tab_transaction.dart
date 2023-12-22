import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TabTransaction extends StatelessWidget {
  const TabTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        'Tab Transaction'.text.white.make(),
        Placeholder().pSymmetric(v: 16),
      ],
    ).pOnly(top: 55, left: 12, right: 12);
  }
}
