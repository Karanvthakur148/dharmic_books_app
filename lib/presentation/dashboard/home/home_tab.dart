import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/app/app_constants/color_constants.dart';
import 'package:quran_app/app/app_constants/font_constants.dart';
import 'package:quran_app/app/app_constants/style_constants.dart';
import 'package:quran_app/app/constants/route_constants.dart';

import '../../widgets/grid_navigation.dart';
import '../../widgets/prayer_time_widget.dart';
import '../../widgets/product_widget.dart';

class GridItem {
  final int id;
  final String svgImagePath;
  final String itemName;

  GridItem(
      {required this.id, required this.svgImagePath, required this.itemName});
}

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            toolbarHeight: 80.h,
            // primary: false,
            snap: true,
            floating: true,
            expandedHeight: 300.h,
            flexibleSpace: Container(
              padding: EdgeInsets.only(top: 12.h),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                image: DecorationImage(
                  image: AssetImage('assets/images/masjid_bg.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 15.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '06:03',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 44.sp,
                                    fontFamily: INTER_BOLD),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                'Isha 1 hour 9 min left',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: INTER_MEDIUM),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                '22 Jumada 1445 AH',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 16.sp,
                                    fontFamily: INTER_SEMI_BOLD),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                'Dubai',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 13.sp,
                                    fontFamily: INTER_MEDIUM),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/images/search_icon.svg',
                                height: 40.w,
                                width: 40.w,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              SvgPicture.asset(
                                'assets/images/bell_icon.svg',
                                height: 40.w,
                                width: 40.w,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrayerTimingWidget(
                            name: 'Fajr',
                            svgImageData: 'assets/images/Shalat-Shubuh.svg',
                            time: '04:38',
                          ),
                          PrayerTimingWidget(
                            name: 'Dzuhr',
                            svgImageData: 'assets/images/Shalat-Zhuhur.svg',
                            time: '04:38',
                          ),
                          PrayerTimingWidget(
                            name: 'Asr',
                            svgImageData: 'assets/images/Shalat-Ashar.svg',
                            time: '04:38',
                          ),
                          PrayerTimingWidget(
                            name: 'Maghrib',
                            svgImageData: 'assets/images/Shalat-Maghrib.svg',
                            time: '04:38',
                          ),
                          PrayerTimingWidget(
                            name: 'Isha',
                            svgImageData: 'assets/images/Shalat-Isya.svg',
                            time: '04:38',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 0.h,
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    navigateToScreen(index);
                    GridNavigation.MoreOption(
                        "${gridItems![index].id}", context);
                    print('${gridItems![index].itemName} is pressed');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // margin: EdgeInsets.only(top: 10.h),
                        padding: EdgeInsets.all(18),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border:
                              Border.all(color: AppColors.icon_border_color),
                        ),
                        // alignment: Alignment.center,
                        child: SvgPicture.asset(
                          gridItems[index].svgImagePath,
                          height: 32.h,
                          width: 32.h,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        gridItems[index].itemName,
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: INTER_MEDIUM,
                            color: AppColors.blackColor),
                      )
                    ],
                  ),
                );
              },
              childCount: 12,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 0.h,
              childAspectRatio: 0.8,
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: AppColors.dividerColor,
              height: 20.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 23.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Product',
                    style:AppTextStyles.sideHeadingStyle,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RouteConstants.ESHOP_PATH);
                    },
                    child: Text(
                      'view all',
                      style: AppTextStyles.viewAllStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 250.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductWidget(
                      networkImageUrl:
                      'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTjESisouV6SKWb361DxMoP83ygw1aQUb3Fr5vwuZ6BDiH6IEJSAxz9NgMW6fnGH7RUKxbHoAvPMmQ2VLTVVN1EURW1kzDCVRKgmoZGP2bm&usqp=CAE',
                      productName: 'The Holy Qur\'an, luxurious binding.', actualPrice: '89', offerPrice: '50',
                    );
                  },
                  padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 16.w,
                    );
                  },
                  itemCount: 4),
            ),
          )
        ],
      ),
    );
  }

  // List of items for the grid
  List<GridItem> gridItems = [
    GridItem(
      id: 0,
      svgImagePath: 'assets/icons/read_quran_icon.svg',
      itemName: 'Read Quran',
    ),
    GridItem(
      id: 1,
      svgImagePath: 'assets/icons/tajweed_icon.svg',
      itemName: 'Learn Tajweed',
    ),
    GridItem(
      id: 2,
      svgImagePath: 'assets/icons/qibla_icon.svg',
      itemName: 'Qibla',
    ),
    GridItem(
      id: 3,
      svgImagePath: 'assets/icons/dua_icon.svg',
      itemName: 'Dua',
    ),
    GridItem(
      id: 4,
      svgImagePath: 'assets/icons/request_quran_icon.svg',
      itemName: 'Request Quran',
    ),
    GridItem(
      id: 5,
      svgImagePath: 'assets/icons/tasbeeh_icon.svg',
      itemName: 'Tasbeeh',
    ),
    GridItem(
      id: 6,
      svgImagePath: 'assets/icons/hijiri_icon.svg',
      itemName: 'Hijiri',
    ),
    GridItem(
      id: 7,
      svgImagePath: 'assets/icons/prayer_time_icon.svg',
      itemName: 'PrayerTime',
    ),
    GridItem(
      id: 8,
      svgImagePath: 'assets/icons/find_masjid_icon.svg',
      itemName: 'Find Masjid',
    ),
    GridItem(
      id: 9,
      svgImagePath: 'assets/icons/bulk_order_icon.svg',
      itemName: 'Bulk Order',
    ),
    GridItem(
      id: 10,
      svgImagePath: 'assets/icons/eshop_icon.svg',
      itemName: 'Eshop',
    ),
    GridItem(
      id: 12,
      svgImagePath: 'assets/icons/send_gift_icon.svg',
      itemName: 'Send Gift',
    ),

    // Add more items as needed
  ];

  void navigateToScreen(int index) {
    // Implement your navigation logic here
    // You can use the index to determine which screen to navigate to
    // Example: Navigate to a Screen with the name gridItems[index].itemName
    print('Navigate to ${gridItems[index].itemName} Screen');
  }
}
