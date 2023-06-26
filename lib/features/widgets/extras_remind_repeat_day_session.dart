import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/local_data.dart';
import '../../core/domain/entities/enums.dart';
import '../../core/utils/sort_week_days.dart';
import '../components/check_with_text.dart';
import '../components/checkbox_with_textview.dart';
import 'bloc/bottom_sheet_cubit.dart';

Widget extrasSetRepeatDaysSession() {
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
          CheckWithText(
              isSelected: state.selectedRepeatDay == RepeatDay.once,
              label: "Once",
              onSelected: () {
                context
                    .read<BottomSheetCubit>()
                    .setRepeatDayIndex(RepeatDay.once);
              }),
          CheckWithText(
              isSelected: state.selectedRepeatDay == RepeatDay.daily,
              label: "Daily",
              onSelected: () {
                context
                    .read<BottomSheetCubit>()
                    .setRepeatDayIndex(RepeatDay.daily);
              }),
          CheckWithText(
            isSelected: state.selectedRepeatDay == RepeatDay.monToFri,
            label: "Monday to Friday",
            onSelected: () {
              context
                  .read<BottomSheetCubit>()
                  .setRepeatDayIndex(RepeatDay.monToFri);
            },
          ),
          CheckWithText(
            isSelected: state.selectedRepeatDay == RepeatDay.satSun,
            label: "Saturday & Sunday",
            onSelected: () {
              context
                  .read<BottomSheetCubit>()
                  .setRepeatDayIndex(RepeatDay.satSun);
            },
          ),
          CheckWithText(
            isSelected: state.selectedRepeatDay == RepeatDay.custom,
            label: "Custom",
            onSelected: () {
              context
                  .read<BottomSheetCubit>()
                  .setRepeatDayIndex(RepeatDay.custom);
              context.read<BottomSheetCubit>().navigateTo(5);
            },
            additionalText: sortWeekDaysForCustom(
                list: state.selectedRepeatDays
                    .map((e) => (e).substring(0, 3))
                    .toList(),
                anotherOption: state.selectedRepeatDay),
          ),
        ],
      ),
    );
  });
}

Widget extrasSetCustomRepeatDays() {
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
            ...weekDays.map(
              (e) => CheckBoxWithTextView(
                  isChecked: state.selectedRepeatDays.contains(e),
                  label: e,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  onTap: (week) => context
                      .read<BottomSheetCubit>()
                      .addAndRemoveRepeatDay(week)),
            ),
          ],
        ),
      );
    },
  );
}
