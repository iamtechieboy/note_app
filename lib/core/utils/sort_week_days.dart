import 'package:note_app/core/domain/entities/enums.dart';

import '../../config/constants/local_data.dart';

String sortWeekDays({
  List<String>? list,
  RepeatDay anotherOption = RepeatDay.custom,
  bool isReminderOn = false
}) {
  if(!isReminderOn) return "Not set";
  switch (anotherOption) {
    case RepeatDay.once:
      return "Once";
    case RepeatDay.daily:
      return "Daily";
    case RepeatDay.monToFri:
      return "Monday to Friday";
    case RepeatDay.satSun:
      return "Saturday & Sunday";
    case RepeatDay.custom:
      {
        List<String> sorted = [];
        if (list!.isEmpty) return "Not set";
        if (list.length == 7) {
          return "Every day";
        } else {
          for (var e in weekDaysShort) {
            if (list.contains(e)) {
              sorted.add(e);
            }
          }
        }
        return sorted.join(" ").toString();
      }
  }
}

String sortWeekDaysForCustom({
  List<String>? list,
  RepeatDay anotherOption = RepeatDay.custom,
}) {
  if (anotherOption == RepeatDay.custom) {
    List<String> sorted = [];
    if (list!.isEmpty) return "Not set";
    if (list.length == 7) {
      return "Every day";
    } else {
      for (var e in weekDaysShort) {
        if (list.contains(e)) {
          sorted.add(e);
        }
      }
    }
    return sorted.join(" ").toString();
  } else {
    return "Not set";
  }
}
