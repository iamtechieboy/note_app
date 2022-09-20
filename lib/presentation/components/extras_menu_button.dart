import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import '../../config/constants/assets.dart';

class ExtrasMenuButton extends StatelessWidget {
  const ExtrasMenuButton({
    Key? key,
    required this.menuTitle,
    required this.icon,
    this.label,
    this.iconColor,
    this.menuTitleColor,
    required this.onTap,
  }) : super(key: key);

  final String icon;
  final Color? iconColor;
  final String menuTitle;
  final Color? menuTitleColor;
  final String? label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 12),
                  child: SvgPicture.asset(
                    icon,
                    height: 24,
                    width: 24,
                    color: iconColor ?? AppColors.neutralColor.black,
                  ),
                ),
                Text(
                  menuTitle,
                  style: AppTextStyle.mediumBase.copyWith(color: menuTitleColor ?? AppColors.neutralColor.black),
                )
              ],
            ),
            Visibility(
              visible: label != null,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          label ?? "",
                          style: AppTextStyle.regular2Xs
                              .copyWith(color: AppColors.neutralColor.darkGrey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SvgPicture.asset(Assets.icons.arrowIn),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
