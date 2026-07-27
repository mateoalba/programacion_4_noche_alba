import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/vuelo.dart';
import '../../domain/repository/vuelo_repository.dart';
import '../../data/remote/api/vuelo_remote_datasource.dart';
import '../../data/remote/api/dio_client.dart';
import '../../data/repository/vuelo_repository_impl.dart';

final vueloDatasourceProvider = Provider<VueloRemoteDatasource>((ref) {
  final client = ref.watch(dioClientProvider);
  return VueloRemoteDatasource(client);
});

final vueloRepositoryProvider = Provider<VueloRepository>((ref) {
  final datasource = ref.watch(vueloDatasourceProvider);
  return VueloRepositoryImpl(datasource);
});

final vuelosProvider =
    StateNotifierProvider<VuelosNotifier, VuelosState>((ref) {
  final repository = ref.watch(vueloRepositoryProvider);
  return VuelosNotifier(repository);
});

class VuelosState {
  final List<Vuelo> vuelos;
  final bool cargando;
  final String? error;
  final int paginaActual;
  final bool hayMas;
  final String? busqueda;
  final String? filtroEstado;
  final String? filtroAerolinea;

  const VuelosState({
    this.vuelos = const [],
    this.cargando = false,
    this.error,
    this.paginaActual = 1,
    this.hayMas = true,
    this.busqueda,
    this.filtroEstado,
    this.filtroAerolinea,
  });

  VuelosState copyWith({
    List<Vuelo>? vuelos,
    bool? cargando,
    String? error,
    int? paginaActual,
    bool? hayMas,
    String? busqueda,
    String? filtroEstado,
    String? filtroAerolinea,
    bool limpiarError = false,
    bool limpiarBusqueda = false,
  }) {
    return VuelosState(
      vuelos: vuelos ?? this.vuelos,
      cargando: cargando ?? this.cargando,
      error: limpiarError ? null : (error ?? this.error),
      paginaActual: paginaActual ?? this.paginaActual,
      hayMas: hayMas ?? this.hayMas,
      busqueda: limpiarBusqueda ? null : (busqueda ?? this.busqueda),
      filtroEstado: filtroEstado ?? this.filtroEstado,
      filtroAerolinea: filtroAerolinea ?? this.filtroAerolinea,
    );
  }
}

class VuelosNotifier extends StateNotifier<VuelosState> {
  final VueloRepository _repository;

  VuelosNotifier(this._repository) : super(const VuelosState()) {
    cargarVuelos();
  }

  Future<void> cargarVuelos() async {
    state = state.copyWith(cargando: true, limpiarError: true);
    try {
      final vuelos = await _repository.obtenerVuelos(
        busqueda: state.busqueda,
        estado: state.filtroEstado,
        aerolinea: state.filtroAerolinea,
        pagina: 1,
      );
      state = state.copyWith(
        vuelos: vuelos,
        cargando: false,
        paginaActual: 1,
        hayMas: vuelos.length >= 20,
      );
    } catch (e) {
      state = state.copyWith(
        cargando: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  Future<void> cargarMas() async {
    if (state.cargando || !state.hayMas) return;
    state = state.copyWith(cargando: true);
    try {
      final nuevaPagina = state.paginaActual + 1;
      final nuevosVuelos = await _repository.obtenerVuelos(
        busqueda: state.busqueda,
        estado: state.filtroEstado,
        aerolinea: state.filtroAerolinea,
        pagina: nuevaPagina,
      );
      state = state.copyWith(
        vuelos: [...state.vuelos, ...nuevosVuelos],
        cargando: false,
        paginaActual: nuevaPagina,
        hayMas: nuevosVuelos.length >= 20,
      );
    } catch (e) {
      state = state.copyWith(
        cargando: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  Future<void> buscar(String? termino) async {
    state = state.copyWith(busqueda: termino);
    await cargarVuelos();
  }

  Future<void> filtrarPorEstado(String? estado) async {
    state = state.copyWith(filtroEstado: estado);
    await cargarVuelos();
  }

  Future<void> filtrarPorAerolinea(String? aerolinea) async {
    state = state.copyWith(filtroAerolinea: aerolinea);
    await cargarVuelos();
  }

  void limpiarFiltros() {
    state = state.copyWith(
      limpiarBusqueda: true,
      filtroEstado: null,
      filtroAerolinea: null,
    );
    cargarVuelos();
  }

  Vuelo? obtenerVueloPorId(String id) {
    try {
      return state.vuelos.firstWhere((v) => v.id == id);
    } catch (_) {
      return null;
    }
  }

  Vuelo? obtenerVueloPorCodigo(String codigo) {
    try {
      return state.vuelos.firstWhere((v) => v.codigoVuelo == codigo);
    } catch (_) {
      return null;
    }
  }
}
