import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/presentation/widgets/appBar.dart';

import '../../../app/app_constants/color_constants.dart';
import '../../../app/app_constants/font_constants.dart';
import '../../../app/app_constants/style_constants.dart';
import '../../../app/constants/route_constants.dart';
import '../../widgets/meta_button.dart';
import '../../widgets/text_field.dart';
import 'create_account_form_bloc.dart';

class CreateAccount extends StatelessWidget {
  CreateAccountFormBloc? formBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MetaAppBar(
        title: 'Create an Account',
      ),
      body:  SingleChildScrollView(
        child: BlocProvider(
          create: (context) => CreateAccountFormBloc(),
          child: Builder(builder: (context) {
            formBloc = BlocProvider.of<CreateAccountFormBloc>(context);
        
            return FormBlocListener<CreateAccountFormBloc, String, String>(
              onSubmissionFailed: (context, state) {
                print("SUBMISSION FAILS");
                print(state);
              },
              child:Padding(
                padding:  EdgeInsets.fromLTRB(24.w, 35.h, 24.w, 35.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username',
                      style: AppTextStyles.labelStyle,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    MetaBlocTextField(
                      hintText: 'Enter your username',
                      textFieldBloc: formBloc!.tfUserName,
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(
                      height: 16.h,
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
                      'Phone Number',
                      style: AppTextStyles.labelStyle,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    MetaBlocTextField(
                      hintText: 'Enter your phone Number',
                      textFieldBloc: formBloc!.tfPhoneNumber,
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Create Password',
                      style: AppTextStyles.labelStyle,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    MetaBlocTextField(
                      backgroundColor: Colors.transparent,
                      hintText: 'Enter your Password',
                      textFieldBloc: formBloc!.tfCreatePassword,
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
                    SizedBox(
                      height: 24.h,
                    ),
                    MetaButton(
                      label: 'Sign in',
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
                        SizedBox(width: 4.w,),
                        Text(
                          'or',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontFamily: INTER_SEMI_BOLD),
                        ),SizedBox(width: 4.w,),
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
                    SizedBox(height: 50.h,),
                    Center(
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'already have an account ', // default text style
                            style: TextStyle(
                                color:AppColors.subtitle_grey,
                                fontFamily: INTER_REGULAR,
                                fontSize: 14.sp
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'sign in',
                                style: TextStyle(
                                    color:AppColors.primaryColor,
                                    fontFamily: INTER_REGULAR,
                                    fontSize: 14.sp
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
