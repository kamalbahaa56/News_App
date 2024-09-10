import 'package:dio/dio.dart';

class DioHelper {
  //final dio = Dio();
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      String url, Map<String, dynamic> query) async {
    //  return await dio!.get(url, queryParameters: query);

    try {
      print('Requesting: $url with parameters: $query');
      Response response = await dio!.get(url, queryParameters: query);
      return response;
    } on DioException catch (e) {
      // Handle Dio specific exceptions
      if (e.response != null) {
        print('Dio error! Status code: ${e.response!.statusCode}');
        print('Response data: ${e.response!.data}');
        print('Request was: ${e.requestOptions.uri}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
      // Optionally, you can rethrow the exception if you want it to propagate further
      throw e;
    } catch (e) {
      // Handle any other type of exception
      print('Unexpected error: $e');
      throw e;
    }
  }

  // Future<Response?> getMethod(String url, Map<String, dynamic> qurey) async {
  //   try {
  //     // dio = Dio(
  //     //   BaseOptions(
  //     //     baseUrl: 'https://newsapi.org/v2/top-headlines' , receiveDataWhenStatusError: true
  //     //   )
  //     // );
  //     final Response response = await dio.get(url, queryParameters: qurey);
  //     return response;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }
}
