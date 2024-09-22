import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/app_constants/color_constants.dart';
import '../../app/app_constants/font_constants.dart';
import 'meta_textStyle.dart';

class MetaBlocTextField extends StatelessWidget {
  MetaBlocTextField({
    Key? key,
    required this.textFieldBloc,
    this.maxLength,
    this.labelText = "",
    this.hintText = "",
    this.onChanged,
    // this.onValidate,
    this.suffixIcon,
    this.backgroundColor = Colors.white,
    this.inputType = TextInputType.text,
    this.enabled = true,
    this.inputFormatters,
    this.isPassword = false,
    this.borderRadius = 8,
    this.maxLines,
    this.readOnly = false,
    this.isEnabled = true,
    this.textStyle = const TextStyle(color: Colors.black, fontSize: 14, fontFamily: INTER_BOLD),
    this.textColor = AppColors.blackColor, this.controller, this.textAlign, this.inputDecoration,
  }) : super(key: key);

  final String labelText;
  final TextEditingController? controller;
  final String hintText;
  final int? maxLength;
  final Function(String)? onChanged;
  // FormFieldValidator<String>? onValidate;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextInputType inputType;
  final bool enabled;
  final bool readOnly;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPassword;
  final bool isEnabled;
  final double borderRadius;
  final int? maxLines;
  final TextFieldBloc textFieldBloc;
  final TextStyle textStyle;
  final InputDecoration? inputDecoration;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      key: UniqueKey(),
      textFieldBloc: textFieldBloc,
      keyboardType: inputType,
      maxLength: maxLength != 0 ? maxLength : null,
      onChanged: onChanged,
      textStyle: textStyle,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      textColor: MaterialStateProperty.all<Color>(textColor!),
      maxLines: maxLines ?? 1,
      obscureText: isPassword,
      suffixButton: isPassword ? SuffixButton.obscureText : null,
      isEnabled: isEnabled,
      decoration: inputDecoration ?? InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 14,horizontal: 14),
        border: _outlinedBorder(AppColors.BorderColor),
        disabledBorder: _outlinedBorder(AppColors.BorderColor),
        focusedBorder: _outlinedBorder(AppColors.primaryColor),
        enabledBorder: _outlinedBorder(AppColors.BorderColor),
        focusedErrorBorder: _outlinedBorder(AppColors.Error_Red),
        errorBorder: _outlinedBorder(AppColors.Error_Red),
        label: MetaTextView(text: labelText, textStyle: MetaStyle(fontColor: AppColors.subtitle_grey, fontSize: 14)),
        hintText: hintText.tr(),
        hintStyle: const MetaStyle(
            fontColor: AppColors.subtitle_grey, fontSize: 12).getStyle(),
        errorStyle: const MetaStyle(fontColor: AppColors.Error_Red, fontSize: 12).getStyle(),
        filled: true,
        fillColor: backgroundColor,
        helperMaxLines: 1,
        suffixIcon: suffixIcon,
      ),
      readOnly: readOnly,
    );
  }

  UnderlineInputBorder _renderBorder(Color color) => UnderlineInputBorder(borderSide: BorderSide(color: color));
  OutlineInputBorder _outlinedBorder(Color color)=> OutlineInputBorder(
    borderSide:
    BorderSide(color: color, width: 1.0.w),
    borderRadius: BorderRadius.circular(8.r)
  );
}
