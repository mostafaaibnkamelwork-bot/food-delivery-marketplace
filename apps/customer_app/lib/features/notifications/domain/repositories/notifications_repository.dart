import '../entities/AppNotification.dart';

abstract class AppNotificationRepository {
  Future<List<AppNotification>> list();
}
