import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    Key? key,
    required this.label,
    required this.onTap, required this.padding,
  }) : super(key: key);

  final Function() onTap;
  final String label;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Padding(
              padding: padding,
              child: SvgPicture.asset(
                "assets/icons/plus.svg",
                height: 20,
                width: 20,
                color: AppColors.primaryColor.base,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: AppTextStyle.mediumBase.copyWith(
                decoration: TextDecoration.underline,
                color: AppColors.primaryColor.base,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
