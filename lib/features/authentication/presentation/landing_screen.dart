import 'package:flutter/material.dart';
import 'package:pixelfield/common/animation/fade_slide_horizontal.dart';
import 'package:pixelfield/common/builder/custom_page_route_builder.dart';
import 'package:pixelfield/common/builder/pixelfield_scaffold.dart';
import 'package:pixelfield/common/widgets/custom_button.dart';
import 'package:pixelfield/features/authentication/presentation/sign_in_screen.dart';
import 'package:pixelfield/utils/colors/colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelFieldScaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: FadeSlideHorizontal(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16, vertical: 32),
            child: SizedBox(
              height: 264,
              width: double.infinity,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                margin: EdgeInsetsDirectional.zero,
                color: Theme.of(context).cardColor,
                elevation: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome!",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Adventure Poured. Stories Unleashed.",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16, top: 24, bottom: 36),
                      child: CustomButton(
                        message: "Scan bottle",
                        onButtonClick: () {},
                      ),
                    ),
                    CustomRichText(
                        leftText: "Have an account?",
                        rightText: "Sign in first",
                        onTapRightText: () {
                          Navigator.push(
                            context,
                            SlideBottomRoute(widget: const SignInScreen()),
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomRichText extends StatelessWidget {
  final String leftText;
  final String rightText;
  final VoidCallback onTapRightText;

  const CustomRichText(
      {super.key,
      required this.leftText,
      required this.rightText,
      required this.onTapRightText});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leftText,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 16, color: ColorUtils.darkGreyTextColor),
        ),
        const SizedBox(
          width: 8,
        ),
        TextButton(
            onPressed: () {
              onTapRightText.call();
            },
            child: Text(
              rightText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorUtils.signInTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ))
      ],
    );
  }
}
