import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import '../../config/constants/assets.dart';

class BackToButton extends StatelessWidget {
  const BackToButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: SvgPicture.asset(
              Assets.icons.backWithText,
              color: AppColors.primaryColor.base,
            ),
          ),
          Text(
            title,
            style: AppTextStyle.mediumBase.copyWith(
              color: AppColors.primaryColor.base,
            ),
          ),
        ],
      ),
    );
  }
}
