import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/app/app_constants/assets_path.dart';
import 'package:quran_app/app/app_constants/hive_constants.dart';
import 'package:quran_app/app/config/hive_config.dart';
import 'package:quran_app/presentation/auth/login/login_screen.dart';

import '../../app/constants/route_constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getInitRoute();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPaths.SPLASH_BG),
            fit: BoxFit.cover,
          ),
        ),
      child: Column(
        children: [
          SizedBox(height: 60.h,),
          Image.asset(AssetPaths.SPLASH_LOGO),
          SizedBox(height: 50.h,),
          Image.asset(AssetPaths.SPLASH_BOOK),
        ],
      ),
    );
  }

  void getInitRoute() {
    // QuranDio().setDio();
    // String? loginStatus = QuranPreferenceConfig.getString(PreferenceConstants.loggedIn);
    // if(loginStatus!.isNotEmpty){
    //   final jsonDecoded = jsonDecode(loginStatus);
    //   LoginResponse? model = LoginResponse.fromJson(jsonDecoded);
    //   context.read<LoginCubit>().setLoginResponse(model);

    Timer(const Duration(seconds: 2), () {
      QuranHiveConfig().getHiveConfig().put(AppHiveConstant.LoginStatus, false);
      Navigator.of(context).pushNamed(RouteConstants.LOGIN_SCREEN);
    });
  }
}
