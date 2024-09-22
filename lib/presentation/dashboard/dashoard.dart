import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/app/app_constants/font_constants.dart';
import 'package:quran_app/app/constants/string_constants.dart';
import 'package:quran_app/presentation/dashboard/more/more_tab.dart';
import '../../app/app_constants/color_constants.dart';
import '../../app/app_constants/string_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cart/cart_tab.dart';
import 'home/home_tab.dart';
import 'orders/order_tab.dart';

class Dashoard extends StatefulWidget {
  @override
  State<Dashoard> createState() => DashoardState();
}

class DashoardState extends State<Dashoard> {
  int _currentIndex = 0;
  final tabs = [
    HomeTab(),
    OrderTab(),
    CartTab(),
    MoreTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.subtitle_grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/home_icon.svg',
              height: 22.w,
              width: 22.w,
              color: _currentIndex == 0
                  ? AppColors.primaryColor
                  : AppColors.unselectedColor,
            ),
            label: StringConstants.home,
            // backgroundColor: FbColors.purple,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/order_icon.svg',
                height: 22.w,
                width: 22.w,
                color: _currentIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.unselectedColor),
            label: StringConstants.orders,
            // backgroundColor: FbColors.purple,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/cart_icon.svg',
                height: 22.w,
                width: 22.w,
                color: _currentIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.unselectedColor),
            label: StringConstants.cart,
            // backgroundColor: FbColors.purple,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/more_icon.svg',
                height: 22.w,
                width: 22.w,
                color: _currentIndex == 3
                    ? AppColors.primaryColor
                    : AppColors.unselectedColor),
            label: StringConstants.more,
            // backgroundColor: FbColors.purple,
          ),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedFontSize: 10.sp,
        selectedLabelStyle: TextStyle(
            fontFamily: INTER_MEDIUM,
            height: 2.h,
            fontSize: 9.sp,
            color: AppColors.primaryColor),
        unselectedLabelStyle: TextStyle(
            fontFamily: INTER_MEDIUM,
            height: 2.h,
            fontSize: 9.sp,
            color: AppColors.unselectedColor),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: tabs[_currentIndex],
    );
  }
}
