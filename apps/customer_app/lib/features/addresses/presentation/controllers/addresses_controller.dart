import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/addresses_repository_impl.dart';
import '../../domain/entities/Address.dart';

final addressesControllerProvider = FutureProvider<List<Address>>((ref) {
  return ref.watch(addressesRepositoryProvider).list();
});
