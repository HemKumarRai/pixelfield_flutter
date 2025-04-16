import 'package:flutter/material.dart';

class IfBuilder extends StatelessWidget {
  final bool condition;
  final Widget Function(BuildContext context) builder;
  const IfBuilder({super.key, required this.builder, required this.condition});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: condition,
        child: builder(context));
  }
}
