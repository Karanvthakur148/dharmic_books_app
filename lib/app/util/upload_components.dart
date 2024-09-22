//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:merise/app/app_constants/color_constants.dart';
//
// import 'dart:io';
//
// import '../../presentation/components/dialog_upload_picker.dart';
// import 'image_network_view.dart';
//
//
// class UploadComponent extends StatelessWidget {
//   final Function(String)? onPressed;
//   String? url;
//   String? file;
//   String? type;
//   CropAspectRatio? imageAspectratio;
//   UploadComponent({required this.onPressed,this.url,this.file,this.type,this.imageAspectratio});
//   XFile? image;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () async{
//           await showDialog(
//               context: context,
//               builder: (_) => DialogUploadPicker(onSelected:(value){
//                 flow(value);
//               }));
//         },
//         child: Container(
//           height:type=="cover" ? 65.h: 65.h,
//           width: type=="cover"? 65.h: 65.h,
//           child: ClipRRect(
//               borderRadius: BorderRadius.circular(6.r),
//               child: getView()
//           ),
//         )
//     );
//   }
//
//   getView(){
//
//     if(file!=null){
//       return Image.file(File(file!) ,fit: BoxFit.cover,);
//       // Container(
//       //     height: 45.h,
//       //     width: 45.h,
//       //     decoration: BoxDecoration(
//       //         borderRadius: BorderRadius.circular(15.r)),
//       //   child: Image.file(File(file!),fit: BoxFit.cover,),
//       // );
//     }
//     if(url!=null){
//       return MetaImageNetworkView(url :url!);
//     }
//
//     return AbsorbPointer(
//       child:                         Container(
//         padding: EdgeInsets.all(28),
//         height: 80.h,
//         width: 80.h,
//         color: Colors.blueGrey,
//         // decoration: BoxDecoration(
//         //   image: DecorationImage(image: SvgPicture.asset('assets/iages/car_default.svg').image)
//         // ),
//         child: SvgPicture.asset(
//           'assets/images/add_Camara_icon.svg',
//           width: 24.w,
//           height: 24.h,
//         ),
//       ),
//     );
//   }
//
//
//
//   void flow(String text) async {
//
//     if(text=="Camera"){
//       final ImagePicker picker = ImagePicker();
//       final XFile? image = await picker.pickImage(source: ImageSource.camera, imageQuality: 1,
//           maxHeight: 400,maxWidth: 400
//       );
//       if (image != null) {
//         onPressed!(image.path);
//       }
//     }else if(text=="Gallery"){
//       final ImagePicker picker = ImagePicker();
//       image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 100,
//           maxHeight: 400,maxWidth: 400
//       );
//       if (image != null) {
//         // onPressed!(image!.path);
//         _cropImage();
//       }
//     }
//
//   }
//
//   Future<void> _cropImage() async {
//     if (image != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         aspectRatio: imageAspectratio,
//         sourcePath: image!.path,
//         compressFormat: ImageCompressFormat.jpg,
//         compressQuality: 100,
//         uiSettings: [
//           AndroidUiSettings(
//               toolbarTitle: 'Cropper',
//               toolbarColor: MsColors.primaryColor,
//               toolbarWidgetColor: Colors.white,
//               hideBottomControls: true,
//               lockAspectRatio: false),
//         ],
//       );
//       if (croppedFile != null) {
//         onPressed!(croppedFile.path);
//         // setState(() {
//         //
//         // });
//       }
//     }
//   }
// }
