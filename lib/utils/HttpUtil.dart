import 'package:dio/dio.dart';
import 'package:flutter_news/common/Config.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  Dio _client;

  factory HttpUtil() => _instance;

  HttpUtil._internal() {
    if (null == _client) {
      var baseOptions = BaseOptions(
          baseUrl: Config.BASE_URL,
          connectTimeout: 1000 * 10,
          receiveTimeout: 1000 * 3,
          headers: {"pubSn": Config.PUB_SN});
      _client = Dio(baseOptions);
      _client.interceptors.add(LogInterceptor(responseBody: true)); //开启请求日志
    }
  }

  Future<Response<Map<String, dynamic>>> post<T>(
      String path, Map<String, dynamic> params) async {
    var response = await _client.post<Map<String, dynamic>>(path, data: params);
    return response;
  }
}
