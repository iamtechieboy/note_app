part of 'add_interesting_idea_cubit.dart';

class AddInterestingIdeaState {
  AddInterestingIdeaState(
      {this.selectedColorIndex = 0, this.interestingIdeaList = const [], });

  List<InterestingIdeaModel> interestingIdeaList;
  int selectedColorIndex = 0;

  AddInterestingIdeaState copyWith(
      {int? selectedColorIndex,
      List<InterestingIdeaModel>? interestingIdeaList}) {
    return AddInterestingIdeaState(
      selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
      interestingIdeaList: interestingIdeaList ?? this.interestingIdeaList,
    );
  }
}
