import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../domain/entities/Coupon.dart';
import '../../domain/repositories/coupons_repository.dart';
import '../dtos/CouponDto.dart';

final couponsRepositoryProvider = Provider<CouponRepository>((ref) {
  return CouponRepositoryImpl(ref.watch(dioProvider));
});

class CouponRepositoryImpl implements CouponRepository {
  CouponRepositoryImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<Coupon>> list() async {
    final response = await _dio.get<Map<String, dynamic>>('$endpoint');
    final raw = (response.data?['data'] as List?) ?? const [];
    return raw.map((item) => CouponDto.fromJson(Map<String, dynamic>.from(item as Map)).toEntity()).toList();
  }
}
