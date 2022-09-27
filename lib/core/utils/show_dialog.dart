import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_decoration.dart';
import 'package:note_app/presentation/components/circular_icon_place.dart';
import 'package:note_app/presentation/components/iconic_oval_button.dart';

import '../../config/constants/app_text_style.dart';
import '../../config/constants/assets.dart';

showCustomDialog({
  required BuildContext context,
  required String title,
  required String contentText,
  String? icon,
  Color? iconColor,
  Color? iconBackgroundColor,
  String? positive,
  String? negative,
  double? buttonHeight,
  Function()? onPositiveTap,
  Function()? onNegativeTap,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      titlePadding: const EdgeInsets.only(top: 32, bottom: 8),
      contentPadding: const EdgeInsets.only(bottom: 32, left: 24, right: 24),
      actionsPadding: const EdgeInsets.only(left: 12, right: 12, bottom: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      alignment: Alignment.center,
      title: Column(
        children: [
          Visibility(
            visible: icon != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CircularIconPlace(
                height: 58,
                iconColor: iconColor ?? AppColors.primaryColor.base,
                icon: icon ?? Assets.icons.photo,
                background: iconBackgroundColor ?? AppColors.primaryColor.light,
              ),
            ),
          ),
          Text(
            title,
            style: AppTextStyle.boldLg,
            textAlign: TextAlign.center,
          )
        ],
      ),
      content: Text(
        contentText,
        style: AppTextStyle.regularBase
            .copyWith(color: AppColors.neutralColor.darkGrey),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Visibility(
              visible: negative != null,
              child: Expanded(
                child: IconicOvalButton(
                  isWidthMax: true,
                  onTap: onNegativeTap ?? () {},
                  text: negative ?? "Cancel",
                  textColor: AppColors.primaryColor.base,
                  boxDecoration: AppDecoration.outline,
                  height: 38,
                ),
              ),
            ),
            Visibility(
              visible: !(negative == null || positive == null),
              child: const SizedBox(
                width: 16,
              ),
            ),
            Visibility(
              visible: positive != null,
              child: Expanded(
                child: IconicOvalButton(
                  isWidthMax: true,
                  onTap: onPositiveTap ?? () {},
                  text: positive ?? "Yes",
                  height: 38,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
