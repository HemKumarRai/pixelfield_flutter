import 'package:flutter/material.dart';
import 'package:pixelfield/features/collection/domain/model/history_timeline_model.dart';
import 'package:pixelfield/features/collection/presentation/component/vertical_time_line.dart';
import 'package:pixelfield/utils/colors/colors.dart';
import 'package:pixelfield/utils/images/images_utils.dart';

class HistoryTimelineTile extends StatelessWidget {
  final HistoryTimeLineModel item;
  final bool isLast;
  final int index;

  const HistoryTimelineTile(
      {super.key, required this.item, required this.isLast, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      padding: EdgeInsets.only(left: 16, right: 16, bottom: isLast ? 16 : 0),
      color: ColorUtils.scaffoldBackgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalTimeLine(
            index: index,
            isLast: isLast,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 16, start: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8),
                  Text(item.title,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: ColorUtils.greyScale1Color)),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 16, color: ColorUtils.greyScale1Color),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 104,
                    width: double.infinity,
                    color: ColorUtils.darkCardColor,
                    padding: const EdgeInsetsDirectional.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(ImagesUtils.attachmentImage),
                            const SizedBox(
                              width: 8,
                            ),
                            Text('Attachments',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: ColorUtils.greyScale1Color)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: item.attachments.map((attachment) {
                            return Card(
                              elevation: 4,
                              margin: const EdgeInsetsDirectional.only(end: 8),
                              color: ColorUtils.attachmentColor,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              child: const SizedBox(
                                width: 64,
                                height: 64,
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
