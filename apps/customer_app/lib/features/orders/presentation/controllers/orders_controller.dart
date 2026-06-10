import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/orders_repository_impl.dart';
import '../../domain/entities/OrderSummary.dart';

final ordersControllerProvider = FutureProvider<List<OrderSummary>>((ref) {
  return ref.watch(ordersRepositoryProvider).list();
});
