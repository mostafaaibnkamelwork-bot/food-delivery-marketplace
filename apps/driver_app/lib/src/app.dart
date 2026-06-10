import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) => GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const DashboardPage()),
    GoRoute(path: '/auth', builder: (_, __) => const FeaturePage(title: 'Authentication')),
    GoRoute(path: '/availability', builder: (_, __) => const FeaturePage(title: 'Availability')),
    GoRoute(path: '/assigned-orders', builder: (_, __) => const FeaturePage(title: 'Assigned Orders')),
    GoRoute(path: '/pickup', builder: (_, __) => const FeaturePage(title: 'Pickup Workflow')),
    GoRoute(path: '/delivery', builder: (_, __) => const FeaturePage(title: 'Delivery Workflow')),
    GoRoute(path: '/tracking', builder: (_, __) => const FeaturePage(title: 'Live Tracking')),
    GoRoute(path: '/earnings', builder: (_, __) => const FeaturePage(title: 'Earnings')),
    GoRoute(path: '/wallet', builder: (_, __) => const FeaturePage(title: 'Wallet')),
    GoRoute(path: '/profile', builder: (_, __) => const FeaturePage(title: 'Profile')),
    GoRoute(path: '/support', builder: (_, __) => const FeaturePage(title: 'Support')),
  ],
));

class MarketplaceModuleApp extends ConsumerWidget {
  const MarketplaceModuleApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFF0F8B62)),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark, colorSchemeSeed: const Color(0xFF0F8B62)),
      routerConfig: ref.watch(routerProvider),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    final items = [('Authentication', '/auth', Icons.login), ('Availability', '/availability', Icons.toggle_on), ('Assigned Orders', '/assigned-orders', Icons.assignment), ('Pickup Workflow', '/pickup', Icons.store), ('Delivery Workflow', '/delivery', Icons.delivery_dining), ('Live Tracking', '/tracking', Icons.map), ('Earnings', '/earnings', Icons.payments), ('Wallet', '/wallet', Icons.account_balance_wallet), ('Profile', '/profile', Icons.person), ('Support', '/support', Icons.support_agent)];
    return Scaffold(
      appBar: AppBar(title: const Text('Driver App')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: Icon(items[index].$3),
            title: Text(items[index].$1),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(items[index].$2),
          ),
        ),
      ),
    );
  }
}

class FeaturePage extends StatelessWidget {
  const FeaturePage({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(child: ListTile(title: Text('$title API workflow'), subtitle: const Text('Repository, controller, validation, and state hooks are reserved for provider wiring.'))),
          FilledButton(onPressed: () {}, child: const Text('Sync')),
        ],
      ),
    );
  }
}
