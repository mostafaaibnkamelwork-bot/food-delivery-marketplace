import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/app_config.dart';
import '../storage/secure_storage_service.dart';
import 'auth_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(baseUrl: AppConfig.apiBaseUrl, connectTimeout: AppConfig.requestTimeout, receiveTimeout: AppConfig.requestTimeout));
  dio.interceptors.add(AuthInterceptor(ref.watch(secureStorageServiceProvider)));
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  return dio;
});
