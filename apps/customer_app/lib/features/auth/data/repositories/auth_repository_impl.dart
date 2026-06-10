import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/storage_keys.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../dtos/auth_user_dto.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(dioProvider), ref.watch(secureStorageServiceProvider));
});

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._dio, this._storage);
  final Dio _dio;
  final SecureStorageService _storage;

  @override
  Future<AuthUser> login({required String login, required String password}) async {
    final response = await _dio.post<Map<String, dynamic>>('/auth/login', data: {'login': login, 'password': password});
    await _storage.write(StorageKeys.authToken, response.data?['token']?.toString() ?? '');
    return AuthUserDto.fromJson(Map<String, dynamic>.from(response.data?['user'] as Map)).toEntity();
  }

  @override
  Future<AuthUser> register({required String name, String? email, String? phone, required String password, required String passwordConfirmation}) async {
    final response = await _dio.post<Map<String, dynamic>>('/auth/register', data: {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'role': 'customer',
    });
    await _storage.write(StorageKeys.authToken, response.data?['token']?.toString() ?? '');
    return AuthUserDto.fromJson(Map<String, dynamic>.from(response.data?['user'] as Map)).toEntity();
  }

  @override
  Future<void> forgotPassword(String emailOrPhone) async {
    await _dio.post('/auth/forgot-password', data: {'login': emailOrPhone});
  }

  @override
  Future<void> logout() async {
    await _dio.post('/auth/logout');
    await _storage.delete(StorageKeys.authToken);
  }
}
