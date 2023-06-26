import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_decoration.dart';
import 'package:note_app/config/constants/app_text_style.dart';

import '../../config/constants/assets.dart';

class LabelItem extends StatelessWidget {
  const LabelItem({
    Key? key,
    required this.onTap,
    required this.labelName,
  }) : super(key: key);
  final Function(String labelName) onTap;
  final String labelName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: AppDecoration.defDecor.copyWith(
        color: AppColors.neutralColor.lightGrey,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            labelName,
            style: AppTextStyle.regular2Xs.copyWith(
              color: AppColors.neutralColor.darkGrey,
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              onTap(labelName);
            },
            child: SvgPicture.asset(Assets.icons.close),
          )
        ],
      ),
    );
  }
}
