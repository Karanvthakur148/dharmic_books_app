
import 'package:quran_app/app/config/loader_config.dart';

class QuranAlert{

  static void showErrorAlert({
    String title = "",
    required String message,
    int duration = 2,
  }) {
    AppProgressHUD.showAndDismiss(message);
    // Get.snackbar(
    //   title,
    //   message,
    //   backgroundColor: Colors.black,
    //   colorText: Colors.white,
    //   duration: Duration(seconds: duration),
    // );
  }


  static void showSuccessAlert({
    String title = "",
    required String message,
    int duration = 2,
  }) {
    AppProgressHUD.showAndDismiss(message);
    // Get.snackbar(
    //   title,
    //   message,
    //   backgroundColor: Colors.black,
    //   colorText: Colors.white,
    //   duration: Duration(seconds: duration),
    // );
  }
}