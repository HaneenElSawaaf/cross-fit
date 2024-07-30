import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio _dio;

  //TODO Singleton
  static DioConsumer? _instance;
  DioConsumer._()
      : _dio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ),
        );

  factory DioConsumer() {
    _instance ??= DioConsumer._();
    return _instance!;
  }
  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    return response;
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    final response =
        await _dio.post(path, queryParameters: queryParameters, data: body);
    return response;
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
