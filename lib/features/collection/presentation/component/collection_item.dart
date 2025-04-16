import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixelfield/common/animation/animated_inkwell.dart';
import 'package:pixelfield/common/builder/custom_page_route_builder.dart';
import 'package:pixelfield/features/collection/domain/model/collection_model.dart';
import 'package:pixelfield/features/collection/presentation/item_detail_screen.dart';
import 'package:pixelfield/utils/colors/colors.dart';
import 'package:pixelfield/utils/images/images_utils.dart';

class CollectionItemView extends StatelessWidget {
  final Collection collection;

  const CollectionItemView({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return AnimatedInkWell(
      onTap: () {
        Navigator.push(
          context,
          SlideLeftRoute(widget: const ItemDetailScreen()),
        );
      },
      child: Card(
        color: Theme.of(context).cardColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: CachedNetworkImage(
                    height: 184,
                imageUrl: collection.imageUrl ?? '',
                placeholder: (context,_)=>Image.asset(ImagesUtils.liquidImage),
                errorWidget: (context, a, _) =>
                    Image.asset(ImagesUtils.liquidImage),
              )),
              const SizedBox(
                height: 25,
              ),
              Text(
                collection.name ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                collection.license ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                collection.tag ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ColorUtils.greyTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
