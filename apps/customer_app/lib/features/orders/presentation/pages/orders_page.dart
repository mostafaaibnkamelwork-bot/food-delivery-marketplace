import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../controllers/orders_controller.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final orders = ref.watch(ordersControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.orders)),
      body: orders.when(
        data: (items) => ListView.builder(itemCount: items.length, itemBuilder: (context, index) => ListTile(title: Text(items[index].title), onTap: () => context.push('/orders/${items[index].id}/tracking'))),
        error: (error, _) => AppErrorView(message: error.toString()),
        loading: () => const AppLoadingView(),
      ),
    );
  }
}
