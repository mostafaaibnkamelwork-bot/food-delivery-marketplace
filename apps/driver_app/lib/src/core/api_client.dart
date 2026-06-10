import 'package:dio/dio.dart';

class ApiClient {
  ApiClient(String baseUrl) : dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {'Accept': 'application/json'}));
  final Dio dio;
}
