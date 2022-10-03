import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/assets.dart';
import 'package:note_app/core/utils/bottom_sheet.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import '../widgets/extra_bottom_sheet_menu.dart';

class BottomTaskBar extends StatefulWidget {
  const BottomTaskBar({
    Key? key,
    required this.context,
    required this.onSelectedColorIndex,
    required this.onSelectedLabels,
    required this.onRemindedTimeSelected,
    required this.onMarkAsFinished,
    required this.onDelete,
  }) : super(key: key);

  final BuildContext context;
  final Function(int selectedColorIndex) onSelectedColorIndex;
  final Function(List<String> labels) onSelectedLabels;
  final Function(DateTime remindedTime) onRemindedTimeSelected;
  final Function() onMarkAsFinished;
  final Function() onDelete;

  @override
  State<BottomTaskBar> createState() => _BottomTaskBarState();
}

class _BottomTaskBarState extends State<BottomTaskBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.neutralColor.lightGrey,
          ),
        ),
      ),
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "Last edited on 19.30",
              style: AppTextStyle.regular2Xs,
            ),
          ),
          Row(
            children: [
              // Search button
              MaterialButton(
                minWidth: 48,
                height: 48,
                onPressed: () {},
                child: SvgPicture.asset(
                  Assets.icons.searchMenu,
                ),
              ),
              // Set bookmark button
              MaterialButton(
                minWidth: 48,
                height: 48,
                onPressed: () {},
                child: SvgPicture.asset(
                  Assets.icons.bookMark,
                ),
              ),
              // Show more button
              MaterialButton(
                minWidth: 48,
                height: 48,
                color: AppColors.primaryColor.base,
                onPressed: () {
                  showCustomBottomSheet(
                    context: context,
                    body: ExtrasBottomSheetMenuBody(
                      onSelectedColorIndex: widget.onSelectedColorIndex,
                      onRemindedTimeSelected: widget.onRemindedTimeSelected,
                      onSelectedLabels: widget.onSelectedLabels,
                      onMarkAsFinished: widget.onMarkAsFinished,
                      onDelete: widget.onDelete,
                    ),
                  );
                },
                child: SvgPicture.asset(
                  Assets.icons.more,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
