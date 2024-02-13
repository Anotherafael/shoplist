import 'package:dio/dio.dart';
import 'package:shoplist/env.dart';

class HttpClient extends DioMixin {
  @override
  HttpClientAdapter get httpClientAdapter => HttpClientAdapter();

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: Env.cloudDatabaseUrl,
        headers: {
          'content-Type': 'application/json',
        },
      );
}
