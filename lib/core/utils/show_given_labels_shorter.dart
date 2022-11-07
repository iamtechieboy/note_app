String showGivenLabelsShorter(List<String> givenLabel) {
  List<String> shortedList = [];
  for (var e in givenLabel) {
    if (e.length > 3) {
      shortedList.add(e.substring(0, 4));
    } else {
      shortedList.add(e.toString());
    }
  }
  return shortedList.toString().replaceAll("[", "").replaceAll("]", "");
}
