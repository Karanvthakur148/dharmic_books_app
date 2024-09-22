import 'dart:convert';

import 'package:flutter/services.dart';

class QuranEnvConfig {
 Future<Map<String,dynamic>> getJson({String jsonPath=""}) async{
    String data =  await rootBundle.loadString(jsonPath);
    return  json.decode(data.toString());
  }
}

