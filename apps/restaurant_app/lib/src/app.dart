import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) => GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const DashboardPage()),
    GoRoute(path: '/auth', builder: (_, __) => const FeaturePage(title: 'Authentication')),
    GoRoute(path: '/dashboard', builder: (_, __) => const FeaturePage(title: 'Dashboard')),
    GoRoute(path: '/orders', builder: (_, __) => const FeaturePage(title: 'Orders')),
    GoRoute(path: '/products', builder: (_, __) => const FeaturePage(title: 'Products')),
    GoRoute(path: '/categories', builder: (_, __) => const FeaturePage(title: 'Categories')),
    GoRoute(path: '/menus', builder: (_, __) => const FeaturePage(title: 'Menus')),
    GoRoute(path: '/branches', builder: (_, __) => const FeaturePage(title: 'Branches')),
    GoRoute(path: '/employees', builder: (_, __) => const FeaturePage(title: 'Employees')),
    GoRoute(path: '/reports', builder: (_, __) => const FeaturePage(title: 'Reports')),
    GoRoute(path: '/coupons', builder: (_, __) => const FeaturePage(title: 'Coupons')),
    GoRoute(path: '/settings', builder: (_, __) => const FeaturePage(title: 'Settings')),
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
    final items = [('Authentication', '/auth', Icons.login), ('Dashboard', '/dashboard', Icons.dashboard), ('Orders', '/orders', Icons.receipt_long), ('Products', '/products', Icons.restaurant_menu), ('Categories', '/categories', Icons.category), ('Menus', '/menus', Icons.menu_book), ('Branches', '/branches', Icons.storefront), ('Employees', '/employees', Icons.groups), ('Reports', '/reports', Icons.bar_chart), ('Coupons', '/coupons', Icons.local_offer), ('Settings', '/settings', Icons.settings)];
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurant App')),
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
