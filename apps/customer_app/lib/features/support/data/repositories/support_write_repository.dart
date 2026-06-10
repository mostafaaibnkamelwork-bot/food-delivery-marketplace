import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';

final supportWriteRepositoryProvider = Provider<SupportWriteRepository>((ref) => SupportWriteRepository(ref.watch(dioProvider)));

class SupportWriteRepository {
  SupportWriteRepository(this._dio);
  final Dio _dio;

  Future<void> createTicket({required String subject, required String category, required String message}) async {
    final ticket = await _dio.post<Map<String, dynamic>>('/support/tickets', data: {'subject': subject, 'category': category, 'priority': 'normal'});
    final id = ticket.data?['data']?['id'];
    if (id != null) {
      await _dio.post('/support/tickets/$id/messages', data: {'message': message});
    }
  }
}
