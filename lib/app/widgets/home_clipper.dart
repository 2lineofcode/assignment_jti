import 'package:flutter/material.dart';

/// ### screenshoot
/// <img width="200" alt="image" src="https://img001.prntscr.com/file/img001/SttLTFSCTjm9G24NkXdXeQ.png">
class HomeClipper extends CustomClipper<Path> {
  final double space;

  HomeClipper(this.space);

  @override
  Path getClip(Size size) {
    final path = Path();
    final halfWidth = size.width / 2;
    final halfSpace = space / 2;
    final curve = space / 90;
    final height = halfSpace / 1.3;

    // log('## --------------------------');
    // log('halfWidth: $halfWidth');
    // log('halfSpace: $halfSpace');
    // log('curve: $curve');
    // log('height: $height');
    // log('## --------------------------');

    path.lineTo(halfWidth - halfSpace, 0);
    path.cubicTo(halfWidth - halfSpace + 50, 0, halfWidth - halfSpace + curve, height, halfWidth, height);
    path.cubicTo(halfWidth + halfSpace - curve, height, halfWidth + halfSpace - 50, 0, halfWidth + halfSpace, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
