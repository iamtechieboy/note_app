import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/presentation/pages/interesting_idea/bloc/add_interesting_idea_cubit.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import '../../config/constants/assets.dart';
import '../components/extras_menu_button.dart';
import 'custom_color_picker.dart';

class ExtrasMenuBottomSheetBody extends StatefulWidget {
  const ExtrasMenuBottomSheetBody({Key? key}) : super(key: key);
  @override
  State<ExtrasMenuBottomSheetBody> createState() =>
      _ExtrasMenuBottomSheetBodyState();
}

class _ExtrasMenuBottomSheetBodyState extends State<ExtrasMenuBottomSheetBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        color: colorPickerList[context.watch<AddInterestingIdeaCubit>().state.selectedColorIndex],
      ),
      height: 475,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Close button for Bottom sheet
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.neutralColor.lightGrey),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      // Close that bottom sheet
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: SvgPicture.asset(
                        Assets.icons.close,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Change note background text
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: Text(
                "CHANGE BACKGROUND",
                style: AppTextStyle.regularXs
                    .copyWith(color: AppColors.neutralColor.darkGrey),
              ),
            ),
            // Color picker for that project
            CustomColorPicker(
              onSelectColor: (color) {
                // setState(() {
                //   _selectedColor = color;
                // });
              },
            ),
            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Divider(
                color: AppColors.neutralColor.lightGrey,
                thickness: 1,
                height: 1,
              ),
            ),
            // Extra menus label
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "EXTRAS",
                style: AppTextStyle.regularXs
                    .copyWith(color: AppColors.neutralColor.darkGrey),
              ),
            ),
            // Set Reminder
            ExtrasMenuButton(
              icon: Assets.icons.clock,
              menuTitle: "Set Reminder",
              label: "Not set",
              onTap: () {},
            ),
            ExtrasMenuButton(
              icon: Assets.icons.edit,
              menuTitle: "Change Note Type",
              label: "Buying something",
              onTap: () {},
            ),
            ExtrasMenuButton(
              icon: Assets.icons.tag,
              menuTitle: "Give Label",
              label: "Not set",
              onTap: () {},
            ),
            ExtrasMenuButton(
              icon: Assets.icons.check,
              menuTitle: "Mark as Finished",
              onTap: () {},
            ),
            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                color: AppColors.neutralColor.lightGrey,
                thickness: 1,
                height: 1,
              ),
            ),
            ExtrasMenuButton(
              icon: Assets.icons.delete,
              iconColor: AppColors.errorColor.base,
              menuTitle: "Delete Note",
              menuTitleColor: AppColors.errorColor.base,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
