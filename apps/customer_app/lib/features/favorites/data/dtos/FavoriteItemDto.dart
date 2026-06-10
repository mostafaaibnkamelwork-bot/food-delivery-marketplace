import '../../domain/entities/FavoriteItem.dart';

class FavoriteItemDto {
  const FavoriteItemDto({required this.id, required this.title});
  final String id;
  final String title;

  factory FavoriteItemDto.fromJson(Map<String, dynamic> json) {
    return FavoriteItemDto(id: json['id'].toString(), title: (json['name'] ?? json['title'] ?? '').toString());
  }

  FavoriteItem toEntity() => FavoriteItem(id: id, title: title);
}
