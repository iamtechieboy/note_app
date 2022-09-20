part of 'add_interesting_idea_cubit.dart';

class AddInterestingIdeaState {
  AddInterestingIdeaState({this.selectedColorIndex = 0});

  int selectedColorIndex = 0;

  AddInterestingIdeaState copyWith({int? selectedColorIndex}) {
    return AddInterestingIdeaState(
      selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
    );
  }

}
