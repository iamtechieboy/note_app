import 'package:flutter/material.dart';
import 'package:note_app/presentation/components/custom_bottom_sheet.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import '../../config/constants/assets.dart';
import '../components/extras_menu_button.dart';
import 'custom_color_picker.dart';

class ExtrasBottomSheetMenuBody extends StatefulWidget {
  const ExtrasBottomSheetMenuBody({
    Key? key,
    required this.onSelectedColorIndex,
    required this.onRemindedTimeSelected,
    required this.onSelectedLabels,
    required this.onMarkAsFinished,
    required this.onDelete,
  }) : super(key: key);

  final Function(int selectedColorIndex) onSelectedColorIndex;
  final Function(List<String> labels) onSelectedLabels;
  final Function(DateTime remindedTime) onRemindedTimeSelected;
  final Function() onMarkAsFinished;
  final Function() onDelete;

  @override
  State<ExtrasBottomSheetMenuBody> createState() =>
      _ExtrasBottomSheetMenuBodyState();
}

class _ExtrasBottomSheetMenuBodyState extends State<ExtrasBottomSheetMenuBody> {
  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16),
            child: Text(
              "CHANGE BACKGROUND",
              style: AppTextStyle.regularXs
                  .copyWith(color: AppColors.neutralColor.darkGrey),
            ),
          ),
          // Color picker for that project
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomColorPicker(
              onSelectedColor: widget.onSelectedColorIndex,
            ),
          ),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 16),
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
            isArrowVisible: true,
            onTap: () {},
          ),
          // TODO: Thinking about adding it
          // ExtrasMenuButton(
          //   icon: Assets.icons.edit,
          //   menuTitle: "Change Note Type",
          //   label: "Buying something",
          //   isArrowVisible: true,
          //   onTap: () {},
          // ),
          ExtrasMenuButton(
            icon: Assets.icons.tag,
            menuTitle: "Give Label",
            isArrowVisible: true,
            label: "Not set",
            onTap: () {},
          ),
          ExtrasMenuButton(
            icon: Assets.icons.check,
            menuTitle: "Mark as Finished",
            onTap: widget.onMarkAsFinished,
          ),
          // Divider
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
            onTap: widget.onDelete,
          ),
        ],
      ),
    );
  }
}
