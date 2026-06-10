import '../../domain/entities/SupportTicket.dart';

class SupportTicketDto {
  const SupportTicketDto({required this.id, required this.title});
  final String id;
  final String title;

  factory SupportTicketDto.fromJson(Map<String, dynamic> json) {
    return SupportTicketDto(id: json['id'].toString(), title: (json['name'] ?? json['title'] ?? '').toString());
  }

  SupportTicket toEntity() => SupportTicket(id: id, title: title);
}
