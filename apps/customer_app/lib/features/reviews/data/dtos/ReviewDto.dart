import '../../domain/entities/Review.dart';

class ReviewDto {
  const ReviewDto({required this.id, required this.title});
  final String id;
  final String title;

  factory ReviewDto.fromJson(Map<String, dynamic> json) {
    return ReviewDto(id: json['id'].toString(), title: (json['name'] ?? json['title'] ?? '').toString());
  }

  Review toEntity() => Review(id: id, title: title);
}
