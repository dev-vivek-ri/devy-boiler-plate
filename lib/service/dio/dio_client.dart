import 'package:devy_boiler_plate/dev/feature/feature.dart';
import 'package:devy_boiler_plate/service/dio/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static Dio? dioClient;
  Dio getDioClient() {
    dioClient = Dio(
      BaseOptions(
        baseUrl: Feature().getAPIURL()!,
      ),
    );

    dioClient!.interceptors.addAll([
      if (Feature.isLogging)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          maxWidth: 120,
        ),
      RetryInterceptor(
        dio: dioClient!,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 3),
          Duration(seconds: 5),
          Duration(seconds: 7),
        ],
      ),
      DioInterceptor()
    ]);

    return dioClient!;
  }
}
