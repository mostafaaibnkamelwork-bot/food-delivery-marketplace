import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../domain/entities/FavoriteItem.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../dtos/FavoriteItemDto.dart';

final favoritesRepositoryProvider = Provider<FavoriteItemRepository>((ref) {
  return FavoriteItemRepositoryImpl(ref.watch(dioProvider));
});

class FavoriteItemRepositoryImpl implements FavoriteItemRepository {
  FavoriteItemRepositoryImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<FavoriteItem>> list() async {
    final response = await _dio.get<Map<String, dynamic>>('$endpoint');
    final raw = (response.data?['data'] as List?) ?? const [];
    return raw.map((item) => FavoriteItemDto.fromJson(Map<String, dynamic>.from(item as Map)).toEntity()).toList();
  }
}
