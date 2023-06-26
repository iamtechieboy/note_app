import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/domain/entities/enums.dart';

import '../../interesting_idea/data/models/interesting_idea_model.dart';
import '../../interesting_idea/presentation/bloc/add_interesting_idea_cubit.dart';

part 'bottom_sheet_state.dart';

class BottomSheetCubit extends Cubit<BottomSheetInitialState> {
  BottomSheetCubit() : super(BottomSheetInitialState());

  Future setLastHeight(double height) async {
    emit(state.copyWith(lastHeight: height));
  }

  Future cleanBottomSheet() async {
    state.remindDay = null;
    state.remindTime = null;
    emit(state.copyWith(
      remindTime: null,
      remindDay: null,
      selectedRepeatDays: const [],
      givenLabel: const [],
      lastHeight: 0,
      lastEditTime: '',
      changeHeight: 150,
      repeatDay: '',
      currentView: 0,
      isReminderOn: false,
      selectedRepeatDay: RepeatDay.once,
      isDismissible: true,
      colorIndex: 0,
    ));
  }

  Future fillBottomSheetToEdit(InterestingIdeaModel model, BuildContext context) async {
    state.remindDay = model.remindedDay!.isNotEmpty ? DateTime.parse(model.remindedDay!) : null;
    state.remindTime = model.remindedTime!.isNotEmpty ? DateTime.parse(model.remindedTime!) : null;
    context.read<AddInterestingIdeaCubit>().pinNote(model.isPinned ?? false);
    emit(state.copyWith(
      colorIndex: model.itemColor,
      givenLabel: model.labels,
      isReminderOn: model.remindedTime!.isNotEmpty ? true : false,
      lastEditTime: model.lastEditedTime,
    ));
    changeVisibility(context);
  }

  Future changeBgColor(int colorIndex) async {
    emit(state.copyWith(colorIndex: colorIndex));
  }

  Future changeVisibility(BuildContext context) async {
    var stateAdd = context.read<AddInterestingIdeaCubit>();
    if (state.remindDay != null) {
      stateAdd.reminderDateVis(true);
    } else {
      stateAdd.reminderDateVis(false);
    }
    if (state.givenLabel.isNotEmpty) {
      stateAdd.givenLabelVis(true);
    } else {
      stateAdd.givenLabelVis(false);
    }
  }

  Future addLabel(String labelName) async {
    var labels = [...state.givenLabel];
    labels.add(labelName.replaceAll("\n", ""));
    emit(state.copyWith(givenLabel: labels));
  }

  Future removeLabel(String labelName) async {
    var labels = [...state.givenLabel];
    labels.remove(labelName);
    if (labels.isEmpty) changeSize(0);
    emit(state.copyWith(givenLabel: labels));
  }

  Future changeSize(double newHeight) async {
    double height = newHeight == 0 ? 150 : 166;
    emit(state.copyWith(changeHeight: height + newHeight));
  }

  Future clearLabelList() async {
    changeSize(0);
    emit(state.copyWith(givenLabel: []));
  }

  Future changeCurrentView(int currentView) async {
    int newView = currentView;
    currentView == 6
        ? newView = 0
        : currentView == 5
            ? newView = 4
            : currentView == 1
                ? newView--
                : newView = 1;
    if (currentView == 2 && state.remindDay == null) {
      emit(state.copyWith(remindDay: DateTime.now()));
    }
    if (currentView == 3 && state.remindTime == null) {
      emit(state.copyWith(remindTime: DateTime.now()));
    }
    if (newView == 0) {
      emit(state.copyWith(currentView: newView, isDismissible: true));
    } else {
      emit(state.copyWith(currentView: newView, isDismissible: false));
    }
  }

  Future navigateTo(int nextView) async {
    emit(state.copyWith(currentView: nextView, isDismissible: false));
  }

  Future changeReminderSwitchValue(bool value) async {
    if (!value) {
      // TODO: have to think about changing that situation
      state.remindTime = null;
      state.remindDay = null;
      state.selectedRepeatDays = [];
      state.selectedRepeatDay = RepeatDay.once;
    }
    emit(state.copyWith(isReminderOn: value));
  }

  Future setRemindDay(DateTime? remindDay) async {
    emit(state.copyWith(remindDay: remindDay));
  }

  Future setRemindTime(DateTime? remindTime) async {
    emit(state.copyWith(remindTime: remindTime));
  }

  Future setRepeatDayIndex(RepeatDay repeatDay) async {
    if (repeatDay != RepeatDay.custom) {
      emit(state.copyWith(selectedRepeatDay: repeatDay, selectedRepeatDays: []));
    } else {
      emit(state.copyWith(selectedRepeatDay: repeatDay));
    }
  }

  Future addAndRemoveRepeatDay(String weekDay) async {
    final weekDays = [...state.selectedRepeatDays];
    if (weekDays.contains(weekDay)) {
      weekDays.remove(weekDay);
    } else {
      weekDays.add(weekDay);
    }
    emit(state.copyWith(selectedRepeatDays: weekDays));
  }
}
