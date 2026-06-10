import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../domain/entities/Review.dart';
import '../../domain/repositories/reviews_repository.dart';
import '../dtos/ReviewDto.dart';

final reviewsRepositoryProvider = Provider<ReviewRepository>((ref) {
  return ReviewRepositoryImpl(ref.watch(dioProvider));
});

class ReviewRepositoryImpl implements ReviewRepository {
  ReviewRepositoryImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<Review>> list() async {
    final response = await _dio.get<Map<String, dynamic>>('$endpoint');
    final raw = (response.data?['data'] as List?) ?? const [];
    return raw.map((item) => ReviewDto.fromJson(Map<String, dynamic>.from(item as Map)).toEntity()).toList();
  }
}
