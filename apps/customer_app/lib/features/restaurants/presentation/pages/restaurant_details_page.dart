import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class RestaurantDetailsPage extends StatelessWidget {
  const RestaurantDetailsPage({required this.restaurantId, super.key});
  final String restaurantId;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.restaurants)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Restaurant #$restaurantId', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          for (final id in ['1', '2', '3'])
            Card(child: ListTile(title: Text('Product $id'), subtitle: const Text('Sizes and addons available'), onTap: () => context.push('/products/$id'))),
        ],
      ),
    );
  }
}
