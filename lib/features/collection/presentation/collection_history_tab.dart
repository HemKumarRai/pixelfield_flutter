import 'package:flutter/material.dart';
import 'package:pixelfield/features/collection/domain/model/history_timeline_model.dart';
import 'package:pixelfield/features/collection/presentation/component/history_timeline_tile.dart';

class CollectionHistoryTab extends StatelessWidget {
  const CollectionHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HistoryTimeLineModel> items = [
      HistoryTimeLineModel(
        label: 'May 21',
        title: 'Title 2',
        description: 'Join a tribe of whiskey lovers. Share, sip, and explore.',
        attachments: ['url1', 'url2', 'url3'],
      ),
      HistoryTimeLineModel(
        label: 'Mar 29',
        title: 'Title 1',
        description: 'Unleash your inner wild ',
        attachments: ['url1', 'url2', 'url3'],
      ),
      HistoryTimeLineModel(
        label: 'Jan 1',
        title: 'Title 3',
        description: 'Description Line 1',
        attachments: ['url1', 'url2', 'url3'],
      ),
      HistoryTimeLineModel(
        label: 'Apr 4',
        title: 'Title 1',
        description: 'Description Line 1',
        attachments: ['url1', 'url2', 'url3'],
      )

    ];
    return ListView.builder(
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return HistoryTimelineTile(
            item: items[index], isLast: index == items.length - 1,index: index,);
      },
    );
  }
}
