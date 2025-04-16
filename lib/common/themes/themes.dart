import 'package:flutter/material.dart';
import 'package:pixelfield/utils/colors/colors.dart';
import 'package:pixelfield/utils/dimension/dimension_utils.dart';
import 'package:pixelfield/utils/text_style/text_style_utils.dart';

AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: ColorUtils.scaffoldBackgroundColor,
    toolbarHeight: DimensionUtils.kAppBarHeight);
const headline4Theme = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 34.0,
  color: Colors.black,
  fontStyle: FontStyle.normal,
);
const headline5Theme = TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: 24.0,
);
const headline6Theme = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w800,
  color: Colors.black,
  fontStyle: FontStyle.normal,
  letterSpacing: 0.15,
);
const bodyText1Theme = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 16.0,
);
const bodyText2Theme = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: Color.fromARGB(158, 0, 0, 0));


const iconTheme = IconThemeData(color: Colors.white);

final elevationButtonStyle = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    backgroundColor: const Color.fromARGB(255, 31, 137, 21),
    padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
    textStyle: const TextStyle(
      fontSize: 16.0,
    ),
    shadowColor: Colors.black,
    //specify the button's elevation color
    elevation: 4.0,
  ),
);

final outlinedButtonStyle = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: const Color.fromARGB(255, 31, 137, 21),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    side: const BorderSide(color: Colors.red, width: 1),
    padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
    textStyle: const TextStyle(
      fontSize: 16.0,
    ),
  ),
);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: ColorUtils.buttonColor.withOpacity(0.7),width: 0.9),
  ),
  labelStyle: TextStyleUtils.bodySmall.copyWith(color: ColorUtils.buttonColor),
    hintStyle: TextStyleUtils.bodySmall.copyWith(fontSize: 16),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: ColorUtils.buttonColor.withOpacity(0.7),width: 0.9),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: ColorUtils.buttonColor, width: 0.9),
  ),
);

final pixelFieldDefaultTheme = ThemeData(
  appBarTheme: appBarTheme,
  iconTheme: iconTheme,
  inputDecorationTheme: inputDecorationTheme,
  cardColor: ColorUtils.cardColor,
  elevatedButtonTheme: elevationButtonStyle,
  outlinedButtonTheme: outlinedButtonStyle,
  buttonTheme: ButtonThemeData(
    buttonColor: ColorUtils.buttonColor,
  ),
  scaffoldBackgroundColor: ColorUtils.scaffoldBackgroundColor,
  timePickerTheme: const TimePickerThemeData(hourMinuteColor: Colors.white),
  textTheme: TextTheme(
    headlineSmall: headline4Theme,
    titleLarge: headline5Theme,
    titleMedium: TextStyleUtils.titleMedium,
    bodyMedium: TextStyleUtils.bodyMedium,
    bodySmall: TextStyleUtils.bodySmall,
    titleSmall: TextStyleUtils.titleSmall,
    bodyLarge: TextStyleUtils.bodyLarge,
  ),
);
