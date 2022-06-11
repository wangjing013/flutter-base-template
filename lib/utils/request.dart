import 'package:dio/dio.dart';
import 'interceptor.dart';

// 创建单实例
class Request {
  late Dio dio;
  static final Request _instance = Request._internal();
  factory Request() => _instance;
  Request._internal() {
    dio = Dio(BaseOptions(
      baseUrl: '',
      connectTimeout: 20000,
      receiveTimeout: 3000,
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    ));
    dio.interceptors.add(CustomInterceptors());
    dio.interceptors.add(LogInterceptor(responseBody: false));
  }

  Future get(path, {dynamic params, Options? options}) async {
    Options requestOptions = options ?? Options();
    var response = await dio.get(
      path,
      queryParameters: params,
      options: requestOptions,
    );
    return response.data;
  }

  Future post(path, {dynamic data, Options? options}) async {
    Options requestOptions = options ?? Options();
    var response = await dio.post(path, data: data, options: requestOptions);
    return response.data;
  }
}
