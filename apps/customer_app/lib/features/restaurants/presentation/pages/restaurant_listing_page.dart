import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../controllers/restaurants_controller.dart';

class RestaurantListingPage extends ConsumerWidget {
  const RestaurantListingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final restaurants = ref.watch(restaurantsControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.restaurants)),
      body: restaurants.when(
        data: (items) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) => ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            title: Text(items[index].title),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/restaurants/${items[index].id}'),
          ),
        ),
        error: (error, _) => AppErrorView(message: error.toString()),
        loading: () => const AppLoadingView(),
      ),
    );
  }
}
