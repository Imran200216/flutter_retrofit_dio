import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient._internal(this.dio);

  factory DioClient() {
    final dio = Dio(
      BaseOptions(
        // Base url
        baseUrl: "https://dummyjson.com",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    // Add interceptors
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return DioClient._internal(dio);
  }
}
