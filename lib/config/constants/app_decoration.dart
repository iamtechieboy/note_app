import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_colors.dart';

abstract class AppDecoration {

  static BoxDecoration defDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: AppColors.neutralColor.black,
  );

  static ButtonStyle buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith(
        (state) => AppColors.primaryColor.base),
  );

}
