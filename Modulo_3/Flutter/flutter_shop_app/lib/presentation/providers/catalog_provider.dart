import 'package:flutter_riverpod/flutter_riverpod.dart';

final catalogProvider = StateNotifierProvider<CatalogNotifier, CatalogState>((ref) {
  return CatalogNotifier();
});

class CatalogState {
  // TODO: define catalog state
}

class CatalogNotifier extends StateNotifier<CatalogState> {
  CatalogNotifier() : super(CatalogState());

  // TODO: implement catalog methods
}
