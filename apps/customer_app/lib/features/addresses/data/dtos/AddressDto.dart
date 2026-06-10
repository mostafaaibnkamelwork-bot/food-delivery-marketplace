import '../../domain/entities/Address.dart';

class AddressDto {
  const AddressDto({required this.id, required this.title});
  final String id;
  final String title;

  factory AddressDto.fromJson(Map<String, dynamic> json) {
    return AddressDto(id: json['id'].toString(), title: (json['name'] ?? json['title'] ?? '').toString());
  }

  Address toEntity() => Address(id: id, title: title);
}
