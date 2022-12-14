import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utils/hive_util.dart';
import 'package:note_app/data/models/interesting_idea_model.dart';

import '../../../../config/constants/hive_boxes.dart';

part 'add_interesting_idea_state.dart';

class AddInterestingIdeaCubit extends Cubit<AddInterestingIdeaState> with HiveUtil {
  AddInterestingIdeaCubit() : super(AddInterestingIdeaState());

  Future reminderDateVis(bool isVisible) async {
    emit(state.copyWith(isReminderDateVis: isVisible));
  }

  Future givenLabelVis(bool isVisible) async {
    emit(state.copyWith(isLabelVis: isVisible));
  }

  Future pinNote(bool isPinned) async {
    emit(state.copyWith(isPinned: isPinned));
  }

  Future addNewItemToTheList(
    InterestingIdeaModel ideaModel,
  ) async {
    addBox<InterestingIdeaModel>(interestingBox, ideaModel);
    state.interestingIdeaList.add(ideaModel);
    emit(state.copyWith(interestingIdeaList: state.interestingIdeaList));
  }

  Future update(InterestingIdeaModel model, dynamic key, int index) async {
    state.interestingIdeaList[index] = model;
    saveBox<InterestingIdeaModel>(interestingBox, model, key: key);
  }

  Future deleteNote(InterestingIdeaModel model, dynamic key) async {
    state.interestingIdeaList.remove(model);
    emit(state.copyWith(interestingIdeaList: state.interestingIdeaList, isDeleted: true));
    deleteBoxKey<InterestingIdeaModel>(interestingBox, key);
  }

  Future pinNoteSave(dynamic key, int index, bool isPinned) async {
    state.interestingIdeaList[index].isPinned = isPinned;
    saveBox<InterestingIdeaModel>(interestingBox, state.interestingIdeaList[index], key: key);
    emit(state.copyWith(interestingIdeaList: state.interestingIdeaList));
  }

  Future getAllFromHive() async {
    getBoxAllValue<InterestingIdeaModel>(interestingBox).then(
      (value) {
        emit(state.copyWith(interestingIdeaList: value));
      },
    );
  }
}
