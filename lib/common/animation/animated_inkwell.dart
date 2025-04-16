import 'package:flutter/material.dart';
import 'package:pixelfield/common/animation/animated_button.dart';


class AnimatedInkWell extends StatelessWidget {
  final Widget child;
  final double cornerRadius;
  final Function? onTap;
  final bool scaleAnimation;
  final Color? cardColor;
  const AnimatedInkWell(
      {super.key,
        required this.child,
        this.cornerRadius = 12,
        this.onTap,
        this.cardColor,
        this.scaleAnimation = true});

  @override
  Widget build(BuildContext context) {
    if (scaleAnimation) {
      return AnimatedButton(
        onClickedSound: () {
        },
        onTap: (bool val) {
          onTap?.call();
        },
        child: buildBody(context),
      );
    }
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: double.infinity, width: double.infinity, child: child),
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(cornerRadius),
            child: Material(
              color: cardColor ?? Colors.transparent,
              child: InkWell(
                splashColor: const Color(0xff2C96F8).withOpacity(0.3),
                highlightColor: const Color(0xff2C96F8).withOpacity(0.2),
                // onTap: onTap,
              ),
            ),
          ),
        ),
      ],
    );
  }
}