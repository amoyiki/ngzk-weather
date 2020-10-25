

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:ngzk_weather/common/utils/storage.dart';
import 'package:ngzk_weather/common/values/values.dart';

/**
 * 单例模式， 维护一个http工具类实例，方便复用
 */
class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  Dio dio;
  CancelToken cancelToken = new CancelToken();

  HttpUtil._internal() {
    // BaseOptions Options RequestOption 都可以配置参数
    BaseOptions options = new BaseOptions(
      // 请求地址前缀
      baseUrl: SERVER_API_URL,
      // 链接服务器超时时间
      connectTimeout: GLOBAL_CONN_TIME_OUT,
      // 响应超时时间
      receiveTimeout: GLOBAL_RECE_TIME_OUT,
      // http 头部
      headers: {},
      // 请求体类型
      contentType: 'application/json; charset=utf-8',
      // 响应类型
      responseType: ResponseType.json,
    );
    dio = new Dio(options);
    // Cookie 管理
    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    // 添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("请求之前");
      return options;
    }, onResponse: (Response response) {
      print("响应之前");
      return response;
    }, onError: (DioError e) {
      print("错误之前");
      return e;
    }));
  }

  /// error 统一处理
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        {
          return ErrorEntity(code: -1, message: "请求取消");
        }
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "连接超时");
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "请求超时");
        }
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "响应超时");
        }
        break;
      case DioErrorType.RESPONSE:
        {
          try {
            int errCode = error.response.statusCode;
            switch (errCode) {
              case 400:
                {
                  return ErrorEntity(code: errCode, message: "请求服务器语法错误");
                }
                break;
              case 401:
                {
                  return ErrorEntity(code: errCode, message: "没有权限");
                }
                break;
              case 403:
                {
                  return ErrorEntity(code: errCode, message: "服务器拒绝执行");
                }
                break;
              case 404:
                {
                  return ErrorEntity(code: errCode, message: "无法连接服务器");
                }
                break;
              case 405:
                {
                  return ErrorEntity(code: errCode, message: "请求方法错误");
                }
                break;
              case 500:
                {
                  return ErrorEntity(code: errCode, message: "服务器内部错误");
                }
                break;
              case 502:
                {
                  return ErrorEntity(code: errCode, message: "无效请求");
                }
                break;
              case 503:
                {
                  return ErrorEntity(code: errCode, message: "服务器挂了");
                }
                break;
              case 505:
                {
                  return ErrorEntity(code: errCode, message: "不支持HTTP协议");
                }
                break;
              default:
                {
                  return ErrorEntity(
                      code: errCode, message: error.response.statusMessage);
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "未知错误");
          }
        }
        break;
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }

  /// 取消请求
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  /// 读取本地配置
  Options getLocalOptions() {
    Options options;
    String token = SharedUtil.getValue(STORAGE_USER_TOKEN_KEY);
    if (token != null) {
      options = Options(headers: {
        'Authorization': 'Bearer $token',
      });
    }
    return options;
  }

  /// restful get
  Future get(String path,
      {dynamic params, Options options, CancelToken cancelToken}) async {
    try {
      var tokenOptions = options ?? getLocalOptions();
      var response = await dio.get(
        path,
        queryParameters: params,
        options: tokenOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful post
  Future post(String path,
      {dynamic params, Options options, CancelToken cancelToken}) async {
    try {
      var tokenOptions = options ?? getLocalOptions();
      var response = await dio.post(
        path,
        data: params,
        options: tokenOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful put
  Future put(String path,
      {dynamic params, Options options, CancelToken cancelToken}) async {
    try {
      var tokenOptions = options ?? getLocalOptions();
      var response = await dio.put(
        path,
        data: params,
        options: tokenOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful delete
  Future delete(String path,
      {dynamic params, Options options, CancelToken cancelToken}) async {
    try {
      var tokenOptions = options ?? getLocalOptions();
      var response = await dio.delete(
        path,
        data: params,
        options: tokenOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful post form 表单提交
  Future postForm(String path,
      {dynamic params, Options options, CancelToken cancelToken}) async {
    try {
      var tokenOptions = options ?? getLocalOptions();
      var response = await dio.post(
        path,
        data: FormData.fromMap(params),
        options: tokenOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }
}

// 异常处理
class ErrorEntity implements Exception {
  int code;
  String message;
  ErrorEntity({this.code, this.message});
  String toString() {
    if (message == null) return "Exception";
    return "Exception: code: $code, $message";
  }
}
