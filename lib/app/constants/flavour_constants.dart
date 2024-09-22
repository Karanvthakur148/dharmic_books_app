import 'package:flutter_flavor/flutter_flavor.dart';

class AppFlavourConstants {
  static  String apiHost =  FlavorConfig.instance.variables["baseUrl"] ;

  static  String appName =  FlavorConfig.instance.variables["appTitle"];
  static  String accessToken =  FlavorConfig.instance.variables["accessToken"];
  static  String path =  FlavorConfig.instance.variables["assetPath"];
  static  bool showNetworkLogs =  FlavorConfig.instance.variables["showNetworkLogs"];
  static  String imageBaseUrl =  FlavorConfig.instance.variables["imagaBaseUrl"];
  static  String baseImageAsset =  FlavorConfig.instance.variables["MeriseBaseAsset"];
  static  String baseSvgAsset =  "assets/svgs/";
}
