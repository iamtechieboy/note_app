import 'package:flutter/material.dart';
import 'package:note_app/presentation/components/iconic_oval_button.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import 'back_to_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.iconicOvalButtonOnTap,
    this.iconicOvalButton,
  }) : super(key: key);

  final String? title;
  final Function()? iconicOvalButtonOnTap;
  final IconicOvalButton? iconicOvalButton;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.neutralColor.lightGrey,
              width: 1,
            ),
          ),
          color: AppColors.neutralColor.white,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: BackToButton(
                title: "Back",
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: title != null
                  ? Text(
                      title!,
                      style: AppTextStyle.mediumBase
                          .copyWith(color: AppColors.neutralColor.black),
                    )
                  : null,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: iconicOvalButton ?? const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
