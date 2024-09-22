// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../app_constants/assets_path.dart';
//
// class MetaImageNetworkView extends StatelessWidget {
//   String url;
//   double wd;
//   double ht;
//   BoxFit bf;
//   MetaImageNetworkView({required this.url,this.wd=60,this.ht=60, this.bf=BoxFit.cover});
//
//   @override
//   Widget build(BuildContext context) {
//     return  FadeInImage.assetNetwork(
//       width: wd.h,
//       height: ht.h,
//       placeholder: 'assets/images/square_placeholder.jpg',
//       fit: bf,
//       image: url,
//       imageErrorBuilder:(BuildContext context, Object exception, StackTrace? stackTrace){
//         return Image.asset(AssetPaths.SAMPLE_STATION_IMAGE,height: ht.h,width: wd.h,);
//       } ,
//     );
//
//   }
//   Widget errorImg(){
//     return Container();
//   }
// }
