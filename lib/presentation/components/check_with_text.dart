import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';

import '../../config/constants/assets.dart';

class CheckWithText extends StatelessWidget {
  const CheckWithText({
    Key? key,
    required this.isSelected,
    required this.label,
    required this.onSelected,
  }) : super(key: key);

  final bool isSelected;
  final String label;
  final Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onSelected,
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Visibility(
                    visible: isSelected,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: SvgPicture.asset(
                      Assets.icons.check,
                      color: AppColors.successColor.base,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      label,
                      style: isSelected
                          ? AppTextStyle.boldBase
                          : AppTextStyle.mediumBase,
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
