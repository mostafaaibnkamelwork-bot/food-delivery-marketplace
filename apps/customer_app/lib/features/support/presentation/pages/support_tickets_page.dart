import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../controllers/support_tickets_controller.dart';

class SupportTicketsPage extends ConsumerWidget {
  const SupportTicketsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final tickets = ref.watch(supportTicketsControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.support)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          tickets.when(
            data: (items) => items.isEmpty
                ? const SizedBox(height: 120, child: EmptyStateView())
                : Column(children: items.map((item) => Card(child: ListTile(title: Text(item.title)))).toList()),
            error: (error, _) => AppErrorView(message: error.toString()),
            loading: () => const SizedBox(height: 120, child: AppLoadingView()),
          ),
          const SizedBox(height: 16),
          TextField(decoration: const InputDecoration(labelText: 'Subject')),
          const SizedBox(height: 12),
          TextField(maxLines: 4, decoration: const InputDecoration(labelText: 'Message')),
          const SizedBox(height: 16),
          FilledButton(onPressed: () {}, child: Text(l10n.support)),
        ],
      ),
    );
  }
}
