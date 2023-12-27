import 'package:dio/dio.dart';
import 'package:shop_app/network/end_points.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASEURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Response> postData({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? parameter,
    String? token,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'authorization': token
    };
    return await dio.post(url, queryParameters: parameter, data: body);
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? parameter,
    String? token,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'authorization': token
    };
    return await dio.get(url, queryParameters: parameter);
  }
}
