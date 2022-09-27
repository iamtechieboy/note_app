import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// to avoid writing bunch of codes in different classes it was created
showCustomBottomSheet({
  required BuildContext context,
  required Widget body,
  ShapeBorder? shape,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    // shape: shape ??
    //     const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.vertical(
    //         top: Radius.circular(25.0),
    //       ),
    //     ),
    builder: (context) => body,
  );
}
