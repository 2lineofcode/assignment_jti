import 'package:flutter/material.dart';

/// ### screenshoot
/// <img width="200" alt="image" src="https://img001.prntscr.com/file/img001/SttLTFSCTjm9G24NkXdXeQ.png">
class ClipperContainer extends StatelessWidget {
  final Shadow? shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  const ClipperContainer({
    super.key,
    this.shadow,
    required this.clipper,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: clipper,
        shadow: shadow ?? Shadow(),
      ),
      child: ClipPath(clipper: clipper, child: child),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
