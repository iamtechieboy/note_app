part of 'add_interesting_idea_cubit.dart';

class AddInterestingIdeaState {
  AddInterestingIdeaState({
    this.interestingIdeaList = const [],
    this.isReminderDateVis = false,
    this.isLabelVis = false,
    this.isDeleted = false,
    this.isPinned = false,
  });

  List<InterestingIdeaModel> interestingIdeaList;
  bool isReminderDateVis = false;
  bool isLabelVis = false;
  bool isDeleted = false;
  bool isPinned;

  AddInterestingIdeaState copyWith(
      {List<InterestingIdeaModel>? interestingIdeaList,
      bool? isReminderDateVis,
      bool? isLabelVis,
      bool? isDeleted,
      bool? isPinned}) {
    return AddInterestingIdeaState(
        interestingIdeaList: interestingIdeaList ?? this.interestingIdeaList,
        isReminderDateVis: isReminderDateVis ?? this.isReminderDateVis,
        isLabelVis: isLabelVis ?? this.isLabelVis,
        isDeleted: isDeleted ?? this.isDeleted,
        isPinned: isPinned ?? this.isPinned);
  }
}
