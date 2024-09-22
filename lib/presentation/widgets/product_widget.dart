import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/app_constants/color_constants.dart';
import '../../app/app_constants/font_constants.dart';

class ProductWidget extends StatelessWidget {
  String networkImageUrl;
  String productName;
  String actualPrice;
  String offerPrice;
  Color? backgroundColor;

  ProductWidget(
      {required this.networkImageUrl,
      required this.productName,
      required this.actualPrice,
      required this.offerPrice,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 140.w,
          height: 152.h,
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.image_background_color,
            // shape: BoxShape.rectangle,
            border: Border.all(color: AppColors.dividerColor),
            borderRadius: BorderRadius.circular(14.r),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                networkImageUrl,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          width: 130.w,
          child: Text(
            productName,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.blackColor,
                fontFamily: INTER_BOLD),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          width: 130.w,
          child: RichText(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: '$actualPrice AED', // default text style
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: AppColors.subtitle_grey,
                  fontFamily: DUBAI_MEDIUM,
                  fontSize: 10.sp),
              children: <TextSpan>[
                TextSpan(
                  text: '  $offerPrice AED',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: AppColors.primaryColor,
                      fontFamily: DUBAI_BOLD,
                      fontSize: 10.sp),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
