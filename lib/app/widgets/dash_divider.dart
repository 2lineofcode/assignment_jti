import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

/// ### screenshoot
/// <img width="200" alt="image" src="https://img001.prntscr.com/file/img001/g0n7twDqTN6j2yfp-P9rDQ.png">
class DashDivider extends StatelessWidget {
  const DashDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        150 ~/ 2,
        (index) => Expanded(
          child: Container(
            color: index.isOdd ? Colors.transparent : Vx.neutral200,
            height: 1,
          ),
        ),
      ),
    );
  }
}
