import '../../domain/entities/OrderSummary.dart';

class OrderSummaryDto {
  const OrderSummaryDto({required this.id, required this.title});
  final String id;
  final String title;

  factory OrderSummaryDto.fromJson(Map<String, dynamic> json) {
    return OrderSummaryDto(id: json['id'].toString(), title: (json['name'] ?? json['title'] ?? '').toString());
  }

  OrderSummary toEntity() => OrderSummary(id: id, title: title);
}
