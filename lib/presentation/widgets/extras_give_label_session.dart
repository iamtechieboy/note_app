import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/presentation/components/textfield_with_label.dart';
import 'package:note_app/presentation/widgets/bloc/bottom_sheet_cubit.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';

Widget extrasGiveLabelSession(TextEditingController controller) {
  return BlocBuilder<BottomSheetCubit, BottomSheetInitialState>(
    builder: (context, state) {
      return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Divider(
                  color: AppColors.neutralColor.lightGrey,
                  thickness: 1,
                  height: 1,
                ),
              ),
              TextFieldWithLabel(
                  label: "Label Name",
                  hintText: "Example: Important, etc.",
                  keyboardInputType: TextInputType.text,
                  controller: controller),
              Text(
                "Press “Enter” on keyboard to create another label.",
                style: AppTextStyle.regular2Xs.copyWith(
                  color: AppColors.neutralColor.baseGrey,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
