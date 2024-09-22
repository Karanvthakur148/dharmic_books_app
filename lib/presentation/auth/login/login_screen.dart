import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/app/app_constants/color_constants.dart';
import 'package:quran_app/app/app_constants/font_constants.dart';
import 'package:quran_app/app/app_constants/hive_constants.dart';
import 'package:quran_app/app/app_constants/style_constants.dart';
import 'package:quran_app/app/config/hive_config.dart';
import 'package:quran_app/app/constants/route_constants.dart';
import 'package:quran_app/presentation/widgets/meta_button.dart';
import 'package:quran_app/presentation/widgets/text_field.dart';

import 'login_form_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  LoginFormBloc? formBloc;
  bool _isChecked = false;

  Widget build(BuildContext context) {
    print("LOGIN STATUS");
    print("${jsonEncode(QuranHiveConfig().getHiveConfig().get(AppHiveConstant.LoginStatus))}");
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Builder(builder: (context) {
        formBloc = BlocProvider.of<LoginFormBloc>(context);

        return FormBlocListener<LoginFormBloc, String, String>(
          onSubmissionFailed: (context, state) {
            print("SUBMISSION FAILS");
            print(state);
          },
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(

                  children: [
                    Image.asset(
                      'assets/images/welcome_bg.png',fit: BoxFit.cover,
                      // width: 152.w,
                      // height: 86.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.w, 13.h, 16.h, 13.h),
                          child: Image.asset(
                            'assets/images/splash_logo.png',
                            width: 152.w,
                            height: 86.h,
                          ),
                        ),
                        Divider(
                          color: AppColors.dividerColor_2,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.h, 13.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome Back.',
                                style: AppTextStyles.welcomeBackStyle,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Enter your email and password below to access.',
                                maxLines: 2,
                                style: AppTextStyles.subtitleStyle,
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Text(
                                'Email',
                                style: AppTextStyles.labelStyle,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              MetaBlocTextField(
                                hintText: 'Enter your Email',
                                textFieldBloc: formBloc!.tfEmail,
                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                'Password',
                                style: AppTextStyles.labelStyle,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              MetaBlocTextField(
                                backgroundColor: Colors.transparent,
                                hintText: 'Enter your Password',
                                textFieldBloc: formBloc!.tfPassword,
                                isPassword: true,
                                // suffixIcon: IconButton(
                                //   icon: Icon(
                                //     // Based on passwordVisible state choose the icon
                                //     _passwordVisible
                                //         ? Icons.visibility_outlined // Use visibility_outlined for the gray outline
                                //         : Icons.visibility_off_outlined,
                                //     color: AppColors.dark_grey,
                                //   ),
                                //   onPressed: () {
                                //     // Update the state i.e. toggle the state of passwordVisible variable
                                //     setState(() {
                                //       _passwordVisible = !_passwordVisible;
                                //     });
                                //   },
                                // ),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // Update the state i.e. toggle the state of passwordVisible variable
                                      setState(() {
                                        _isChecked = !_isChecked;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          // Based on passwordVisible state choose the icon
                                          _isChecked
                                              ? Icons
                                                  .check_box_outlined // Use visibility_outlined for the gray outline
                                              : Icons.check_box_outline_blank_sharp,
                                          color: _isChecked
                                              ? Colors.blue.shade900
                                              : AppColors.greyBorderColor,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text(
                                          'Remember me',
                                          style: AppTextStyles.labelStyle,
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Forgot password?',
                                    style: AppTextStyles.forgotPasswordStyle,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              MetaButton(
                                label: 'Sign in',
                                next: (){
                                  Navigator.pushNamed(context, RouteConstants.DASHBOARD_PATH);
                                },
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: AppColors.dividerColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    'or',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontFamily: INTER_SEMI_BOLD),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: AppColors.dividerColor,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/google_icon.svg',
                                    width: 44.w,
                                    height: 44.h,
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/fb_icon.svg',
                                    width: 44.w,
                                    height: 44.h,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        RouteConstants.CREATE_ACCOUNT_PATH);
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Don’t have account? ',
                                      // default text style
                                      style: TextStyle(
                                          color: AppColors.subtitle_grey,
                                          fontFamily: INTER_REGULAR,
                                          fontSize: 14.sp),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'sign up',
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontFamily: INTER_REGULAR,
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
