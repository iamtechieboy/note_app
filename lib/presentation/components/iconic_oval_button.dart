import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/core/domain/entities/enums.dart';

class IconicOvalButton extends StatelessWidget {
  const IconicOvalButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.icon,
    this.margin,
    this.isWidthMax = false,
    this.iconPosition = IconPosition.left,
    this.height,
    this.cornerRadius,
    this.boxDecoration,
    this.textColor,
    this.iconColor,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  final String? icon;
  final EdgeInsets? margin;
  final bool? isWidthMax;
  final IconPosition iconPosition;
  final double? height;
  final double? cornerRadius;
  final BoxDecoration? boxDecoration;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? double.infinity,
      margin: margin,
      width: isWidthMax! ? double.infinity : null,
      decoration: boxDecoration ??
          BoxDecoration(
              borderRadius: BorderRadius.circular(cornerRadius ?? 20),
              color: AppColors.primaryColor.base),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(19),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Directionality(
              textDirection: (iconPosition == IconPosition.left ||
                      iconPosition == IconPosition.centerLeft)
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: Row(
                mainAxisSize: ((iconPosition == IconPosition.centerLeft ||
                            iconPosition == IconPosition.centerRight) &&
                        isWidthMax!)
                    ? MainAxisSize.max
                    : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: icon != null
                        ? Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: SvgPicture.asset(
                              icon!,
                              color: iconColor ?? AppColors.neutralColor.white,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  Expanded(
                    flex: (isWidthMax! &&
                            !(iconPosition == IconPosition.centerLeft ||
                                iconPosition == IconPosition.centerRight))
                        ? 1
                        : 0,
                    child: Center(
                      child: Text(
                        text,
                        style: AppTextStyle.mediumBase.copyWith(
                          color: textColor ?? AppColors.neutralColor.white,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                      visible: icon != null,
                      child: SizedBox(width: isWidthMax! ? 24 : 5))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
