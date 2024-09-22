import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/app_constants/color_constants.dart';
import '../../app/app_constants/style_constants.dart';

class MetaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double height = 80.h;

  MetaAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/appBar_bg.png',
            ),
            fit: BoxFit.cover),

        // border: Border(
        //   bottom: BorderSide(
        //     color: AppColors.dividerColor, // Set the color of the red line
        //     width: 2.0, // Set the width of the red line
        //   ),
        // ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.3,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.blackColor,
              size: 20.sp,
            )),
        title: Text(
          '${title}',
          style: TextStyle(color: Colors.black),
        ),
        titleTextStyle: AppTextStyles.appBarStyle,
        titleSpacing: -10,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? svgImagePath;
  final double height = 60.h;
  final Icon? actionIcon;
  final Function? actionButton;

  SimpleAppBar({this.title, this.actionIcon,this.actionButton,this.svgImagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        // border: Border(
        //   bottom: BorderSide(
        //     color: AppColors.dividerColor, // Set the color of the red line
        //     width: 2.0, // Set the width of the red line
        //   ),
        // ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.3,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.blackColor,
              size: 20.sp,
            )),
        title: Text(
          '${title}',
          style: TextStyle(color: Colors.black),
        ),
        titleTextStyle: AppTextStyles.appBarStyle,
        titleSpacing: -10,
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: IconButton(onPressed: (){
              actionButton!();
            }, icon:actionIcon ?? Icon(Icons.more_vert_outlined))
            // SvgPicture.asset('$svgImagePath',),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
