import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:note_app/config/constants/assets.dart';
import 'package:note_app/presentation/components/extras_menu_button.dart';
import 'package:note_app/presentation/widgets/custom_color_picker.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import '../widgets/extra_menu_bottom_sheet_body.dart';

class BottomTaskBar extends StatefulWidget {
  const BottomTaskBar({
    Key? key,
    required this.context,
    // required this.onMoreButtonPressed,
  }) : super(key: key);

  final BuildContext context;

  // final Function() onMoreButtonPressed;

  @override
  State<BottomTaskBar> createState() => _BottomTaskBarState();
}

class _BottomTaskBarState extends State<BottomTaskBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFEFEEF0),
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
                  showMaterialModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    builder: (context) => const ExtrasMenuBottomSheetBody(),
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
