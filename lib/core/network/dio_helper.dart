import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/network/dio_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

/// Handle Http Request class
class DioHelper {
  /// Initialize Dio
  Dio init() {
    final dio = Dio();

    // Add interceptors
    dio.interceptors.addAll([
      AppInterceptors(),
      TalkerDioLogger(),
    ]);

    return dio;
  }
}
