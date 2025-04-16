import 'package:flutter/material.dart';
import 'package:pixelfield/features/collection/domain/model/detail_key_value_model.dart';
import 'package:pixelfield/utils/colors/colors.dart';

class CollectionDetailsTab extends StatelessWidget {
  const CollectionDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DetailKeyValueModel> list = [
      DetailKeyValueModel(key: "Distillery", value: "Text"),
      DetailKeyValueModel(key: "Region", value: "Text"),
      DetailKeyValueModel(key: "Country", value: "Text"),
      DetailKeyValueModel(key: "Type", value: "Text"),
      DetailKeyValueModel(key: "Age statement", value: "Text"),
      DetailKeyValueModel(key: "Filled", value: "Text"),
      DetailKeyValueModel(key: "Bottled", value: "Text"),
      DetailKeyValueModel(key: "Cask number", value: "Text"),
      DetailKeyValueModel(key: "ABV", value: "Text"),
      DetailKeyValueModel(key: "Size", value: "Text"),
      DetailKeyValueModel(key: "Finish", value: "Text"),
    ];
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  list[index].key,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 16,height: 2),
                ),
                Text(
                  list[index].value,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 16, color: ColorUtils.greyScale2Color,height: 1.6),
                ),
              ],
            ));
  }
}
