import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/app/app_constants/assets_path.dart';
import 'package:quran_app/app/app_constants/font_constants.dart';
import 'package:quran_app/app/constants/route_constants.dart';
import 'package:quran_app/presentation/widgets/appBar.dart';
import 'package:quran_app/presentation/widgets/product_widget.dart';

import '../../app/app_constants/color_constants.dart';
import '../../app/app_constants/style_constants.dart';
import '../widgets/search_bar_component.dart';

class EShop extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SimpleAppBar(
        title: 'Eshop',
        actionIcon: Icon(CupertinoIcons.bag_fill),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsetsDirectional.fromSTEB(23.w, 0, 23.w, 18.h),
              padding: EdgeInsetsDirectional.fromSTEB(10.w, 5.h, 0, 5.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: AppColors.icon_border_color,
                  border: Border.all(color: AppColors.BorderColor)),
              child: SearchBarComponent(
                barHeight: 35.h,
                hintText: "Search for Product",
                searchController: _searchController,
                onClear: () {},
                onSubmitted: (text) {},
                onChange: (text) {
                  print(text);
                },
              ),
            ),
            Divider(
              color: AppColors.dividerColor,
            ),
            SizedBox(
              height: 18.h,
            ),
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.9,
                aspectRatio: 21 / 9,
                // Customize carousel options here
                height: 150.h,
                // Set the height of the carousel
                enableInfiniteScroll: true,
                // Enable infinite scrolling
                autoPlay: true,
                // Enable auto play
                autoPlayInterval: Duration(seconds: 5),
                // Set auto play interval
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                onPageChanged: (index, reason) {
                  // setState(() {
                  //   _choiceIndex = index;
                  // });
                },
                // Animation duration
                autoPlayCurve: Curves.fastOutSlowIn, // Animation curve
              ),
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6.0.r),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Stack(
                      children: [
                        Image.asset(
                          AssetPaths.ESHOP_COVER_PATH,
                          fit: BoxFit.contain,
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(19.w, 18.h, 0, 0),
                          child: Text(
                            'Featured Products',
                            style: TextStyle(
                                fontSize: 9.sp,
                                fontFamily: INTER_MEDIUM,
                                color: AppColors.featured_green),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(19.w, 32.h, 0, 0),
                          child: SizedBox(
                            width: 140.w,
                            child: Text(
                              "Holy QUR’AN Packages",
                              maxLines: 2,
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 15.sp,
                                  fontFamily: INTER_BOLD,
                                  color: AppColors.featured_black),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(19.w, 77.h, 0, 0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: '89.00 AED', // default text style
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: AppColors.featured_black,
                                  fontFamily: INTER_REGULAR,
                                  fontSize: 11.sp),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '  80.00 AED',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: AppColors.featured_grey,
                                      fontFamily: INTER_BOLD,
                                      fontSize: 11.sp),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // FadeInImage.assetNetwork(
                  //   placeholder: 'assets/images/default_image.png',
                  //   fit: BoxFit.fill,
                  //   image: '',
                  // )
                  // Replace with your widget
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(23.w, 24.h, 23.w, 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Product',
                    style: AppTextStyles.sideHeadingStyle,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Filter',
                      style: AppTextStyles.viewAllStyle,
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 0.85,
              ),
              itemCount: 12,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteConstants.PRODUCT_DETAIL_SCREEN_PATH);
                  },
                  child: ProductWidget(
                    networkImageUrl:
                        'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTjESisouV6SKWb361DxMoP83ygw1aQUb3Fr5vwuZ6BDiH6IEJSAxz9NgMW6fnGH7RUKxbHoAvPMmQ2VLTVVN1EURW1kzDCVRKgmoZGP2bm&usqp=CAE',
                    productName: 'The Holy Qur\'an, luxurious binding.',
                    actualPrice: '89',
                    offerPrice: '50',
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
