import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(authControllerProvider);
    ref.listen(authControllerProvider, (_, next) {
      if (next.hasValue && next.value != null) context.go('/home');
    });
    return Scaffold(
      appBar: AppBar(title: Text(l10n.login)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(controller: loginController, decoration: InputDecoration(labelText: l10n.emailOrPhone)),
          const SizedBox(height: 12),
          TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: l10n.password)),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: state.isLoading ? null : () => ref.read(authControllerProvider.notifier).login(loginController.text, passwordController.text),
            child: state.isLoading ? const CircularProgressIndicator() : Text(l10n.login),
          ),
          TextButton(onPressed: () => context.push('/forgot-password'), child: Text(l10n.forgotPassword)),
          TextButton(onPressed: () => context.push('/register'), child: Text(l10n.register)),
        ],
      ),
    );
  }
}
