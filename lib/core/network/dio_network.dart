import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:withu/feature/account/account.dart';

import '../utils/library/logger/logger.dart';

class DioNetwork {
  final String url = 'https://withu.staging.meetory.io';

  late final _dio =
      Dio(
          BaseOptions(
            baseUrl: url,
            contentType: 'application/json',
            responseType: ResponseType.json,
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              if (options.uri.path.contains('/api')) {
                final preference = await SharedPreferences.getInstance();
                final token = preference.getString(
                  AccountStorageKey.token.name,
                );
                options.headers['Authorization'] = token ?? 'Bearer $token';
              }

              return handler.next(options);
            },
            onError: (DioException error, ErrorInterceptorHandler handler) {
              logger.e(error);
              return handler.next(error);
            },
          ),
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            // enabled: kDebugMode,
          ),
        );

  Dio get dio => _dio;
}
