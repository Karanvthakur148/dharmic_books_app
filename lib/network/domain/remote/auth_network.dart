import 'package:dio/dio.dart';
import 'package:quran_app/network/dio/dio_client.dart';

class AuthNetwork{

  Future<dynamic> loginRequest(Map<String, String> data) async {
    try {
      final responseJson = await QuranDio().getWrapper().post(
        "/auth/login",
        data:data,
        loadingMessage:"Logging In...",
        //  queryParameters:data,
      );
      return responseJson.data;
    } on DioError catch (e) {
      print("DioError"+e.toString());
      return ;

    }catch(e){
      print("CatchError"+e.toString());
      return;
    }
  }

  Future<dynamic> SignUpRequest(Map<String, String> data) async {
    try {
      final responseJson = await QuranDio().getWrapper().post(
        "/auth/register",
        data:data,
        loadingMessage:"Requesting...",
        //  queryParameters:data,
      );
      return responseJson.data;
    } on DioError catch (e) {
      print("DioError"+e.toString());
      return ;

    }catch(e){
      print("CatchError"+e.toString());
      return;
    }
  }

}