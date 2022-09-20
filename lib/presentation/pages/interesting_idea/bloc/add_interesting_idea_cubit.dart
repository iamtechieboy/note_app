import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_interesting_idea_state.dart';

class AddInterestingIdeaCubit extends Cubit<AddInterestingIdeaState> {
  AddInterestingIdeaCubit() : super(AddInterestingIdeaState());

  Future changeBackgroundColor(int index) async {
    emit(state.copyWith(selectedColorIndex: index));
  }
}
