import 'package:flutter/material.dart';
import 'package:pixelfield/common/builder/pixelfield_scaffold.dart';
import 'package:pixelfield/common/widgets/custom_button.dart';
import 'package:pixelfield/common/widgets/custom_text_field.dart';
import 'package:pixelfield/features/authentication/presentation/landing_screen.dart';
import 'package:pixelfield/features/dashboard/presentation/dashboard_screen.dart';
import 'package:pixelfield/utils/dimension/dimension_utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController?.dispose();
    _passwordController?.dispose();

    if (emailFocusNode.hasFocus) {
      emailFocusNode.unfocus();
    }
    emailFocusNode.dispose();

    if (passwordFocusNode.hasFocus) {
      passwordFocusNode.unfocus();
    }
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PixelFieldScaffold(
        bgImageRequired: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.only(
              start: DimensionUtils.kHorizontalPadding,
              end: DimensionUtils.kHorizontalPadding,
              top: 48),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(
                  "Sign in",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  focusNode: emailFocusNode,
                  nextFocus: passwordFocusNode,
                  textEditingController: _emailController,
                  textInputAction: TextInputAction.next,
                  validator: _validateEmail,
                  label: "Email",
                  hintText: "enter your email",
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: "Password",
                  focusNode: passwordFocusNode,
                  textInputAction: TextInputAction.done,
                  textEditingController: _passwordController,
                  hintText: "enter your password",
                  isObscureText: true,
                  validator: _validatePassword,
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 40),
                CustomButton(
                    message: "Continue",
                    onButtonClick: () {
                      _submit(context);
                    }),
                const SizedBox(height: 40),
                CustomRichText(
                    leftText: "Can't sign in",
                    rightText: "Recover password",
                    onTapRightText: () {})
              ],
            ),
          ),
        ));
  }

  String? _validateEmail(String? value) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (value == null || value.isEmpty) return 'Email is required';
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    return null;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful')),
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const DashBoardScreen(
                    initialIndex: 1,
                  )));
    }
  }
}
