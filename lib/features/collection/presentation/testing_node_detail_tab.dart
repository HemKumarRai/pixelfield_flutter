import 'package:flutter/material.dart';
import 'package:pixelfield/common/widgets/video_player.dart';
import 'package:pixelfield/features/collection/domain/model/testing_notes_model.dart';
import 'package:pixelfield/features/collection/presentation/component/testing_notes_list_view.dart';
import 'package:pixelfield/utils/colors/colors.dart';

class TestingNodeDetailTab extends StatelessWidget {
  const TestingNodeDetailTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TestingNotesModel> list = [
      TestingNotesModel(
          topic: "Nose",
          description:
          "Discover rare blends and bold spirits made for the untamed soul."),
      TestingNotesModel(
          topic: "Palate",
          description:
          "Track your favorite whiskeys, rate them, and explore new legends.Unleash your inner wild with curated whiskey experiences."),
      TestingNotesModel(
          topic: "Finish",
          description:
          "From smooth sips to smoky kicks — find your perfect pour.Join a tribe of whiskey lovers. Share, sip, and explore."),
    ];
    final List<TestingNotesModel> myNotes = [
      TestingNotesModel(
          topic: "My Nose",
          description:
          "Discover rare blends and bold spirits made for the untamed soul."),
      TestingNotesModel(
          topic: "My Palate",
          description:
          "Track your favorite whiskeys, rate them, and explore new legends.Unleash your inner wild with curated whiskey experiences."),
      TestingNotesModel(
          topic: "My Finish",
          description:
          "From smooth sips to smoky kicks — find your perfect pour.Join a tribe of whiskey lovers. Share, sip, and explore."),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomVideoPlayer(),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Tasting notes",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: ColorUtils.greyScale1Color),
        ),
        Text(
          "by Charles MacLean MBE",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: ColorUtils.greyScale2Color, fontSize: 16),
        ),
        const SizedBox(
          height: 12,
        ),
         TestingNotesListView(list: list,),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Your Notes",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ColorUtils.greyScale1Color),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_backspace_rounded))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TestingNotesListView(list: myNotes,),
      ],
    );
  }
}
