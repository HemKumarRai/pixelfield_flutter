import 'package:flutter/material.dart';
import 'package:pixelfield/common/animation/animated_inkwell.dart';
import 'package:pixelfield/common/builder/pixelfield_scaffold.dart';
import 'package:pixelfield/features/collection/presentation/collection_detail_trailing.dart';
import 'package:pixelfield/features/collection/presentation/component/drop_view.dart';
import 'package:pixelfield/utils/dimension/dimension_utils.dart';
import 'package:pixelfield/utils/images/images_utils.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelFieldScaffold(
        // bgImagePath: ImagesUtils.itemDetailImage,
        body: ListView(
      padding: EdgeInsets.only(
          left: DimensionUtils.kHorizontalPadding,
          top: 22,
          right: DimensionUtils.kHorizontalPadding),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 12, vertical: 6),
              color: Theme.of(context).cardColor,
              child: Text(
                "Genesis Collection",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            CircleAvatar(
              backgroundColor: Theme.of(context).cardColor,
              radius: 24,
              child: AnimatedInkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(ImagesUtils.xImage)),
            )
          ],
        ),
        const SizedBox(
          height: 28,
        ),
        const DropView(),
        const SizedBox(
          height: 52,
        ),
        Image.asset(
          ImagesUtils.bigLiquidImage,
          height: 411,
        ),
        const SizedBox(
          height: 39,
        ),
       const CollectionDetailTrailing()
      ],
    ));
  }
}
