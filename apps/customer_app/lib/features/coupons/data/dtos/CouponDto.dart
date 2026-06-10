import '../../domain/entities/Coupon.dart';

class CouponDto {
  const CouponDto({required this.id, required this.title});
  final String id;
  final String title;

  factory CouponDto.fromJson(Map<String, dynamic> json) {
    return CouponDto(id: json['id'].toString(), title: (json['name'] ?? json['title'] ?? '').toString());
  }

  Coupon toEntity() => Coupon(id: id, title: title);
}
