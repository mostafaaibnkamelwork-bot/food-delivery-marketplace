import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({this.message, super.key});
  final String? message;
  @override
  Widget build(BuildContext context) => Center(child: Text(message ?? AppLocalizations.of(context)!.emptyState));
}
