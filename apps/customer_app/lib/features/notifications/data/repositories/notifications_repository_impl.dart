import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../domain/entities/AppNotification.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../dtos/AppNotificationDto.dart';

final notificationsRepositoryProvider = Provider<AppNotificationRepository>((ref) {
  return AppNotificationRepositoryImpl(ref.watch(dioProvider));
});

class AppNotificationRepositoryImpl implements AppNotificationRepository {
  AppNotificationRepositoryImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<AppNotification>> list() async {
    final response = await _dio.get<Map<String, dynamic>>('$endpoint');
    final raw = (response.data?['data'] as List?) ?? const [];
    return raw.map((item) => AppNotificationDto.fromJson(Map<String, dynamic>.from(item as Map)).toEntity()).toList();
  }
}
