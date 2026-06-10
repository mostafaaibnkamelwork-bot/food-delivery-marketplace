import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../controllers/addresses_controller.dart';

class AddressesPage extends ConsumerWidget {
  const AddressesPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final addresses = ref.watch(addressesControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.addresses)),
      body: addresses.when(
        data: (items) => items.isEmpty ? const EmptyStateView() : ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          itemBuilder: (context, index) => Card(child: ListTile(title: Text(items[index].title), leading: const Icon(Icons.location_on))),
        ),
        error: (error, _) => AppErrorView(message: error.toString()),
        loading: () => const AppLoadingView(),
      ),
    );
  }
}
