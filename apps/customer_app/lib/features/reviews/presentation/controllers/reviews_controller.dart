import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/reviews_repository_impl.dart';
import '../../domain/entities/Review.dart';

final reviewsControllerProvider = FutureProvider<List<Review>>((ref) {
  return ref.watch(reviewsRepositoryProvider).list();
});
