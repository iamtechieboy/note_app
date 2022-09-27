import 'package:flutter/material.dart';
import 'package:note_app/presentation/components/custom_bottom_sheet.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import '../../config/constants/assets.dart';
import '../components/extras_menu_button.dart';
import 'custom_color_picker.dart';

class ExtrasBottomSheetMenuBody extends StatefulWidget {
  const ExtrasBottomSheetMenuBody({Key? key}) : super(key: key);

  @override
  State<ExtrasBottomSheetMenuBody> createState() =>
      _ExtrasBottomSheetMenuBodyState();
}

class _ExtrasBottomSheetMenuBodyState extends State<ExtrasBottomSheetMenuBody> {
  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      height: 475,
      body: Column(
        children: [
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
    );
  }
}
