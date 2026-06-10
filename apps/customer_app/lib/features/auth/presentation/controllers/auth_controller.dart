import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/auth_user.dart';
import '../../data/repositories/auth_repository_impl.dart';

final authControllerProvider = AsyncNotifierProvider<AuthController, AuthUser?>(AuthController.new);

class AuthController extends AsyncNotifier<AuthUser?> {
  @override
  Future<AuthUser?> build() async => null;

  Future<void> login(String login, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).login(login: login, password: password));
  }

  Future<void> register({required String name, String? email, String? phone, required String password, required String passwordConfirmation}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).register(name: name, email: email, phone: phone, password: password, passwordConfirmation: passwordConfirmation));
  }
}
