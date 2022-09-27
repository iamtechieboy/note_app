import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';

class TextWithSwitch extends StatelessWidget {
  TextWithSwitch({
    Key? key,
    required this.value,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primaryColor.light;
      }
      return null;
    },
  );

  final MaterialStateProperty<Color?> overlayColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primaryColor.base;
      }
      if (states.contains(MaterialState.disabled)) {
        return AppColors.neutralColor.baseGrey;
      }
      return null;
    },
  );

  final bool value;
  final String label;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              label,
              style: AppTextStyle.mediumBase
                  .copyWith(color: AppColors.neutralColor.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Switch(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              mouseCursor: MouseCursor.uncontrolled,
              splashRadius: 8,
              trackColor: trackColor,
              thumbColor: overlayColor,
              // MaterialStateProperty.all<Color>(AppColors.primaryColor.base),
              value: value,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
