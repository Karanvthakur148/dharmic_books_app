import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/app/app_constants/color_constants.dart';
import 'package:quran_app/app/app_constants/font_constants.dart';
import 'package:quran_app/presentation/widgets/appBar.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: 'Details',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            _productImage(),
            Divider(
              color: AppColors.dividerColor,
            ),
            SizedBox(height: 19.h),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(23.w, 0, 23.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 200.w,
                      child: Text(
                        "The Holy Qur’an, luxurious binding.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: INTER_BOLD,
                            color: AppColors.blackColor),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "99.99 AED",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12.sp,
                            fontFamily: INTER_MEDIUM,
                            color: AppColors.shadeGrayOfferColor),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "90.00 AED",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: INTER_BOLD,
                            color: AppColors.gold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              height: 32.h,
              color: AppColors.dividerColor,
            ),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(23.w, 0, 23.w, 16.h),
              child: Text('An innovative and unique design of the Hafiz box for the Holy Quran in PU leather that can be used as a support ...',style: TextStyle(
                color: AppColors.featured_grey,
                fontSize: 13.sp,
                fontFamily: INTER_REGULAR
              ),),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(23.w, 0, 23.w, 16.h),
              child: Column(
                children: [

              _availableColor(),
              SizedBox(height: 16),
              _availableSize(),
                ],
              ),
            )


            // Available Colors
            // Product Description
            // SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _productImage() {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(23.w, 20.h, 23.w, 0),
      decoration: BoxDecoration(color: AppColors.image_background_color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdntsjEgOPZQmEEvz1Zn3wvcqbdBDCO-kAZPxkiBSTDtavpJqcJn3EoWUn3WnxZ9KZ764&usqp=CAU',
            fit: BoxFit.contain,
            height: 200, // Adjust the height as needed
            width: double.infinity,
          ),
          // SizedBox(height: 20.h,),
          Container(
            margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
            height: 40.h,
            // padding: EdgeInsets.symmetric(horizontal: 20.w),
            color: AppColors.image_background_color,
            alignment: Alignment.center,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.greyBorderColor)),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdntsjEgOPZQmEEvz1Zn3wvcqbdBDCO-kAZPxkiBSTDtavpJqcJn3EoWUn3WnxZ9KZ764&usqp=CAU',
                      fit: BoxFit.contain,
                    ),
                  );
                },
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 16.w,
                  );
                },
                itemCount: 4),
          )
        ],
      ),
      // child: Image.asset(
      //   'assets/product_image.png', // Replace with the actual image path
      //   height: 200, // Adjust the height as needed
      //   width: double.infinity,
      //   fit: BoxFit.cover,
      // ),
    );
  }

  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Sizes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            _sizeWidget('S'),
            _sizeWidget('M', isSelected: true),
            _sizeWidget('L'),
            _sizeWidget('XL'),
          ],
        ),
      ],
    );
  }

  Widget _sizeWidget(String text, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Colors.blue : Colors.transparent,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _availableColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Colors',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            _colorWidget(Colors.red, isSelected: true),
            _colorWidget(Colors.blue),
            _colorWidget(Colors.green),
            _colorWidget(Colors.yellow),
          ],
        ),
      ],
    );
  }

  Widget _colorWidget(Color color, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey,
          width: 2,
        ),
        color: color,
      ),
      child: isSelected
          ? Icon(
              Icons.check,
              color: Colors.white,
            )
          : SizedBox(),
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Description',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
