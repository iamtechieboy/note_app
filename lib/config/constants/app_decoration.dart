import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppDecoration {
  static BoxDecoration defDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: AppColors.metalColor.shade10,
  );
}
