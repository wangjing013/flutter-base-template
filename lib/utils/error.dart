import 'package:dio/dio.dart';

/*
* error统一处理
*/
class ErrorEntity implements Exception {
  int code;
  String? message;
  ErrorEntity({required this.code, this.message});

  String toString() {
    if (message == null) return "Exception";
    return "Exception: code $code, $message";
  }
}

ErrorEntity createErrorEntity(DioError error) {
  switch (error.type) {
    case DioErrorType.cancel:
      {
        return ErrorEntity(code: -1, message: "请求取消");
      }
    case DioErrorType.connectTimeout:
      {
        return ErrorEntity(code: -1, message: "连接超时");
      }
    case DioErrorType.sendTimeout:
      {
        return ErrorEntity(code: -1, message: "请求超时");
      }

    case DioErrorType.receiveTimeout:
      {
        return ErrorEntity(code: -1, message: "响应超时");
      }
    case DioErrorType.response:
      {
        try {
          int? errCode = error.response?.statusCode;
          if (errCode == null) {
            return ErrorEntity(code: -2, message: error.message);
          }
          switch (errCode) {
            case 400:
              {
                return ErrorEntity(
                    code: errCode,
                    message: error.response?.data['message'] ?? "请求语法错误");
              }

            case 401:
              {
                return ErrorEntity(
                    code: errCode,
                    message: error.response?.data['message'] ?? "没有权限");
              }

            case 403:
              {
                return ErrorEntity(
                    code: errCode,
                    message: error.response?.data['message'] ?? "服务器拒绝执行");
              }
            case 404:
              {
                return ErrorEntity(code: errCode, message: "无法连接服务器");
              }
            case 405:
              {
                return ErrorEntity(
                    code: errCode,
                    message: error.response?.data['message'] ?? "请求方法被禁止");
              }
            case 500:
              {
                return ErrorEntity(code: errCode, message: "服务器内部错误");
              }
            case 502:
              {
                return ErrorEntity(code: errCode, message: "无效的请求");
              }
            case 503:
              {
                return ErrorEntity(
                    code: errCode,
                    message: error.response?.data['message'] ?? "服务器挂了");
              }
            case 505:
              {
                return ErrorEntity(
                    code: errCode,
                    message: error.response?.data['message'] ?? "不支持HTTP协议请求");
              }
            default:
              {
                return ErrorEntity(
                    code: errCode, message: error.response?.data['message']);
              }
          }
        } on Exception catch (_) {
          return ErrorEntity(code: -1, message: "未知错误");
        }
      }
    default:
      {
        return ErrorEntity(code: -1, message: error.message);
      }
  }
}
