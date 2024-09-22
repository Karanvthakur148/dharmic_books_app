import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_app/app/app_constants/hive_constants.dart';
import 'package:quran_app/model/Auth/loginStatus/login_status.dart';

class QuranHiveConfig{
  Box? box;
  String boxName=AppHiveConstant.QURAN;
  factory QuranHiveConfig() => _singleton;

  QuranHiveConfig._internal();

  static final QuranHiveConfig _singleton = QuranHiveConfig._internal();

  initConfig() async {
    await Hive.initFlutter();
    Hive.registerAdapter<LoginStatus>(LoginStatusAdapter());
    await Hive.openBox(boxName);
  }

  Box getHiveConfig(){
    box= Hive.box(boxName);
    return box!;
  }
}