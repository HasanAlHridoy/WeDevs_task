import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_constant.dart';

class AppStyles {
  // Text Styles

  static get bodyLarge => TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.colorBlack,
      );

  static get bodyLarge900 => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w900,
        color: AppColors.colorBlack,
      );

  static get bodyMedium => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.hintColor,
      );

  static get bodyMedium400 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorGrey,
      );

  static get bodyMediumWhite500 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.colorWhite,
      );

  static get bodyMediumWhite400 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorWhite,
      );

  static get bodyMediumBlack400 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorBlack,
      );

  static get bodyMediumBlue700 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.colorWhite,
      );

  static get bodyMediumButton700 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.buttonColor2,
      );

  static get bodyMediumLightBlack300 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w300,
        color: AppColors.colorLightBlack,
      );

  static get bodyMediumBlack700 => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.colorBlack,
      );

  static get bodySmall => TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.hintColor,
      );

  static get bodySmallGrey400 => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorGrey,
      );

  static get bodySmallBlack400 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorBlack,
      );

  static get bodySmallBlack400S15 => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorBlack,
      );

  static get bodySmallBlack400S15CGrey => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.deepGreyColor,
      );

  static get bodySmallTextGrey400 => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorTextGrey,
      );

  static get bodySmallText2Grey400 => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorTextGrey2,
      );

  static get bodySmallText2Grey400s16 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorTextGrey2,
      );

  static get bodyTitle700 => TextStyle(
        fontSize: 23.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.colorDeepBlue,
      );

  // Button Styles

  static ButtonStyle get buttonStyle => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
        foregroundColor: MaterialStateProperty.all<Color>(AppColors.colorWhite),
        minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 61.h)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0.r), // Rounded corners
          ),
        ),
      );
}