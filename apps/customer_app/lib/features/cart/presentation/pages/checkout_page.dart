import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.checkout)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(title: Text(l10n.addresses), trailing: const Icon(Icons.chevron_right)),
          ListTile(title: Text(l10n.coupons), trailing: const Icon(Icons.chevron_right)),
          ListTile(title: const Text('Payment method'), subtitle: const Text('Cash')),
          const SizedBox(height: 16),
          FilledButton(onPressed: () {}, child: Text(l10n.placeOrder)),
        ],
      ),
    );
  }
}
