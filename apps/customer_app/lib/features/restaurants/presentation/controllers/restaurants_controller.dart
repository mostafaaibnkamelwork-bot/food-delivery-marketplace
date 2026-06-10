import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/restaurants_repository_impl.dart';
import '../../domain/entities/Restaurant.dart';

final restaurantsControllerProvider = FutureProvider<List<Restaurant>>((ref) {
  return ref.watch(restaurantsRepositoryProvider).list();
});
