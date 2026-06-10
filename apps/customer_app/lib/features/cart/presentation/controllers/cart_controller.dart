import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/cart_item.dart';

final cartControllerProvider = NotifierProvider<CartController, List<CartItem>>(CartController.new);

class CartController extends Notifier<List<CartItem>> {
  @override
  List<CartItem> build() => const [];

  void add(CartItem item) => state = [...state, item];
  void clear() => state = const [];
}
