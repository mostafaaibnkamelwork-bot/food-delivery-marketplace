import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../domain/entities/OrderSummary.dart';
import '../../domain/repositories/orders_repository.dart';
import '../dtos/OrderSummaryDto.dart';

final ordersRepositoryProvider = Provider<OrderSummaryRepository>((ref) {
  return OrderSummaryRepositoryImpl(ref.watch(dioProvider));
});

class OrderSummaryRepositoryImpl implements OrderSummaryRepository {
  OrderSummaryRepositoryImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<OrderSummary>> list() async {
    final response = await _dio.get<Map<String, dynamic>>('$endpoint');
    final raw = (response.data?['data'] as List?) ?? const [];
    return raw.map((item) => OrderSummaryDto.fromJson(Map<String, dynamic>.from(item as Map)).toEntity()).toList();
  }
}
