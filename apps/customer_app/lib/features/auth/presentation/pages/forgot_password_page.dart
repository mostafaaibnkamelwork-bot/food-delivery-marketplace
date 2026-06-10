import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.forgotPassword)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(decoration: InputDecoration(labelText: l10n.emailOrPhone)),
          const SizedBox(height: 16),
          FilledButton(onPressed: () {}, child: Text(l10n.forgotPassword)),
        ],
      ),
    );
  }
}
