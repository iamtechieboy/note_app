import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/presentation/widgets/bloc/bottom_sheet_cubit.dart';

// to avoid writing bunch of codes in different classes it was created
Future<T> showCustomBottomSheet<T>({
  required BuildContext context,
  required Widget body,
  ShapeBorder? shape,
  bool isDismissible = true,
}) async {
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    isDismissible: isDismissible,
    // shape: shape ??
    //     const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.vertical(
    //         top: Radius.circular(25.0),
    //       ),
    //     ),
    builder: (context) => Wrap(
      children: <Widget>[body],
    ),
  );
}
