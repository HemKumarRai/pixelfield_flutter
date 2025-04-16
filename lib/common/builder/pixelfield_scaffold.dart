import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pixelfield/common/builder/if_builder.dart';
import 'package:pixelfield/common/widgets/horizontantal_bottom_line.dart';
import 'package:pixelfield/utils/images/images_utils.dart';

class PixelFieldScaffold extends StatelessWidget {
  final Widget body;
  final bool bgImageRequired;
  final PreferredSizeWidget? appBar;
  final String? bgImagePath;

  const PixelFieldScaffold(
      {super.key,
      required this.body,
      this.bgImageRequired = true,
      this.appBar,
        this.bgImagePath,
      });

  @override
  Widget build(BuildContext context) {
    Widget bgImage = Image.asset(
    bgImagePath??  ImagesUtils.scaffoldBGImage,
      fit: BoxFit.fill,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
    Widget hLine = const HorizontalBottomLine();
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            IfBuilder(
                condition: bgImageRequired,
                builder: (context) => Positioned(child: bgImage)),
            SizedBox(
                height: double.infinity, width: double.infinity, child: body),
            IfBuilder(
              builder: (context) {
                return Positioned(bottom: 0, child: hLine);
              }, condition: Platform.isAndroid,
            )
          ],
        ),
      ),
    );
  }
}
