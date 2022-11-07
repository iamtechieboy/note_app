import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_text_style.dart';

import '../../config/constants/app_colors.dart';

class ReminderInfo extends StatelessWidget {
  const ReminderInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Divider(
            color: AppColors.neutralColor.lightGrey,
            thickness: 1,
            height: 1,
          ),
        ),
        Text(
          "Reminder set on 10/31/2022, 12:20",
          style: AppTextStyle.regular2Xs
              .copyWith(color: AppColors.neutralColor.darkGrey),
        ),
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
      ],
    );
  }
}
