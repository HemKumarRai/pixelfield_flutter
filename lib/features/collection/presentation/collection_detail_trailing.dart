import 'package:flutter/material.dart';
import 'package:pixelfield/common/widgets/custom_button.dart';
import 'package:pixelfield/common/widgets/custom_tab_bar.dart';
import 'package:pixelfield/features/collection/presentation/collection_history_tab.dart';
import 'package:pixelfield/features/collection/presentation/testing_node_detail_tab.dart';
import 'package:pixelfield/utils/colors/colors.dart';

import 'collection_detail_tab.dart';

class CollectionDetailTrailing extends StatelessWidget {
  const CollectionDetailTrailing({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bottle 135/184',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorUtils.greyScale2Color),
          ),
          RichText(
            text: TextSpan(
                text: "Talisker",
                children: [
                  TextSpan(
                      text: " 18 Year old",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: ColorUtils.buttonColor))
                ],
                style: Theme.of(context).textTheme.titleMedium),
          ),
          Text("#2504", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 24,
          ),
          CustomTabs(
            tabs: const ["Details", "Testing Node", "History"],
            indexedView: [
              CollectionDetailsTab(
                key: UniqueKey(),
              ),
              TestingNodeDetailTab(
                key: UniqueKey(),
              ),
              const CollectionHistoryTab()
            ],
          ),
          const SizedBox(height: 24,),
          CustomButton(message: "Add my collection", onButtonClick: (){},leadingIcon:  Icon(Icons.add,color: ColorUtils.buttonTextColor,),),
          const SizedBox(height: 24,),

        ],
      ),
    );
  }
}

