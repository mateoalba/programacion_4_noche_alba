import 'package:flutter_riverpod/flutter_riverpod.dart';

final adminProvider = StateNotifierProvider<AdminNotifier, AdminState>((ref) {
  return AdminNotifier();
});

class AdminState {
  // TODO: define admin state
}

class AdminNotifier extends StateNotifier<AdminState> {
  AdminNotifier() : super(AdminState());

  // TODO: implement admin methods
}
