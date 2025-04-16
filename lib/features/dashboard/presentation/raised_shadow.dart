import 'package:flutter/material.dart';

class RaisedShadow extends StatelessWidget {
  const RaisedShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: CustomPaint(
        painter: _RaisedShadowPainter(),
      ),
    );
  }
}

class _RaisedShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintGrey = Paint()..color = Colors.red;
    var rRectRed = RRect.fromLTRBR(-6, 0, 6.0, 4.0, const Radius.circular(4.0));
    canvas.drawRRect(rRectRed, paintGrey);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
