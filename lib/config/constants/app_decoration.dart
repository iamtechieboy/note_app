//
import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppDecoration {
  static BoxDecoration defDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: AppColors.neutralColor.white,
  );

  static BoxDecoration outline = BoxDecoration(
    border: Border.all(color: AppColors.primaryColor.base, width: 1),
    borderRadius: BorderRadius.circular(19),
  );
}
