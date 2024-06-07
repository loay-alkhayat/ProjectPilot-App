import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../constants/apis_url.dart';
import 'cache_storage_services.dart';

final Logger logger = Logger();

class DioServices {
  static DioServices? _instance;

  DioServices._();

  factory DioServices() => _instance ??= DioServices._();

  Dio? _dio;

  init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiUrls.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  String getBearerTokenFromCache() {
    return CacheHelper.getData(key: "studentToken");
  }

  Map<String, dynamic> get _baseHeader {
    String? token = getBearerTokenFromCache();

    Map<String, dynamic> headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return headers;
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    logger.d(
        "============== GET METHOD ================= \n URL: ($url) \n Parameters: $data");
    return await _dio!.get(
      url,
      data: data,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(headers: headers ?? _baseHeader),
    );
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    logger.d(
        "============== POST METHOD ================= \n URL: ($url) \n Parameters: $data");
    return await _dio!.post(
      url,
      data: data,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(headers: headers ?? _baseHeader),
    );
  }

  Future<Response> postFile({
    required String url,
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    logger.d(
        "============== POSTFile METHOD ================= \n URL: ($url) \n Parameters: $data");
    return await _dio!.post(
      url,
      data: data,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(headers: headers ?? _baseHeader),
    );
  }

  Future<Response> put({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    logger.d(
        "============== PUT METHOD ================= \n URL: ($url) \n Parameters: $data");
    return await _dio!.put(
      url,
      data: data,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(headers: headers ?? _baseHeader),
    );
  }

  Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    logger.d(
        "============== DELETE METHOD ================= \n URL: ($url) \n Parameters: $data");
    return await _dio!.delete(
      url,
      data: data,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(headers: headers ?? _baseHeader),
    );
  }

  Future<Response?> postVerification({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    return await _dio!.post(
      url,
      data: data,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(headers: headers ?? _baseHeader),
    );
  }
}
