import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://hawabc.herokuapp.com',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData({
    required String url,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
  static Future<Response> postData({
    required String url,
    required data,
    Map<String, dynamic>? query,
    String? token,
    String? contentType,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
     'Authorization': 'Bearer ${token}',
    };
    return await dio.post(
      url,
      options: Options(
        contentType: contentType,
      ),
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    required String lang,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}',
      'Accept-Language': lang,
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
