import 'package:flutter/material.dart';
import 'package:pixelfield/common/builder/if_builder.dart';
import 'package:pixelfield/common/builder/if_else_builder.dart';
import 'package:pixelfield/utils/colors/colors.dart';
import 'package:pixelfield/utils/images/images_utils.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? textEditingController;
  final bool? isObscureText;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final Function(String)? validator;
  final TextInputAction? textInputAction;

  const CustomTextField(
      {super.key,
      this.label,
      this.validator,
      this.hintText,
      this.focusNode,
      this.nextFocus,
        this.textInputAction,
      this.textEditingController,
      this.textInputType,
      this.isObscureText});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      validator: (val) => widget.validator?.call(val ?? ""),
      onFieldSubmitted: (_) {
        widget.nextFocus != null
            ? FocusScope.of(context).requestFocus(widget.nextFocus)
            : null;
      },
      obscureText: (widget.isObscureText ?? false) && isPasswordVisible,
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
      style: Theme.of(context).inputDecorationTheme.hintStyle,
      decoration: inputDecoration(context),
    );
  }

  InputDecoration inputDecoration(BuildContext context) {
    return InputDecoration(
      hintText: widget.hintText,
      contentPadding: const EdgeInsets.only(bottom: 5),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      suffixIcon: IfBuilder(
        condition: widget.isObscureText ?? false,
        builder: (context) => InkWell(
          onTap: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          child: IfElseBuilder(
              condition: isPasswordVisible,
              ifBuilder: (context) => Image.asset(ImagesUtils.eyeImage),
              elseBuilder: (context) => Icon(
                    Icons.visibility_off_outlined,
                    color: ColorUtils.signInTextColor,
                  )),
        ),
      ),
      hintStyle: Theme.of(context)
          .inputDecorationTheme
          .hintStyle
          ?.copyWith(color: Colors.white54),
      label: Text(widget.label ?? ''),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
            color: Theme.of(context)
                    .inputDecorationTheme
                    .border
                    ?.borderSide
                    .color ??
                Colors.transparent),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: Theme.of(context)
                    .inputDecorationTheme
                    .enabledBorder
                    ?.borderSide
                    .color ??
                Colors.transparent),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context)
                  .inputDecorationTheme
                  .focusedBorder
                  ?.borderSide
                  .color ??
              Colors.transparent,
        ),
      ),
    );
  }
}
