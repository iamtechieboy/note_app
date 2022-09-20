import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_colors.dart';

abstract class AppTextStyle {
  const AppTextStyle._();

  static const String fontFamily = "Inter";

  static TextStyle regularXs = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 10,
      color: AppColors.neutralColor.black);

  static TextStyle regular2Xs = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12,
      color: AppColors.neutralColor.black);

  static TextStyle regularSm = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 14,
      height: 14 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle regularBase = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      height: 14 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle regularLg = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 20,
      height: 14 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle regularXl = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 24,
      height: 12 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle regular2Xl = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 32,
      height: 12 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle regular3Xl = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 40,
      height: 11 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle mediumXs = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 10,
      color: AppColors.neutralColor.black);

  static TextStyle medium2Xs = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 12,
      color: AppColors.neutralColor.black);

  static TextStyle mediumSm = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 14,
      height: 14 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle mediumBase = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      height: 14 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle mediumLg = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 20,
      height: 14 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle mediumXl = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 24,
      height: 12 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle medium2Xl = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 32,
      height: 12 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle medium3Xl = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 40,
      height: 11 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle boldXs = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 10,
      color: AppColors.neutralColor.black);

  static TextStyle bold2Xs = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 12,
      color: AppColors.neutralColor.black);

  static TextStyle boldSm = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 14,
      height: 14 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle boldBase = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      height: 14 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle boldLg = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 20,
      height: 14 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle boldXl = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 24,
      height: 12 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle bold2Xl = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 32,
      height: 12 / 10,
      color: AppColors.neutralColor.black);

  static TextStyle bold3Xl = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 40,
      height: 11 / 10,
      color: AppColors.neutralColor.black);

  // /*
  //     + add main task dagi + ning style
  // */

  // static TextStyle addStyle = TextStyle(
  //     fontFamily: fontFamily,
  //     fontWeight: FontWeight.w500,
  //     fontStyle: FontStyle.normal,
  //     fontSize: 20,
  //     height: 14 / 10,
  //     color: AppColors.primaryColor.base);

  // /* 
  //     + add main task dagi Add main taskning style 
  // */

  // static TextStyle addStyleUnderline = TextStyle(
  //   fontFamily: fontFamily,
  //   fontWeight: FontWeight.w700,
  //   fontStyle: FontStyle.normal,
  //   fontSize: 16,
  //   height: 14 / 10,
  //   color: AppColors.primaryColor.base,
  //   decoration: TextDecoration.underline,
  // );
}
