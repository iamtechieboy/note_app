import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/local_data.dart';
import '../../core/utils/sort_week_days.dart';
import '../components/extras_menu_button.dart';
import '../components/text_with_switch.dart';
import 'bloc/bottom_sheet_cubit.dart';

Widget extrasSetReminderSession() {
  return BlocBuilder<BottomSheetCubit, BottomSheetInitialState>(
    builder: (context, state) {
      return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Divider
            Padding(
              padding: const EdgeInsets.all(16),
              child: Divider(
                color: AppColors.neutralColor.lightGrey,
                thickness: 1,
                height: 1,
              ),
            ),
            // Extra menus label
            TextWithSwitch(
                value: context.watch<BottomSheetCubit>().state.isReminderOn!,
                label: "Reminder",
                onChanged: (value) {
                  context.read<BottomSheetCubit>().changeReminderSwitchValue(value);
                }),
            // Set Reminder
            ExtrasMenuButton(
              enable: state.isReminderOn!,
              menuTitle: "Date",
              label: state.remindDay != null && state.isReminderOn!
                  ? dayFormatForModal.format(state.remindDay!).toString()
                  : "Not set",
              isArrowVisible: true,
              onTap: () {
                context.read<BottomSheetCubit>().navigateTo(2);
              },
            ),
            ExtrasMenuButton(
              enable: state.isReminderOn!,
              menuTitle: "Time",
              label: state.remindTime != null && state.isReminderOn!
                  ? hourFormatFor.format(state.remindTime!).toString()
                  : "Not set",
              isArrowVisible: true,
              onTap: () {
                context.read<BottomSheetCubit>().navigateTo(3);
              },
            ),
            ExtrasMenuButton(
              enable: state.isReminderOn!,
              menuTitle: "Repeat",
              label: sortWeekDays(
                  list: state.selectedRepeatDays.map((e) => (e).substring(0, 3)).toList(),
                  anotherOption: state.selectedRepeatDay,
                  isReminderOn: state.isReminderOn!),
              isArrowVisible: true,
              onTap: () {
                context.read<BottomSheetCubit>().navigateTo(4);
              },
            ),
          ],
        ),
      );
    },
  );
}
