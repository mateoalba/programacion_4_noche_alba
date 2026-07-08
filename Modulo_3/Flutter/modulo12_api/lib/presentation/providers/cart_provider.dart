import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/product.dart';

class CartItem {
  final Product product;
  final int quantity;
  const CartItem({required this.product, required this.quantity});
}

class CartState {
  final List<CartItem> items;
  const CartState({this.items = const []});
  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
}

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState());

  void addItem(Product product, {int quantity = 1}) {
    final index = state.items.indexWhere((i) => i.product.id == product.id);
    if (index >= 0) {
      final current = state.items[index];
      final updated = CartItem(product: current.product, quantity: current.quantity + quantity);
      state = CartState(items: List.from(state.items)..[index] = updated);
    } else {
      state = CartState(items: [...state.items, CartItem(product: product, quantity: quantity)]);
    }
  }

  void removeItem(int productId) {
    state = CartState(items: state.items.where((i) => i.product.id != productId).toList());
  }

  void updateQuantity(int productId, int quantity) {
    if (quantity <= 0) {
      removeItem(productId);
      return;
    }
    final index = state.items.indexWhere((i) => i.product.id == productId);
    if (index < 0) return;
    final updated = CartItem(product: state.items[index].product, quantity: quantity);
    state = CartState(items: List.from(state.items)..[index] = updated);
  }

  void clear() => state = const CartState();
}

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((_) => CartNotifier());
