import 'package:flutter_flavor/flutter_flavor.dart';

class AppFlavourConfig {

  factory AppFlavourConfig() => _singleton;

  AppFlavourConfig._internal();

  static final AppFlavourConfig _singleton = AppFlavourConfig._internal();

  initConfig(Map<String, dynamic> json) {
    FlavorConfig(variables: json);
  }

  updateConfig(Map<String, dynamic> json) {
    Map<String, dynamic> baseConfig = FlavorConfig.instance.variables;
    baseConfig.addAll(json);
    print("updateConfig");
    print(baseConfig);
    FlavorConfig(variables: baseConfig);
  }

}

