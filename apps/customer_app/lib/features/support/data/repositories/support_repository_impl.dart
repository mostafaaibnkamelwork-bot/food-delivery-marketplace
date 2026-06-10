import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../domain/entities/SupportTicket.dart';
import '../../domain/repositories/support_repository.dart';
import '../dtos/SupportTicketDto.dart';

final supportRepositoryProvider = Provider<SupportTicketRepository>((ref) {
  return SupportTicketRepositoryImpl(ref.watch(dioProvider));
});

class SupportTicketRepositoryImpl implements SupportTicketRepository {
  SupportTicketRepositoryImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<SupportTicket>> list() async {
    final response = await _dio.get<Map<String, dynamic>>('$endpoint');
    final raw = (response.data?['data'] as List?) ?? const [];
    return raw.map((item) => SupportTicketDto.fromJson(Map<String, dynamic>.from(item as Map)).toEntity()).toList();
  }
}
