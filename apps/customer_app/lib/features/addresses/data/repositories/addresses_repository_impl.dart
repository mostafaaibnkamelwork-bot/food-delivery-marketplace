import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../domain/entities/Address.dart';
import '../../domain/repositories/addresses_repository.dart';
import '../dtos/AddressDto.dart';

final addressesRepositoryProvider = Provider<AddressRepository>((ref) {
  return AddressRepositoryImpl(ref.watch(dioProvider));
});

class AddressRepositoryImpl implements AddressRepository {
  AddressRepositoryImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<Address>> list() async {
    final response = await _dio.get<Map<String, dynamic>>('$endpoint');
    final raw = (response.data?['data'] as List?) ?? const [];
    return raw.map((item) => AddressDto.fromJson(Map<String, dynamic>.from(item as Map)).toEntity()).toList();
  }
}
