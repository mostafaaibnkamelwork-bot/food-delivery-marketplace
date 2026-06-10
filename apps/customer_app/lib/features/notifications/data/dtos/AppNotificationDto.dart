import '../../domain/entities/AppNotification.dart';

class AppNotificationDto {
  const AppNotificationDto({required this.id, required this.title});
  final String id;
  final String title;

  factory AppNotificationDto.fromJson(Map<String, dynamic> json) {
    return AppNotificationDto(id: json['id'].toString(), title: (json['name'] ?? json['title'] ?? '').toString());
  }

  AppNotification toEntity() => AppNotification(id: id, title: title);
}
