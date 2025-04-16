import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

class AnimatedButton extends StatefulWidget {
  final Function? onTap;
  final Duration animationDuration;
  final Widget child;
  final Function? onClickedSound;

  const AnimatedButton(
      {super.key,
      this.onClickedSound,
      this.animationDuration = const Duration(milliseconds: 200),
      required this.child,
      this.onTap});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final tween = Tween<double>(begin: 0, end: pressed ? 0.04 : 0);

    return PlayAnimationBuilder<double>(
      tween: tween,
      duration: widget.animationDuration,
      builder: (context, value, child) => Transform.scale(
        scale: 1 - value,
        child: GestureDetector(
            onTap: () {
              pressed = true;
              setState(() {});
              Future.delayed(const Duration(milliseconds: 100), () {
                pressed = false;
                setState(() {});
              });
              widget.onClickedSound?.call();
              Future.delayed(const Duration(milliseconds: 150), () {
                widget.onTap?.call(true);
              });
            },
            onTapCancel: () {
              pressed = false;
              setState(() {});
            },
            onTapUp: (e) {
              pressed = false;
              setState(() {});
            },
            onTapDown: (e) {
              pressed = true;
              setState(() {});
            },
            child: child),
      ),
      child: widget.child,
    );
  }
}
