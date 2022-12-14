import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/assets.dart';

showCustomTopSnackBar({required BuildContext context, required Widget messages}) {
  showTopSnackBar(
    context,
    Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.successColor.light,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.successColor.light,
            offset: const Offset(0.0, 1.0),
            spreadRadius: 0.5,
            blurRadius: 50,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 32,
              width: 32,
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: AppColors.successColor.base,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Transform.scale(
                  scale: 0.7,
                  child: SvgPicture.asset(
                    Assets.icons.check,
                    color: AppColors.successColor.dark,
                    height: 16,
                  )),
            ),
            Expanded(child: messages),
          ],
        ),
      ),
    ),
  );
}
