// ignore_for_file: unnecessary_null_comparison, always_declare_return_types

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
// import 'package:workapp/widgets/toast.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workapp/helpers/shared.dart';
import 'package:workapp/screens/splash/view.dart';
import 'package:workapp/widgets/toast.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://www.billionaire.spider-te8.com/api/',
          receiveDataWhenStatusError: true),
    );
    dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  static Future<Response?> getData({
    path,
    queryParameters,
  }) async {
    try {
      return await dio!.get(path,
          queryParameters: queryParameters,
          options: Options(validateStatus: (_) => true, headers: {
            if (CashedHelper.getUserToken().isNotEmpty)
              'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
            'Accept': "application/json",
            'content-type': 'application/json',
            'lang': CashedHelper.getLang()
          }));
    } on SocketException catch (e) {
      log(e.message);
      errorToast(e.message);
    } on DioException catch (e) {
      log(e.message.toString());
      String errorMsg = _handleResponse(e.response!);
      errorToast(errorMsg);
    }
    return null;
  }

  static Future<Response?> putData({
    path,
    data,
  }) async {
    try {
      return await dio!.put(path,
          data: data,
          options: Options(validateStatus: (_) => true, headers: {
            if (CashedHelper.getUserToken().isNotEmpty)
              'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
            'Accept': "application/json",
            'content-type': 'application/json',
            'lang': CashedHelper.getLang()
          }));
    } on SocketException catch (e) {
      log(e.message);
      errorToast(e.message);
    } on DioException catch (e) {
      log(e.message.toString());
      String errorMsg = _handleResponse(e.response!);
      errorToast(errorMsg);
    }
    return null;
  }

  static Future<Response?> postData({path, data}) async {
    try {
      return await dio!.post(
        path,
        data: data,
        options: Options(
          contentType: 'application/json',
          headers: {
            if (CashedHelper.getUserToken().isNotEmpty)
              'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
            'Accept': 'application/json',
            'lang': CashedHelper.getLang(),
          },
          followRedirects: false,
        ),
      );
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        errorToast(e.response!.data['message']);
        if (e.response!.data['message'] == 'Unauthenticated.') {
          clearCachedData();
          // RouteManager.navigateAndPopAll(const SplashScreen());
        }
        // print('Error type: ${e.type}');
        // print('Error message: ${e.message}');
        // if (e.response != null) {
        //   print('HTTP status code: ${e.response?.statusCode}');
        //   print('Response data: ${e.response?.data}');
        //   print('Response headers: ${e.response?.headers}');
        // }
      } else {
        // Non-Dio error
        print('Error: $e');
      }
    }
    return null;
  }

  static String _handleResponse(Response response) {
    if (response == null) {
      var jsonResponse = 'connection error';
      return jsonResponse;
    }
    switch (response.statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        var jsonResponse = 'UnAuth';
        return jsonResponse;
      case 403:
        var jsonResponse = 'UnAuth';
        return jsonResponse;
      case 404:
        var jsonResponse = 'Not found';
        return jsonResponse;
      case 405:
        var jsonResponse = 'Not found';
        return jsonResponse;
      case 422:
        var jsonResponse = 'Mthod not allowed';
        return jsonResponse;
      case 500:
        var jsonResponse = 'server error';
        return jsonResponse;
      default:
        var jsonResponse = 'server error';
        return jsonResponse;
    }
  }
}

Future<void> clearCachedData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
}


// // ignore_for_file: unnecessary_null_comparison, always_declare_return_types
// import 'package:dio/dio.dart';
// import 'dart:developer';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:workapp/helpers/shared.dart';
// import 'package:workapp/widgets/toast.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DioConfiguration {
//   static Dio? _dio;

//   static Dio getDio() {
//     if (_dio == null) {
//       _dio = Dio(
//         BaseOptions(
//           baseUrl: 'https://www.billionaire.spider-te8.com/api/',
//           receiveDataWhenStatusError: true,
//         ),
//       );
//       _dio!.interceptors.add(
//         PrettyDioLogger(
//           requestHeader: true,
//           requestBody: true,
//           responseBody: true,
//           responseHeader: true,
//           error: true,
//           compact: true,
//           maxWidth: 90,
//         ),
//       );
//     }
//     return _dio!;
//   }
// }

// class DioHelper {
//   static final Dio _dio = DioConfiguration.getDio();

//   static Future<Response?> getData({
//     String? path,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final response = await _dio.get(
//         path!,
//         queryParameters: queryParameters,
//         options: Options(validateStatus: (_) => true, headers: _getHeaders()),
//       );
//       return response;
//     } catch (e) {
//       _handleError(e);
//       return null;
//     }
//   }

//   static Future<Response?> delete({
//     String? path,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final response = await _dio.delete(
//         path!,
//         queryParameters: queryParameters,
//         options: Options(validateStatus: (_) => true, headers: _getHeaders()),
//       );
//       return response;
//     } catch (e) {
//       _handleError(e);
//       return null;
//     }
//   }

//   static Future<Response?> putData({
//     String? path,
//     dynamic data,
//   }) async {
//     try {
//       final response = await _dio.put(
//         path!,
//         data: data,
//         options: Options(validateStatus: (_) => true, headers: _getHeaders()),
//       );
//       return response;
//     } catch (e) {
//       _handleError(e);
//       return null;
//     }
//   }

//   static Future<Response?> postData({
//     String? path,
//     dynamic data,
//   }) async {
//     try {
//       final response = await _dio.post(
//         path!,
//         data: data,
//         options: Options(
//           contentType: 'application/json',
//           headers: _getHeaders(),
//           followRedirects: false,
//         ),
//       );
//       return response;
//     } catch (e) {
//       _handleError(e);
//       return null;
//     }
//   }

//   static Map<String, dynamic> _getHeaders() {
//     final headers = {
//       'Accept': 'application/json',
//       'content-type': 'application/json',
//       // 'lang': CashedHelper.getLang(),
//     };
//     final userToken = CashedHelper.getUserToken();
//     if (userToken.isNotEmpty) {
//       headers['Authorization'] = 'Bearer $userToken';
//     }
//     return headers;
//   }

//   static void _handleError(dynamic error) {
//     if (error is DioException) {
//       final response = error.response;
//       if (response != null) {
//         customToast(response.data['message']);
//         if (response.data['message'] == 'Unauthenticated.') {
//           clearCachedData();
//         }
//       } else {
//         log(error.message.toString());
//         errorToast(error.message.toString());
//       }
//     } else {
//       log(error.toString());
//       errorToast(error.toString());
//     }
//   }

//   static void customActionForUserNotFound() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.clear();
//     // RouteManager.navigateAndPopAll(SplashScreen());
//   }
// }

// Future<void> clearCachedData() async {
//   print('Clearing cached data...');
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.clear();
//   print('Cached data cleared.');
//   // RouteManager.navigateAndPopAll(SplashScreen());
// }
