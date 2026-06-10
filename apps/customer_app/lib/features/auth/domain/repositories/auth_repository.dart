import '../entities/auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser> login({required String login, required String password});
  Future<AuthUser> register({required String name, String? email, String? phone, required String password, required String passwordConfirmation});
  Future<void> forgotPassword(String emailOrPhone);
  Future<void> logout();
}
