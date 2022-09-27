import 'package:flutter/material.dart';
import 'package:note_app/presentation/components/text_with_switch.dart';

class NotificationBottomSheetMenu extends StatefulWidget {
  const NotificationBottomSheetMenu({super.key});

  @override
  State<NotificationBottomSheetMenu> createState() =>
      _SettingsBottomSheetBodyState();
}

class _SettingsBottomSheetBodyState extends State<NotificationBottomSheetMenu> {
  bool isEmailChecked = true;
  bool isPushChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWithSwitch(
          value: isEmailChecked,
          label: "Email Notifications",
          onChanged: (value) => setState(() {
            isEmailChecked = value;
          }),
        ),
        TextWithSwitch(
          value: isPushChecked,
          label: "Push Notifications",
          onChanged: (value) => setState(() {
            isPushChecked = value;
          }),
        ),
      ],
    );
  }
}
