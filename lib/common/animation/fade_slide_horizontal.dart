import 'package:flutter/material.dart';

class FadeSlideHorizontal extends StatefulWidget {
  final double delay;
  final Widget child;
  final double begin;
  final Duration animationDuration;

  const FadeSlideHorizontal({
    super.key,
    this.delay = 0.0,
    required this.child,
    this.begin = 130.0,
    this.animationDuration = const Duration(milliseconds: 300),
  });
  @override
  State<FadeSlideHorizontal> createState() => _FadeSlideHorizontalState();
}

class _FadeSlideHorizontalState extends State<FadeSlideHorizontal> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<double>(begin: widget.begin, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Add delay if specified
    Future.delayed(Duration(milliseconds: (widget.delay * 1000).round()), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) => Opacity(
        opacity: _opacityAnimation.value,
        child: Transform.translate(
          offset: Offset(_slideAnimation.value, 0),
          child: child,
        ),
      ),
    );
  }
}
