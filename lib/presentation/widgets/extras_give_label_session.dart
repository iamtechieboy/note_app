import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_size/measure_size.dart';
import 'package:note_app/config/constants/app_decoration.dart';
import 'package:note_app/presentation/components/iconic_oval_button.dart';
import 'package:note_app/presentation/components/textfield_with_label.dart';
import 'package:note_app/presentation/widgets/bloc/bottom_sheet_cubit.dart';
import 'package:note_app/presentation/widgets/label_item.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import '../../config/constants/assets.dart';

Widget extrasGiveLabelSession(TextEditingController controller) {
  return BlocBuilder<BottomSheetCubit, BottomSheetInitialState>(
    builder: (context, state) {
      return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  keyboardInputType: TextInputType.multiline,
                  controller: controller),
              Text(
                "Press “Enter” on keyboard to create another label.",
                style: AppTextStyle.regular2Xs.copyWith(
                  color: AppColors.neutralColor.baseGrey,
                ),
              ),
              Visibility(
                visible: state.givenLabel.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: MeasureSize(
                    onChange: (size) {
                      context
                          .read<BottomSheetCubit>()
                          .changeSize(size.height);
                      debugPrint("Height: ${size.height}");
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 12,
                          runSpacing: 15,
                          children: [
                            ...List.generate(
                              state.givenLabel.length,
                              (index) => LabelItem(
                                onTap: (label) {
                                  context
                                      .read<BottomSheetCubit>()
                                      .removeLabel(label);
                                },
                                labelName: state.givenLabel[index],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Divider(
                            color: AppColors.neutralColor.lightGrey,
                            thickness: 1,
                            height: 1,
                          ),
                        ),
                        IconicOvalButton(
                          height: 38,
                          text: "Clear All",
                          icon: Assets.icons.delete,
                          onTap: () {
                            context.read<BottomSheetCubit>().clearLabelList();
                          },
                          isWidthMax: false,
                          boxDecoration: AppDecoration.outline,
                          iconColor: AppColors.primaryColor.base,
                          textColor: AppColors.primaryColor.base,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
