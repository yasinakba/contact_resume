import 'package:dio/dio.dart';

class DioHandler {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://69340db94090fe3bf01ec3c2.mockapi.io/contact/get',
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ),
  );

  static Dio get instance => _dio;

  static Future<Response> getRequest(String endpoint) async {
    try {
      return await _dio.get('/$endpoint');
    } on DioError catch (e) {
      throw Exception(_handleError(e));
    }
  }

  static Future<Response> postRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      return await _dio.post('/$endpoint', data: data);
    } on DioError catch (e) {
      throw Exception(_handleError(e));
    }
  }

  static Future<Response> putRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      return await _dio.put('/$endpoint', data: data);
    } on DioError catch (e) {
      throw Exception(_handleError(e));
    }
  }

  static Future<Response> deleteRequest(String endpoint) async {
    try {
      return await _dio.delete('/$endpoint');
    } on DioError catch (e) {
      throw Exception(_handleError(e));
    }
  }

  static String _handleError(DioException error) {
    switch (error.type) {      case DioExceptionType.connectionTimeout:
      return "Connection Timeout";
      case DioExceptionType.sendTimeout:
        return "Send Timeout";
      case DioExceptionType.receiveTimeout:
        return "Receive Timeout";
      case DioExceptionType.badCertificate:
        return "Bad Certificate";
      case DioExceptionType.badResponse:
        return "Server Error: ${error.response?.statusCode}";
      case DioExceptionType.cancel:
        return "Request Cancelled";
      case DioExceptionType.connectionError:
        return "Connection Error";
      case DioExceptionType.unknown:
        return "Unexpected Error: ${error.message}";
    }
  }

}
