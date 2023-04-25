import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_supernote/http/requestListener.dart';
import 'package:flutter_supernote/models/base_error.dart';
import 'package:flutter_supernote/utils/log_utils.dart';

import '../models/base_entity.dart';

/// 请求方法
enum DioMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
}

class DioUtil {
  /// 单例模式
  static DioUtil? _instance;

  factory DioUtil() => _instance ?? DioUtil._internal();

  static DioUtil? get instance => _instance ?? DioUtil._internal();

  /// 发送超时时间
  static const Duration sendTimeout = Duration(seconds: 10 * 1000);

  /// 连接超时时间
  static const Duration connectTimeout = Duration(seconds: 60 * 1000);

  /// 响应超时时间
  static const Duration receiveTimeout = Duration(seconds: 60 * 1000);

  /// Dio实例
  static Dio _dio = Dio();

  /// 初始化
  DioUtil._internal() {
    // 初始化基本选项
    BaseOptions options = BaseOptions(
        baseUrl: 'https://device.supernote.com.cn',
        sendTimeout: sendTimeout,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout);
    _instance = this;
    // 初始化dio
    _dio = Dio(options);
    // 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));

    /// 开启日志打印
    openLog();
  }
  /// 错误处理
  void _onError(DioError error, ErrorInterceptorHandler handler) {
    handler.next(error);
  }


  /// 请求拦截器
  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 对非open的接口的请求参数全部增加userId
    // if (!options.path.contains("open")) {
    //   options.queryParameters["userId"] = "xxx";
    // }
    // // 头部添加token
    // options.headers["token"] = "xxx";
    // 更多业务需求
    handler.next(options);
    // super.onRequest(options, handler);
  }

  /// 相应拦截器
  void _onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // 请求成功是对数据做基本处理
    if (response.statusCode == HttpStatusCode.ok) {
      // ....
    } else {
      // ....
    }
    if (response.requestOptions.baseUrl.contains("token")) {
      // 对某些单独的url返回数据做特殊处理
    }
    handler.next(response);
  }


  /// 请求类
  Future request<T>(String path,
      {DioMethod method = DioMethod.get,
      Map<String, dynamic>? params,
      data,
      CancelToken? cancelToken,
      Options? options,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      RequestListener? requestListener}) async {
    const _methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.put: 'put',
      DioMethod.delete: 'delete',
      DioMethod.patch: 'patch',
      DioMethod.head: 'head'
    };
    options ??= Options(method: _methodValues[method]);
    try {
      Response response;
      response = await _dio.request(path,
          data: data,
          queryParameters: params,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      var responseCode = response.statusCode;
      if (responseCode == HttpStatusCode.ok) {
        try {
            var dataJson = jsonDecode(response.toString());
            LogD("jsonDecode success");
            BaseEntity<T> entity = BaseEntity.fromJson(dataJson);
            bool? isSuccess = entity.success;
            if (isSuccess == true) {
              LogD("----------success");
              requestListener?.onSuccess(entity.data);
            } else {
              LogD("----------failed");
              requestListener
                  ?.onError(BaseError(entity.errorCode, entity.errorMsg));
            }
        } catch (e) {
          print("------------parse json error----------");
          requestListener?.onError(BaseError(HttpStatusCode.unerror as String?, "parse json error"));
        }
      } else {
        LogE("----request failed---");
        requestListener
            ?.onError(BaseError(responseCode as String, "request failed"));
      }
    } on DioError catch (e) {
      LogE("----DioError");
      requestListener?.onError(BaseError(HttpStatusCode.unerror as String?, formatError(e)));
    }
  }

  ///  DioError统一处理
  String? formatError(DioError e) {
    String? msg = "网络异常";
    if (e.type == DioErrorType.connectionError) {
      msg = e.hashCode.toString() + "连接超时";
    } else if (e.type == DioErrorType.sendTimeout) {
      msg = e.hashCode.toString() + "请求超时";
    } else if (e.type == DioErrorType.receiveTimeout) {
      msg = e.hashCode.toString() + "响应超时";
    } else if (e.type == DioErrorType.badResponse) {
      msg = e.hashCode.toString() + "出现异常";
    } else if (e.type == DioErrorType.cancel) {
      msg = e.hashCode.toString() + "请求取消";
    } else {
      msg = e.message;
    }
    return msg;
  }

  /// 开启日志打印
  /// 需要打印日志的接口在接口请求前 DioUtil.instance?.openLog();
  void openLog() {
    _dio.interceptors
        .add(LogInterceptor(responseHeader: false, responseBody: true));
  }
}
abstract class HttpStatusCode {
  static const int ok = 200;
  static const int unerror=101;
}