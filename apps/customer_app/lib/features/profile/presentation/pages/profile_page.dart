import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.profile)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(title: Text(l10n.addresses), leading: const Icon(Icons.location_on)),
          ListTile(title: Text(l10n.notifications), leading: const Icon(Icons.notifications)),
          ListTile(title: Text(l10n.support), leading: const Icon(Icons.support_agent)),
        ],
      ),
    );
  }
}
