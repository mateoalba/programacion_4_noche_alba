import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

class CartState {
  // TODO: define cart state
}

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(CartState());

  // TODO: implement cart methods
}
