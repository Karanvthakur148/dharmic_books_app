import 'package:dio/dio.dart';
import 'package:quran_app/app/config/loader_config.dart';
import 'package:quran_app/app/constants/network_constants.dart';
import 'package:quran_app/app/util/show_alert.dart';
import 'package:quran_app/network/dio/dio_client.dart';


abstract class BaseDioWrapper {
  Future<Response<T>> get<T>(
      String path, {
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        ProgressCallback onReceiveProgress,
        bool showLoader,
        bool enableBearer,
        String loadingMessage,
      });

  Future<Response<T>> post<T>(
      String path, {
        data,
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
        bool showLoader,
        bool enableBearer,
        String loadingMessage,
      });

  // Future<Response> getUri(
  //     Uri uri, {
  //       Options options,
  //       CancelToken cancelToken,
  //       ProgressCallback onReceiveProgress,
  //       bool showLoader,
  //       String loadingMessage,
  //     });

  Future<Response> patch(
      String path, {
        data,
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
        bool showLoader,
        String loadingMessage,
      });

  Future<Response<T>> put<T>(
      String path, {
        data,
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
        bool showLoader,
        bool enableBearer,
        String loadingMessage,
      });

  Future<Response> delete(
      String path, {
        data,
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        bool showLoader,
        String loadingMessage,
        bool enableBearer,
      });
}

class QuranDioWrapper implements BaseDioWrapper {
  final Dio _dio;

  QuranDioWrapper(this._dio);

  void showHUD({required String? message}) {
    AppProgressHUD.showLoading(text: message.toString());
  }

  void hideHUD() {
    AppProgressHUD.dismiss();
  }

  void showErrorHUD({required String message}) {
    AppProgressHUD.showErrorAndDismiss(text: message);
  }

  @override
  Future<Response<T>> get<T>(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
        bool showLoader = false,
        bool enableBearer = false,
        String? loadingMessage,
      }) async {
    if (showLoader) showHUD(message: loadingMessage);

    if (!enableBearer){
      options=Options();
    }else {
      if(options==null) {
        options = QuranDio().getOptions();
      }

    }

      print("options");
      print(options.headers);

      try {
        Response<T> response = await _dio.get(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
        var dataMap;
        try {
         dataMap = response.data as Map<String, dynamic>;
        }catch(e){
        dataMap = response.data as List;
        }

        try {
          QuranAlert.showSuccessAlert(
            message: dataMap["message"],
          );
        }catch(e){
          print("Model ERROR RESPONSE===========> ");
        }


        return response;
      } on DioError catch (e) {
        print("PARSE ERROR RESPONSE===========> "+e.response.toString());
        parseErrorResponse(e);
        // Logger.captureException(e, stackTrace: stackTrace);
        rethrow;
      } catch (e) {
        // Logger.captureException(e, stackTrace: stackTrace);
        rethrow;
      } finally {
        if (showLoader) hideHUD();
      }
  }

  @override
  Future<Response<T>> post<T>(
      String path, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        bool? showLoader = true,
        bool? enableBearer = false,
        String? loadingMessage,
      }) async {
    if (showLoader!) showHUD(message: loadingMessage);

    if (!enableBearer!){
      options=Options();
    }else {
      if(options==null) {
        options = QuranDio().getOptions();
      }
    }

    try {
      Response<T> response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      try {
        Map<String,dynamic> dataMap = response.data as Map<String, dynamic>;
        QuranAlert.showSuccessAlert(
          message: dataMap["message"],
        );
      }catch(e){
        print("Model ERROR RESPONSE===========> ");
        return response ;
      }

      return response;
    } on DioError catch (e) {
      print("PARSE ERROR RESPONSE===========> "+e.response.toString());
      parseErrorResponse(e);
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } catch (e) {
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } finally {
      if (showLoader) hideHUD();
    }
  }

  @override
  Future<Response> patch(
      String path, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        bool? showLoader = true,
        String? loadingMessage,
      }) async {
    if (showLoader!) showHUD(message: loadingMessage);
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioError catch (e) {
      parseErrorResponse(e);
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } catch (e) {
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } finally {
      if (showLoader) hideHUD();
    }
  }

  @override
  Future<Response<T>> put<T>(
      String path, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        bool? showLoader = true,
        bool? enableBearer = false,
        String? loadingMessage,
      }) async {
    if (showLoader!) showHUD(message: loadingMessage);
    if (!enableBearer!){
      options=Options();
    }else {
      if (options == null) {
        options = QuranDio().getOptions();
      }
    }
    try {
      Response<T> response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );



      // Map<String,dynamic> dataMap = response.data as Map<String, dynamic>;
      //
      // MeriseAlert.showSuccessAlert(
      //   message: dataMap["message"],
      // );

      return response;
    } on DioError catch (e) {
      print("PARSE ERROR RESPONSE===========> "+e.response.toString());
      parseErrorResponse(e);
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } catch (e) {
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } finally {
      if (showLoader) hideHUD();
    }
  }

  @override
  Future<Response> delete(
      String path, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        bool? showLoader = true,
        String? loadingMessage,
        bool enableBearer = false,
      }) async {
    if (showLoader!) showHUD(message: loadingMessage);

    if (!enableBearer){
      options=Options();
    }else {
      if(options==null) {
        options = QuranDio().getOptions();
      }
    }
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (e) {
      parseErrorResponse(e);
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } catch (e) {
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } finally {
      if (showLoader) hideHUD();
    }
  }

  // @override
  // Future<Response> getUri(
  //     Uri uri, {
  //       Options? options,
  //       CancelToken? cancelToken,
  //       ProgressCallback? onReceiveProgress,
  //       bool? showLoader = false,
  //       String? loadingMessage,
  //     }) async {
  //   if (showLoader!) showHUD(message: loadingMessage);
  //   try {
  //     final response = await _dio.getUri(
  //       uri,
  //       options: options,
  //       cancelToken: cancelToken,
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     return response;
  //   } on DioError catch (e, stackTrace) {
  //     parseErrorResponse(e);
  //     if (showLoader) hideHUD();
  //   }
  // }
  void parseErrorResponse(DioError e) async {
    // if (ignoreStatusCodes.contains(e.response!.statusCode)) {
    //   return;
    // }
    String errorMessage = e.response!.data['message'];
    print("parseBadRequestError : "+errorMessage);
    if (errorMessage.isEmpty || errorMessage == "") {
      QuranAlert.showErrorAlert(
        title: NetworkStringConstants.serverError,
        message: NetworkStringConstants.somethingWentwrong,
      );
    } else {
      QuranAlert.showErrorAlert(
        message: errorMessage,
      );
    }
  }
  static String parseBadRequestError(dynamic errorObj) {
    Map errors = {};
    String errorMessage = "";
    try {
      if (errorObj is Map) {
        errorObj.forEach((k, v) {
          print('${k}: ${v}');
          if (v is String) {
            errorMessage += "${k}: ${v} \n";
          } else if (v is List) {
            errorMessage += "${k}: ${v.join(",")} \n";
          }
        });
      } else if (errorObj is List) {
        errorObj.forEach((v) {
          if (v is String) {
            errorMessage += "${v} \n";
          } else if (v is List) {
            errorMessage += "${v.join(",")} \n";
          }
        });
      } else if (errorObj is String) {
        errorMessage = errorObj;
      }
    } catch (e) {

      // Do nothing
    }

    if (errorMessage.isEmpty) {
      errorMessage = "Invalid Request!";
    }
    return errorMessage;
  }
}
