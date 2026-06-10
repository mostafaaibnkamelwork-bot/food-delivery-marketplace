import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../domain/entities/cart_item.dart';

final cartRepositoryProvider = Provider<CartRepository>((ref) => CartRepository(ref.watch(dioProvider)));

class CartRepository {
  CartRepository(this._dio);
  final Dio _dio;

  Future<void> addItem(CartItem item) async {
    await _dio.post('/cart/items', data: {
      'product_id': item.productId,
      'quantity': item.quantity,
      'unit_price': item.unitPrice,
    });
  }

  Future<Map<String, dynamic>> checkout({required int branchId, int? addressId, required String paymentMethod, required List<CartItem> items}) async {
    final response = await _dio.post<Map<String, dynamic>>('/orders', data: {
      'branch_id': branchId,
      'address_id': addressId,
      'payment_method': paymentMethod,
      'items': items.map((item) => {
        'product_id': item.productId,
        'product_name': item.name,
        'quantity': item.quantity,
        'unit_price': item.unitPrice,
        'total_price': item.total,
      }).toList(),
    });
    return response.data ?? <String, dynamic>{};
  }
}
