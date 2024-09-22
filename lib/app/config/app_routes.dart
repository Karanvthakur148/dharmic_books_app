
import 'package:flutter/material.dart';
import 'package:quran_app/app/config/offline_builder.dart';
import 'package:quran_app/app/constants/route_constants.dart';
import 'package:quran_app/presentation/auth/create_account/create_account.dart';
import 'package:quran_app/presentation/dashboard/dashoard.dart';
import 'package:quran_app/presentation/eshop/eshop.dart';
import 'package:quran_app/presentation/eshop/product_detail_screen/product_detail.dart';
import 'package:quran_app/presentation/splash/splash_screen.dart';

import '../../presentation/auth/login/login_screen.dart';


class AppRoutes {
  Route generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
        builder: (_) => AppOfflineBuilderConfig().buildOffline(
            getScreen(routeSettings),
            offlineWidgetScreen: Container()),
        settings: routeSettings);
  }

  Widget getScreen(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    print("==============> ROUTE : ${routeSettings.name}");
    switch (routeSettings.name) {
      case "/":
        return SplashScreen();

      case RouteConstants.LOGIN_SCREEN:
        return LoginScreen();

      case RouteConstants.CREATE_ACCOUNT_PATH:
        return CreateAccount();

      case RouteConstants.DASHBOARD_PATH:
        return Dashoard();

      case RouteConstants.ESHOP_PATH:
        return EShop();

      case RouteConstants.PRODUCT_DETAIL_SCREEN_PATH:
        return ProductDetail();

      default:
        return SplashScreen();

    }
  }
}
