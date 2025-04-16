import 'package:flutter/material.dart';

class HorizontalBottomLine extends StatelessWidget {
  const HorizontalBottomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 135,
      alignment: Alignment.center,
      margin: const EdgeInsetsDirectional.only(bottom: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
    );
  }
}
