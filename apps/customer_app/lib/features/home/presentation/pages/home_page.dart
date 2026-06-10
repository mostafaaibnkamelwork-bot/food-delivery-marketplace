import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final items = [
      (l10n.restaurants, '/restaurants', Icons.restaurant),
      (l10n.favorites, '/favorites', Icons.favorite),
      (l10n.cart, '/cart', Icons.shopping_cart),
      (l10n.orders, '/orders', Icons.receipt_long),
      (l10n.coupons, '/coupons', Icons.local_offer),
      (l10n.notifications, '/notifications', Icons.notifications),
      (l10n.profile, '/profile', Icons.person),
      (l10n.support, '/support', Icons.support_agent),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(l10n.home)),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: InkWell(
              onTap: () => context.push(item.$2),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(item.$3), const SizedBox(height: 8), Text(item.$1)]),
            ),
          );
        },
      ),
    );
  }
}
