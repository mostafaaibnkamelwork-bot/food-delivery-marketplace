import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/auth_controller.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});
  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(authControllerProvider);
    ref.listen(authControllerProvider, (_, next) {
      if (next.hasValue && next.value != null) context.go('/home');
    });
    return Scaffold(
      appBar: AppBar(title: Text(l10n.register)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(controller: name, decoration: InputDecoration(labelText: l10n.name)),
          const SizedBox(height: 12),
          TextField(controller: email, decoration: InputDecoration(labelText: l10n.email)),
          const SizedBox(height: 12),
          TextField(controller: phone, decoration: InputDecoration(labelText: l10n.phone)),
          const SizedBox(height: 12),
          TextField(controller: password, obscureText: true, decoration: InputDecoration(labelText: l10n.password)),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: state.isLoading ? null : () => ref.read(authControllerProvider.notifier).register(name: name.text, email: email.text, phone: phone.text, password: password.text, passwordConfirmation: password.text),
            child: Text(l10n.register),
          ),
        ],
      ),
    );
  }
}
