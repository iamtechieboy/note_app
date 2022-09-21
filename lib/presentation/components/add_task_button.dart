import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.only(left: 7),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/plus.svg",
              height: 20,
              width: 20,
              color: AppColors.primaryColor.base,
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
