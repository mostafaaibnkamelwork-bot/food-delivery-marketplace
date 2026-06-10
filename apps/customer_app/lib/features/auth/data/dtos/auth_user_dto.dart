import '../../domain/entities/auth_user.dart';

class AuthUserDto {
  const AuthUserDto({required this.id, required this.name, this.email, this.phone});
  final String id;
  final String name;
  final String? email;
  final String? phone;

  factory AuthUserDto.fromJson(Map<String, dynamic> json) {
    return AuthUserDto(
      id: json['id'].toString(),
      name: json['name'].toString(),
      email: json['email']?.toString(),
      phone: json['phone']?.toString(),
    );
  }

  AuthUser toEntity() => AuthUser(id: id, name: name, email: email, phone: phone);
}
