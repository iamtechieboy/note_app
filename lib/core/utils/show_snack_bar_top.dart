import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/assets.dart';

showCustomTopSnackBar(
    {required BuildContext context, required Widget messages}) {
  showTopSnackBar(
    context,
    CustomSnackBar.info(
      boxShadow: [
        BoxShadow(
          color: AppColors.successColor.light,
          offset: const Offset(0.0, 1.0),
          spreadRadius: 0.5,
          blurRadius: 50,
        ),
      ],
      iconPositionLeft: 16,
      icon: Container(
        height: 32,
        width: 32,
        margin: const EdgeInsets.symmetric(
          vertical: 31,
        ),
        decoration: BoxDecoration(
          color: AppColors.successColor.base,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Transform.scale(
          scale: 0.7,
          child: SvgPicture.asset(
            Assets.icons.check,
            color: AppColors.successColor.dark,
          ),
        ),
      ),
      iconRotationAngle: 0,
      messagePadding: const EdgeInsets.only(
        left: 20,
        right: 16,
      ),
      message:messages,
      backgroundColor: AppColors.successColor.light,
    ),
  );
}
