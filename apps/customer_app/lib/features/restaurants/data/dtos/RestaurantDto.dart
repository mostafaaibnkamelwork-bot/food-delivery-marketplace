import '../../domain/entities/Restaurant.dart';

class RestaurantDto {
  const RestaurantDto({required this.id, required this.title});
  final String id;
  final String title;

  factory RestaurantDto.fromJson(Map<String, dynamic> json) {
    return RestaurantDto(id: json['id'].toString(), title: (json['name'] ?? json['title'] ?? '').toString());
  }

  Restaurant toEntity() => Restaurant(id: id, title: title);
}
