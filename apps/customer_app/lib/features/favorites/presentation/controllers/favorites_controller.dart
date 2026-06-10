import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/favorites_repository_impl.dart';
import '../../domain/entities/FavoriteItem.dart';

final favoritesControllerProvider = FutureProvider<List<FavoriteItem>>((ref) {
  return ref.watch(favoritesRepositoryProvider).list();
});
