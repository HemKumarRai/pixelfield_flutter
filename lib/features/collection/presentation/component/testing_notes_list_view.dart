import 'package:flutter/cupertino.dart';
import 'package:pixelfield/features/collection/domain/model/testing_notes_model.dart';
import 'package:pixelfield/features/collection/presentation/component/testing_note_card.dart';

class TestingNotesListView extends StatelessWidget {
    final List<TestingNotesModel> list;
  const TestingNotesListView({super.key,required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) => TestingNoteCard(
              testingNotesModel: list[index],
            ));
  }
}
