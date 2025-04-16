import 'package:flutter/material.dart';
import 'package:pixelfield/utils/colors/colors.dart';

class VerticalTimeLine extends StatelessWidget {
  final int index;
  final bool isLast;

  const VerticalTimeLine({super.key, this.index = 0, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Column(
        children: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsetsDirectional.only(top: index == 0 ? 20 : 0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          // golden line + diamonds
          Expanded(
            child: CustomPaint(
              painter: TimelineLinePainter(isLast: isLast),
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineLinePainter extends CustomPainter {
  final bool isLast;

  TimelineLinePainter({required this.isLast});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorUtils.buttonColor
      ..strokeWidth = 1;

    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);

    final centerX = size.width / 2;
    const double spacing = 16;
    final double top = size.height / 2.8 - spacing;
    final double middle = size.height / 2.8;
    final double bottom = size.height / 2.8 + spacing;


    final List<double> positions = [top, middle, bottom];

    for (double y in positions) {
      final isMiddle = y == middle;
      final diamondSize = isMiddle ? 7.0 : 3.0;

      final path = Path();
      path.moveTo(centerX, y - diamondSize);
      path.lineTo(centerX + diamondSize, y);
      path.lineTo(centerX, y + diamondSize);
      path.lineTo(centerX - diamondSize, y);
      path.close();
      canvas.drawPath(path, paint);
    }

    if (isLast) {
      canvas.drawCircle(Offset(size.width / 2, size.height), 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
