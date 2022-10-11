import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/domain/entities/enums.dart';
import 'package:note_app/core/utils/sort_week_days.dart';

part 'bottom_sheet_state.dart';

class BottomSheetCubit extends Cubit<BottomSheetInitialState> {
  BottomSheetCubit() : super(BottomSheetInitialState());

  Future setLastHeight(double height) async {
    emit(state.copyWith(lastHeight: height));
  }

  Future changeCurrentView(int currentView) async {
    int newView = currentView;
    currentView == 5
        ? newView = 4
        : currentView == 1
            ? newView--
            : newView = 1;
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
      emit(
          state.copyWith(selectedRepeatDay: repeatDay, selectedRepeatDays: []));
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
