import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  const CartItem({required this.productId, required this.name, required this.quantity, required this.unitPrice});
  final String productId;
  final String name;
  final int quantity;
  final num unitPrice;
  num get total => quantity * unitPrice;
  @override
  List<Object?> get props => [productId, name, quantity, unitPrice];
}
