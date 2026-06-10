import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.delivery_dining, size: 96, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 24),
              Text(l10n.appName, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 12),
              Text(l10n.searchRestaurants, textAlign: TextAlign.center),
              const SizedBox(height: 32),
              FilledButton(onPressed: () => context.go('/login'), child: Text(l10n.getStarted)),
            ],
          ),
        ),
      ),
    );
  }
}
