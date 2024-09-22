import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';


class AppOfflineBuilderConfig {
  buildOffline(getChild,{Widget? offlineWidgetScreen}){
    return OfflineBuilder(
      // connectivityBuilder: (
      //     BuildContext context,
      //     ConnectivityResult connectivityResult,
      //     Widget child
      //     ) {
      //   final bool connected = connectivityResult != ConnectivityResult.none;
      //   if(!connected) {
      //     return offlineWidgetScreen ?? Container();
      //   }
      //   return getChild;
      // },
      connectivityBuilder: (BuildContext context, List<ConnectivityResult> value, Widget child) {

          final bool connected = value != ConnectivityResult.none;
          if(!connected) {
            return offlineWidgetScreen ?? Container();
          }
          return getChild;
      },
      child: const SizedBox.shrink(),
    );
  }
}
