import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import 'back_to_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 54,
        backgroundColor: AppColors.neutralColor.white,
        elevation: 1,
        shadowColor: const Color(0xe5ffffff),
        centerTitle: true,
        title: title != null
            ? Text(
                title!,
                style: AppTextStyle.mediumBase
                    .copyWith(color: AppColors.neutralColor.black),
              )
            : null,
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: BackToButton(
          onPressed: () => Navigator.pop(context),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
