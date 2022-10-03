import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utils/hive_util.dart';
import 'package:note_app/data/models/interesting_idea_model.dart';

import '../../../../config/constants/hive_boxes.dart';

part 'add_interesting_idea_state.dart';

class AddInterestingIdeaCubit extends Cubit<AddInterestingIdeaState>
    with HiveUtil {
  AddInterestingIdeaCubit() : super(AddInterestingIdeaState());

  Future changeBackgroundColor(int index) async {
    emit(state.copyWith(selectedColorIndex: index));
  }

  Future addNewItemToTheList(InterestingIdeaModel ideaModel) async {
    addBox<InterestingIdeaModel>(interestingBox, ideaModel);
    state.interestingIdeaList.add(ideaModel);
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
