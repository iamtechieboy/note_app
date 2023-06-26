import 'package:flutter/material.dart';

// to avoid writing bunch of codes in different classes it was created
Future<T> showCustomBottomSheet<T>({
  required BuildContext context,
  required Widget body,
  bool isDismissible = true,
}) async {
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    isDismissible: isDismissible,
    builder: (context) => Wrap(
      children: <Widget>[body],
    ),
  );
}
