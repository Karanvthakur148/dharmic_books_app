import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/app_constants/color_constants.dart';
import '../../app/app_constants/font_constants.dart';

class MetaTextView extends StatelessWidget {
  final String text;
  final MetaStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final Map<String,String>? trString;
  const MetaTextView({
    required this.text,
    this.textStyle,
    this.trString,
    this.maxLines=1,
    this.textAlign = TextAlign.center
  });

  @override
  Widget build(BuildContext context) {

    var textWidget = Text(
        text,
        textAlign: textAlign ,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style:textStyle!=null ? textStyle!.getStyle() : MetaStyle(fontSize: 12.0,fontColor: AppColors.blackColor).getStyle()
    );

    if(trString!=null){
      return textWidget.tr(namedArgs: trString);
    }

    return textWidget.tr();
  }

}


class MetaStyle extends TextStyle {
  final double fontSize;
  final Color fontColor;
  final String? fontFamily;
  final bool enableUnderline;
  final FontStyle fontStyle;
  final double? height;
  final TextOverflow overflow;

  const MetaStyle({
    required this.fontSize,
    required this.fontColor,
    this.fontFamily = INTER_REGULAR,
    this.enableUnderline=false,
    this.fontStyle=FontStyle.normal,
    this.height,
    this.overflow = TextOverflow.visible,
  });

  TextStyle getStyle(){
    return TextStyle(
        fontSize: fontSize.sp,
        color: fontColor,
        decoration: enableUnderline ? TextDecoration.underline:TextDecoration.none,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
        overflow: overflow,
        height: height,
    );
  }

}
