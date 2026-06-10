import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../domain/entities/Restaurant.dart';
import '../../domain/repositories/restaurants_repository.dart';
import '../dtos/RestaurantDto.dart';

final restaurantsRepositoryProvider = Provider<RestaurantRepository>((ref) {
  return RestaurantRepositoryImpl(ref.watch(dioProvider));
});

class RestaurantRepositoryImpl implements RestaurantRepository {
  RestaurantRepositoryImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<Restaurant>> list() async {
    final response = await _dio.get<Map<String, dynamic>>('$endpoint');
    final raw = (response.data?['data'] as List?) ?? const [];
    return raw.map((item) => RestaurantDto.fromJson(Map<String, dynamic>.from(item as Map)).toEntity()).toList();
  }
}
