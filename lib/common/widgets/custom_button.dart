import 'package:flutter/material.dart';
import 'package:pixelfield/common/animation/animated_inkwell.dart';
import 'package:pixelfield/utils/colors/colors.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String message;
  final VoidCallback onButtonClick;
  final Widget? leadingIcon;

  const CustomButton(
      {super.key,
      this.width,
      this.height,
      required this.message,
      required this.onButtonClick,
      this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 56,
      width: width ?? double.infinity,
      child: AnimatedInkWell(
        onTap: () {
          onButtonClick.call();
        },
        child: Card(
          color: ColorUtils.buttonColor,
          elevation: 4,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(leadingIcon != null)
                  leadingIcon!,
                if(leadingIcon != null)
                  const SizedBox(
                    width: 8,
                  ),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorUtils.buttonTextColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
