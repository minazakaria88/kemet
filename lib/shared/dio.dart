import 'package:dio/dio.dart';

class DioHelper {

  static Dio? dio;
  static Dio? foodDio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/',
        receiveDataWhenStatusError: true,
      ),
    );
    foodDio=Dio(
      BaseOptions(
        baseUrl: 'https://www.themealdb.com/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getData({
    String? url,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(
      url!,
      queryParameters: query,
    );
  }

  static Future<Response> getDataFood({
    String? url,
    Map<String, dynamic>? query,
  }) async {
    return await foodDio!.get(
      url!,
      queryParameters: query,
    );
  }



}
