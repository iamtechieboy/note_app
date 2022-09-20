import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';

class BottomNavButton extends StatelessWidget {
  const BottomNavButton({
    Key? key,
    required this.isTabSelected,
    required this.defIcon,
    this.filledIcon,
    required this.label,
    required this.padding,
    required this.callBack,
  }) : super(key: key);

  final bool isTabSelected;
  final String defIcon;
  final String? filledIcon;
  final String label;
  final EdgeInsets padding;
  final Function() callBack;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: padding,
      onPressed: callBack,
      child: Column(
        children: [
          SvgPicture.asset(
            filledIcon != null
                ? isTabSelected
                    ? filledIcon!
                    : defIcon
                : defIcon,
            height: 32,
            color: isTabSelected
                ? AppColors.primaryColor.base
                : AppColors.neutralColor.darkGrey,
          ),
          Text(
            label,
            style: AppTextStyle.regularXs.copyWith(
              color: isTabSelected
                  ? AppColors.primaryColor.base
                  : AppColors.neutralColor.darkGrey,
            ),
          )
        ],
      ),
    );
  }
}
