import 'dart:developer';

import 'package:dio/dio.dart';


/// No internet connection
const noInternetConnection = 'No internet connection';

/// global message error
const localError = 'Unexpected error, please try again letter';

/// App Interceptors
class AppInterceptors extends Interceptor {
  /// App Interceptors Constructor
  AppInterceptors();

  /// Header accept
  static const acceptHeader = 'accept';

  /// Header content encoding
  static const contentEncodingHeader = 'content-encoding';

  /// Header content length
  static const contentLengthHeader = 'content-length';

  /// Header content type
  static const contentTypeHeader = 'content-type';

  /// Header authorization
  static const authenticateHeader = 'Authorization';

  /// Header application json
  static const applicationJson = 'application/json';

  /// Header bearer
  static const bearer = 'Bearer ';

  

  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    
     

      options
        ..baseUrl = 'https://rickandmortyapi.com/api/'
        /// Redirects true
        ..followRedirects = true
        // Set a timeout of 10 seconds for the request
        ..connectTimeout = const Duration(seconds: 60)
        // Receive data with a timeout of some seconds
        ..receiveTimeout = const Duration(seconds: 60)
        // Send data with a timeout of some seconds
        ..sendTimeout = const Duration(seconds: 60);

      /// Add Header Accepted
      options.headers.addAll({
        Headers.acceptHeader: applicationJson,
        Headers.contentTypeHeader: applicationJson,
      });
      handler.next(options);
    // }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
     log( '401 error');
    } else {
      return handler.next(err);
    }
  }
}
