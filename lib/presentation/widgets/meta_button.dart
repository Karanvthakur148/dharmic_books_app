import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/app/app_constants/font_constants.dart';

import '../../app/app_constants/color_constants.dart';

class MetaButton extends StatelessWidget {
  String? label;
  Function? next;
  Color? backgroundColor;
  Color? textColor;
  double? width;
  double? height;
  double? fontSize;
  String? fontFamily;
  EdgeInsetsGeometry? padding;

  MetaButton({
    this.label,
    this.next,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.fontFamily,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50.0.h,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(8.0.r),
        //   gradient: LinearGradient(
        //     colors:  [AppColors.primaryColor, AppColors.whiteColor], // Default gradient colors
        //     begin: Alignment.topLeft,
        //     end: Alignment.centerRight,
        //   ),
        // ),
        child: ElevatedButton(
          onPressed: () {
            // Validate the form
            // formBloc.submit();
            next!();
          },
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(backgroundColor ?? AppColors.primaryColor),
            minimumSize: MaterialStateProperty.all(Size(150, 48)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0.r),
              ),
            ),
          ),
          child: Text(
            label! ?? "",
            style: TextStyle(
              fontFamily: fontFamily ?? INTER_SEMI_BOLD,
              fontSize: fontSize ?? 16.sp,
              color: textColor ?? AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
