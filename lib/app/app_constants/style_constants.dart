import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_constants.dart';
import 'font_constants.dart';


class AppTextStyles {

  static TextStyle welcomeBackStyle = TextStyle(
      color: AppColors.blackColor,
      fontSize: 18.sp,
      fontFamily: INTER_BOLD);

static TextStyle subtitleStyle = TextStyle(
      color: AppColors.subtitle_grey,
      fontSize: 14.sp,
      fontFamily: INTER_MEDIUM);

  static TextStyle labelStyle = TextStyle(
      color: AppColors.labelColor,
      fontSize: 14.sp,
      fontFamily: INTER_MEDIUM);

static TextStyle forgotPasswordStyle = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 14.sp,
      fontFamily: INTER_SEMI_BOLD);

static TextStyle sideHeadingStyle = TextStyle(
    fontSize: 14.sp,
    fontFamily: INTER_SEMI_BOLD,
    color: AppColors.blackColor);
static TextStyle viewAllStyle = TextStyle(
    fontSize: 12.sp,
    fontFamily: INTER_MEDIUM,
    color: AppColors.primaryColor);

static TextStyle appBarStyle = TextStyle(
      color: AppColors.blackColor,
      fontSize: 18.sp,
      fontFamily: INTER_SEMI_BOLD);

}
