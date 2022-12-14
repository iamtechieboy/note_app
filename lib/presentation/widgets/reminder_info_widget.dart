import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/local_data.dart';
import 'package:note_app/presentation/pages/interesting_idea/bloc/add_interesting_idea_cubit.dart';
import 'package:note_app/presentation/widgets/bloc/bottom_sheet_cubit.dart';
import 'package:note_app/presentation/widgets/label_item.dart';

import '../../config/constants/app_colors.dart';

class ReminderInfo extends StatelessWidget {
  const ReminderInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetCubit, BottomSheetInitialState>(
      builder: (context, state) {
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
            Visibility(
              visible: context
                  .watch<AddInterestingIdeaCubit>()
                  .state
                  .isReminderDateVis,
              child: Text(
                "Reminder set on ${dayFormatWithSlash.format(state.remindDay ?? DateTime.now())}, ${hourFormatFor.format(state.remindTime ?? DateTime.now())}",
                style: AppTextStyle.regular2Xs
                    .copyWith(color: AppColors.neutralColor.darkGrey),
              ),
            ),
            Visibility(
              visible:
                  context.watch<AddInterestingIdeaCubit>().state.isLabelVis,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 12,
                  runSpacing: 15,
                  children: [
                    ...List.generate(
                      state.givenLabel.length,
                      (index) => LabelItem(
                        onTap: (label) {
                          context.read<BottomSheetCubit>().removeLabel(label);
                        },
                        labelName: state.givenLabel[index],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
