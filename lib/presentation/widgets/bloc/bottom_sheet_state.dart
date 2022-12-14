part of 'bottom_sheet_cubit.dart';

class BottomSheetInitialState {
  BottomSheetInitialState({
    this.selectedRepeatDays = const [],
    this.givenLabel = const [],
    this.lastHeight = 0,
    this.changeHeight = 150,
    this.repeatDay,
    this.lastEditTime = '',
    this.remindDay,
    this.remindTime,
    this.currentView = 0,
    this.isReminderOn = false,
    this.selectedRepeatDay = RepeatDay.once,
    this.isDismissible = true,
    this.colorIndex = 0,
  });

  List<String> selectedRepeatDays = [];
  List<String> givenLabel = [];
  double lastHeight;
  double changeHeight;
  String? repeatDay;
  String lastEditTime = '';
  DateTime? remindDay;
  DateTime? remindTime;
  int? currentView = 0;
  bool? isReminderOn = false;
  RepeatDay selectedRepeatDay = RepeatDay.once;
  bool? isDismissible = true;
  int colorIndex = 0;

  BottomSheetInitialState copyWith({
    List<String>? selectedRepeatDays,
    List<String>? givenLabel,
    double? lastHeight,
    double? changeHeight,
    String? repeatDay,
    String? lastEditTime,
    DateTime? remindDay,
    DateTime? remindTime,
    int? currentView,
    bool? isReminderOn,
    RepeatDay? selectedRepeatDay,
    bool? isDismissible,
    int? colorIndex,
  }) {
    return BottomSheetInitialState(
      selectedRepeatDays: selectedRepeatDays ?? this.selectedRepeatDays,
      givenLabel: givenLabel ?? this.givenLabel,
      lastHeight: lastHeight ?? this.lastHeight,
      changeHeight: changeHeight ?? this.changeHeight,
      repeatDay: repeatDay ?? this.repeatDay,
      lastEditTime: lastEditTime ?? this.lastEditTime,
      remindDay: remindDay ?? this.remindDay,
      remindTime: remindTime ?? this.remindTime,
      currentView: currentView ?? this.currentView,
      isReminderOn: isReminderOn ?? this.isReminderOn,
      selectedRepeatDay: selectedRepeatDay ?? this.selectedRepeatDay,
      isDismissible: isDismissible ?? this.isDismissible,
      colorIndex: colorIndex ?? this.colorIndex,
    );
  }
}
