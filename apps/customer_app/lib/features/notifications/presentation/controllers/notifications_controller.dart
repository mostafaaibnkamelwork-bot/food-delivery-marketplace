import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/notifications_repository_impl.dart';
import '../../domain/entities/AppNotification.dart';

final notificationsControllerProvider = FutureProvider<List<AppNotification>>((ref) {
  return ref.watch(notificationsRepositoryProvider).list();
});
