part of 'bottom_sheet_cubit.dart';

class BottomSheetInitialState {
  BottomSheetInitialState({
    this.selectedRepeatDays = const [],
    this.givenLabel = const [],
    this.lastHeight = 0,
    this.changeHeight = 150,
    this.repeatDay,
    this.remindDay,
    this.remindTime,
    this.currentView = 0,
    this.isReminderOn = false,
    this.selectedRepeatDay = RepeatDay.once,
    this.isDismissible = true,
  });

  List<String> selectedRepeatDays = [];
  List<String> givenLabel = [];
  double lastHeight;
  double changeHeight;
  String? repeatDay;
  DateTime? remindDay;
  DateTime? remindTime;
  int? currentView = 0;
  bool? isReminderOn = false;
  RepeatDay selectedRepeatDay = RepeatDay.once;
  bool? isDismissible = true;

  BottomSheetInitialState copyWith({
    List<String>? selectedRepeatDays,
    List<String>? givenLabel,
    double? lastHeight,
    double? changeHeight,
    String? repeatDay,
    DateTime? remindDay,
    DateTime? remindTime,
    int? currentView,
    bool? isReminderOn,
    RepeatDay? selectedRepeatDay,
    bool? isDismissible,
  }) {
    return BottomSheetInitialState(
      selectedRepeatDays: selectedRepeatDays ?? this.selectedRepeatDays,
      givenLabel: givenLabel ?? this.givenLabel,
      lastHeight: lastHeight ?? this.lastHeight,
      changeHeight: changeHeight ?? this.changeHeight,
      repeatDay: repeatDay ?? this.repeatDay,
      remindDay: remindDay ?? this.remindDay,
      remindTime: remindTime ?? this.remindTime,
      currentView: currentView ?? this.currentView,
      isReminderOn: isReminderOn ?? this.isReminderOn,
      selectedRepeatDay: selectedRepeatDay ?? this.selectedRepeatDay,
      isDismissible: isDismissible ?? this.isDismissible,
    );
  }
}
