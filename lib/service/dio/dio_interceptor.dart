import 'package:devy_boiler_plate/dev/logging/logger.dart';
import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    DevLogger()
        .logStackInfo('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    DevLogger().logStackInfo('REQUEST[${response.statusCode}] ');

    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    DevLogger().logStackInfo('REQUEST[${err.response!.statusCode}] ');

    return super.onError(err, handler);
  }
}
