import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import 'bloc/bottom_sheet_cubit.dart';

Widget extrasSetRemindDaySession() {
  return BlocBuilder<BottomSheetCubit, BottomSheetInitialState>(
    builder: (context, state) {
      return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Divider
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Divider(
                color: AppColors.neutralColor.lightGrey,
                thickness: 1,
                height: 1,
              ),
            ),
            // Extra menus label
            DatePickerWidget(
              dateFormat: "dd-MMM-yyyy",
              initialDateTime: DateTime.now(),
              pickerTheme: DateTimePickerTheme(
                itemTextStyle: AppTextStyle.mediumXl
                    .copyWith(color: AppColors.primaryColor.base),
                pickerHeight: 160,
                itemHeight: 60,
              ),
              onChange: (selectedDate, changeList) {
                context.read<BottomSheetCubit>().setRemindDay(selectedDate);
              },
            )
          ],
        ),
      );
    },
  );
}

Widget extrasSetRemindTimeSession() {
  return BlocBuilder<BottomSheetCubit, BottomSheetInitialState>(
      builder: (context, state) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Divider
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Divider(
              color: AppColors.neutralColor.lightGrey,
              thickness: 1,
              height: 1,
            ),
          ),
          // Extra menus label
          TimePickerWidget(
            dateFormat: "HH:mm",
            initDateTime: DateTime.now(),
            pickerTheme: DateTimePickerTheme(
              itemTextStyle: AppTextStyle.mediumXl
                  .copyWith(color: AppColors.primaryColor.base),
              pickerHeight: 160,
              itemHeight: 60,
            ),
            onChange: (selectedTime, changeList) {
              context.read<BottomSheetCubit>().setRemindTime(selectedTime);
            },
          )
        ],
      ),
    );
  });
}
