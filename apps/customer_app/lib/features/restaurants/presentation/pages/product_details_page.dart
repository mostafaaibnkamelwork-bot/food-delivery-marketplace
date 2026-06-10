import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({required this.productId, super.key});
  final String productId;
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String size = 'Regular';
  final addons = <String>{};
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text('Product #${widget.productId}')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Product sizes', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'Small', label: Text('Small')),
              ButtonSegment(value: 'Regular', label: Text('Regular')),
              ButtonSegment(value: 'Large', label: Text('Large')),
            ],
            selected: {size},
            onSelectionChanged: (value) => setState(() => size = value.first),
          ),
          const SizedBox(height: 16),
          Text('Product addons', style: Theme.of(context).textTheme.titleMedium),
          CheckboxListTile(title: const Text('Extra cheese'), value: addons.contains('cheese'), onChanged: (_) => setState(() => addons.contains('cheese') ? addons.remove('cheese') : addons.add('cheese'))),
          CheckboxListTile(title: const Text('Spicy sauce'), value: addons.contains('sauce'), onChanged: (_) => setState(() => addons.contains('sauce') ? addons.remove('sauce') : addons.add('sauce'))),
          const SizedBox(height: 16),
          FilledButton(onPressed: () {}, child: Text(l10n.addToCart)),
        ],
      ),
    );
  }
}
