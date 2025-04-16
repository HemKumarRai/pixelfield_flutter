import 'package:flutter/material.dart';
import 'package:pixelfield/features/collection/domain/model/testing_notes_model.dart';
import 'package:pixelfield/utils/colors/colors.dart';

class TestingNoteCard extends StatelessWidget {
  final TestingNotesModel testingNotesModel;

  const TestingNoteCard({super.key, required this.testingNotesModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      margin: const EdgeInsets.only(bottom: 8),
      width: double.infinity,
      color: ColorUtils.darkBackgroundColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            testingNotesModel.topic,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 22, color: ColorUtils.greyScale1Color),
          ),
          Text(
            testingNotesModel.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 16, color: ColorUtils.greyScale1Color),

          ),
        ],
      ),
    );
  }
}
