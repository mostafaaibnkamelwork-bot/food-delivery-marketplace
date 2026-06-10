import 'package:equatable/equatable.dart';

class OrderSummary extends Equatable {
  const OrderSummary({required this.id, required this.title});
  final String id;
  final String title;
  @override
  List<Object?> get props => [id, title];
}
