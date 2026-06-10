import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../controllers/cart_controller.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final items = ref.watch(cartControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.cart)),
      body: items.isEmpty ? const EmptyStateView() : ListView(children: items.map((item) => ListTile(title: Text(item.name), trailing: Text(item.total.toString()))).toList()),
      bottomNavigationBar: Padding(padding: const EdgeInsets.all(16), child: FilledButton(onPressed: items.isEmpty ? null : () => context.push('/checkout'), child: Text(l10n.checkout))),
    );
  }
}
