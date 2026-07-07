import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderProvider = StateNotifierProvider<OrderNotifier, OrderState>((ref) {
  return OrderNotifier();
});

class OrderState {
  // TODO: define order state
}

class OrderNotifier extends StateNotifier<OrderState> {
  OrderNotifier() : super(OrderState());

  // TODO: implement order methods
}
