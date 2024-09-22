import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/app_constants/font_constants.dart';

class PrayerTimingWidget extends StatelessWidget {
  String name;
  String  svgImageData;
  String time;

  PrayerTimingWidget({
    required this.name,
    required this.svgImageData,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontFamily: INTER_REGULAR,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 4.h),
            SvgPicture.asset(
              svgImageData,
              width: 32.w, // Adjust the width as needed
              height: 32.w, // Adjust the height as needed
            ),
            SizedBox(height: 4.h),
            Text(
              time,
              style: TextStyle(
                color: Colors.white,
                fontFamily: INTER_MEDIUM,
                fontSize: 15.sp,
              ),
            ),
          ],
        )
      ],
    );
  }
}
