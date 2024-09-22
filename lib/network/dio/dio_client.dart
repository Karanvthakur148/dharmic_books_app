import 'package:dio/dio.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:quran_app/app/constants/flavour_constants.dart';
import 'package:quran_app/app/util/show_alert.dart';
import 'package:quran_app/network/dio/dio_wrapper.dart';
List noErrorEndpointTags = ['app_usage_metric'];

class QuranDio {
  static final QuranDio _singleton = QuranDio._internal();

  final Options options = Options();
  Options? multipartOptions = Options();
  String token="";

  factory QuranDio() {
    return _singleton;
  }

  QuranDio._internal();

  Dio _dio = Dio(BaseOptions(
    baseUrl: AppFlavourConstants.apiHost,
    connectTimeout: Duration(seconds: 45000), // 45 secs
    receiveTimeout: Duration(
        seconds:
            45000), // 5 secs Note: This is not the receiving time limitation. Only Error.
  ));

  getWrapper() {
    return QuranDioWrapper(_dio);
  }

  setDio() {
    _dio = addInterceptors(_dio);

    _dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      // Handle trial version patient app
      return handler.next(options);
    }, onResponse:
        (Response response, ResponseInterceptorHandler handler) async {
      // Do something with response data
      print("=========> RESPONSE SUCCESS");
      return handler.next(response);
    }, onError: (DioError e, ErrorInterceptorHandler handler) async {
      // Do something with response error
      print("=========> RESPONSE ERRROR");
      if (!shouldShowError(e.requestOptions.path)) {
        return handler.next(e);
      }
      if (e.response == null && shouldShowError(e.requestOptions.path)) {
        QuranAlert.showErrorAlert(
          title: 'Network Failure',
          message: 'Please check your network connectivity!',
        );
      }
      return handler.next(e);
    }));

    //addHeaders();

    return QuranDioWrapper(_dio);
  }

  Dio addPrettyInterceptors(Dio dio) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        canShowLog: true,

        // logPrint: dio.
      ),
    );
    return dio;
  }

  addInterceptors(Dio dio) {
    if (AppFlavourConstants.showNetworkLogs) {
      _dio = addPrettyInterceptors(_dio);
      print("added PrettyInterceptors");
    }
    print("HEADERS : " + dio.options.headers.toString());

    return dio;
  }

  // addHeaders() {
  //   print("Adding headers");
  //
  //   options!.headers = {
  //       'Accept': 'application/json',
  //     };
  //
  //     if (authTokens != null && authTokens.isNotEmpty) {
  //     options!.headers = {
  //         'Authorization': 'Bearer $authTokens',
  //         'Accept': 'application/json',
  //       };
  //     }
  // }

  Options getOptions() {



    // if (FirstBoxFlavourConstants.accessToken != null &&
    //     FirstBoxFlavourConstants.accessToken.isNotEmpty) {
    //   return Options(headers: {
    //     'Authorization': 'Bearer ${FirstBoxFlavourConstants.accessToken}',
    //     'Accept': 'application/json',
    //   });
    // }
    //
    // return Options(headers: {'Accept': 'application/json'});

    try {
      token = AppFlavourConstants.accessToken;

    }catch(e){
      print(e);
    }
    if (token!= null && token.isNotEmpty
    ) {

      return Options(headers:{
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      } ) ;

    }

    return Options(headers:{
      'Accept': 'application/json'
    } ) ;
  }

  Options getMultipartOptions() {
    return Options(headers: {
      'Authorization': 'Bearer ${token}',
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
    });
  }

  bool shouldShowError(String url) {
    for (var tag in noErrorEndpointTags) {
      if (url.contains(tag)) return false;
    }
    return true;
  }
}
