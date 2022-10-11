import 'package:intl/intl.dart';

List weekDays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

List weekDaysShort = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

// bottom sheet bodies heights to show animation with changing heights
List<Map<String, double>> heightsBottomSheet = [
  {"": 362},
  {"Extras": 257},
  {"Set Reminder": 177},
  {"Set Reminder": 177},
  {"Set Reminder": 273},
  {"Repeat": 369},
];

/// for modal sheet with space
DateFormat dayFormatForModal = DateFormat("dd MMMM yyyy");

/// Day format with slash
DateFormat dayFormatWithSlash = DateFormat("dd/MM/yyyy");

/// [hourFormatFor] format HH:mm
DateFormat hourFormatFor = DateFormat("HH:mm");
