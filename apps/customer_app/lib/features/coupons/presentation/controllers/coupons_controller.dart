import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/coupons_repository_impl.dart';
import '../../domain/entities/Coupon.dart';

final couponsControllerProvider = FutureProvider<List<Coupon>>((ref) {
  return ref.watch(couponsRepositoryProvider).list();
});
