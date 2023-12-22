import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TabReport extends StatelessWidget {
  const TabReport({super.key});

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        'Tab Report'.text.white.make(),
        Placeholder().pSymmetric(v: 16),
      ],
    ).pOnly(top: 55, left: 12, right: 12);
  }
}
