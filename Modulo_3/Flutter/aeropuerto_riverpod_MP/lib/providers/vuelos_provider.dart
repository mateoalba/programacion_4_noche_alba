import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/vuelo.dart';
import '../services/auth_service.dart';
import '../services/vuelos_service.dart';

// StateProvider para un contador simple (Paso 1)
final contadorProvider = StateProvider<int>((ref) => 0);

// Singleton del AuthService
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

// Singleton del VuelosService
final vuelosServiceProvider = Provider<VuelosService>((ref) {
  return VuelosService(ref.watch(authServiceProvider));
});

// Estado de autenticación
final authStateProvider = Provider<bool>((ref) {
  return ref.watch(authServiceProvider).isLoggedIn;
});

// Search query provider
final searchQueryProvider = StateProvider<String>((ref) => '');

// Estado filter provider
final estadoFilterProvider = StateProvider<String>((ref) => '');

// NotifierProvider para lista de vuelos (Paso 2)
final vuelosProvider =
    NotifierProvider<VuelosNotifier, AsyncValue<List<Vuelo>>>(
  VuelosNotifier.new,
);

class VuelosNotifier extends Notifier<AsyncValue<List<Vuelo>>> {
  @override
  AsyncValue<List<Vuelo>> build() => const AsyncValue.loading();

  VuelosService get _service => ref.read(vuelosServiceProvider);

  Future<void> fetchVuelos({String? search, String? estado}) async {
    state = const AsyncValue.loading();
    try {
      final vuelos = await _service.getVuelos(search: search, estado: estado);
      state = AsyncValue.data(vuelos);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void toggleFavorito(String id) {
    state = state.whenData((vuelos) {
      return vuelos.map((v) {
        if (v.id == id) {
          return v.copyWith(favorito: !v.favorito);
        }
        return v;
      }).toList();
    });
  }

  Future<void> eliminar(String id) async {
    try {
      await _service.eliminarVuelo(id);
      state = state.whenData((vuelos) {
        return vuelos.where((v) => v.id != id).toList();
      });
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> agregar(Map<String, dynamic> data) async {
    try {
      final nuevo = await _service.crearVuelo(data);
      state = state.whenData((vuelos) => [...vuelos, nuevo]);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
