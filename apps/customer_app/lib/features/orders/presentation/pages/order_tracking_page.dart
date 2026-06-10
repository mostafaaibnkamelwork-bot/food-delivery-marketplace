import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({required this.orderId, super.key});
  final String orderId;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.trackOrder)),
      body: Stepper(
        currentStep: 1,
        steps: const [
          Step(title: Text('Placed'), content: SizedBox.shrink(), isActive: true),
          Step(title: Text('Preparing'), content: SizedBox.shrink(), isActive: true),
          Step(title: Text('On the way'), content: SizedBox.shrink()),
          Step(title: Text('Delivered'), content: SizedBox.shrink()),
        ],
      ),
    );
  }
}
