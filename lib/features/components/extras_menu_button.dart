import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import '../../config/constants/assets.dart';

class ExtrasMenuButton extends StatelessWidget {
  const ExtrasMenuButton({
    Key? key,
    required this.menuTitle,
    this.icon,
    this.label,
    this.iconColor,
    this.menuTitleColor,
    required this.onTap,
    this.isArrowVisible = false,
    this.padding,
    this.height,
    this.enable = true,
  }) : super(key: key);

  final String? icon;
  final Color? iconColor;
  final String menuTitle;
  final Color? menuTitleColor;
  final String? label;
  final Function() onTap;
  final bool? isArrowVisible;
  final EdgeInsets? padding;
  final double? height;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 56,
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: enable ? onTap : null,
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: icon != null,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SvgPicture.asset(
                          icon ?? Assets.icons.photo,
                          height: 24,
                          width: 24,
                          color: iconColor ?? AppColors.neutralColor.black,
                        ),
                      ),
                    ),
                    Text(
                      menuTitle,
                      style: AppTextStyle.mediumBase.copyWith(
                          color:
                              enable ? menuTitleColor ?? AppColors.neutralColor.black : AppColors.neutralColor.baseGrey),
                    )
                  ],
                ),
                Visibility(
                  visible: label != null || isArrowVisible!,
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
                              style: AppTextStyle.regular2Xs.copyWith(
                                  color: enable ? AppColors.neutralColor.darkGrey : AppColors.neutralColor.baseGrey),
                            ),
                          ),
                          isArrowVisible!
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: label != null ? 8 : 0),
                                  child: SvgPicture.asset(
                                    Assets.icons.arrowIn,
                                    color: enable ? AppColors.neutralColor.darkGrey : AppColors.neutralColor.baseGrey ,
                                  ),
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
