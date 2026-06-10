import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/support_repository_impl.dart';
import '../../domain/entities/SupportTicket.dart';

final supportTicketsControllerProvider = FutureProvider<List<SupportTicket>>((ref) {
  return ref.watch(supportRepositoryProvider).list();
});
