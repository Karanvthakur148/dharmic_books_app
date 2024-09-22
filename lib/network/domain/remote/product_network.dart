import 'package:dio/dio.dart';
import 'package:quran_app/network/dio/dio_client.dart';

class ProductNetwork{

  Future<dynamic> getProductList(Map<String,dynamic> data) async {
    try {
      final responseJson = await QuranDio().getWrapper().get(
        "/product/list",
        loadingMessage:"Loading.....",
        enableBearer:true,
        queryParameters:data,
      );
      return responseJson.data["data"];

    } on DioError catch (e) {
      print("DioError"+e.toString());
      return e;

    }catch(e){
      print("CatchError"+e.toString());
      return e;
    }
  }
}