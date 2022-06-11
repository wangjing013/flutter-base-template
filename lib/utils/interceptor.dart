// 自定义拦截器
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'error.dart';

class CustomInterceptors extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    ErrorEntity eInfo = createErrorEntity(err);
    // 错误提示
    EasyLoading.showInfo(eInfo.message.toString());
    handler.next(err);
  }
}
