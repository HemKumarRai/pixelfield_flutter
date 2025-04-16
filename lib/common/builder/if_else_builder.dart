import 'package:flutter/material.dart';

class IfElseBuilder extends StatelessWidget {
  final bool condition;
  final Widget Function(BuildContext context) ifBuilder;
  final Widget Function(BuildContext context) elseBuilder;
  const IfElseBuilder({
    super.key,
    required this.condition,
    required this.ifBuilder,
    required this.elseBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return condition ? ifBuilder(context) : elseBuilder(context);
  }
}
