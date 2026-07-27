import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/pasajero.dart';
import '../../domain/repository/pasajero_repository.dart';
import '../../data/remote/api/pasajero_remote_datasource.dart';
import '../../data/remote/api/dio_client.dart';
import '../../data/repository/pasajero_repository_impl.dart';

final pasajeroDatasourceProvider = Provider<PasajeroRemoteDatasource>((ref) {
  final client = ref.watch(dioClientProvider);
  return PasajeroRemoteDatasource(client);
});

final pasajeroRepositoryProvider = Provider<PasajeroRepository>((ref) {
  final datasource = ref.watch(pasajeroDatasourceProvider);
  return PasajeroRepositoryImpl(datasource);
});

final pasajerosProvider =
    StateNotifierProvider<PasajerosNotifier, PasajerosState>((ref) {
  final repository = ref.watch(pasajeroRepositoryProvider);
  return PasajerosNotifier(repository);
});

class PasajerosState {
  final List<Pasajero> pasajeros;
  final bool cargando;
  final String? error;
  final int paginaActual;
  final bool hayMas;
  final String? busqueda;
  final String? filtroVuelo;
  final String? filtroEstado;

  const PasajerosState({
    this.pasajeros = const [],
    this.cargando = false,
    this.error,
    this.paginaActual = 1,
    this.hayMas = true,
    this.busqueda,
    this.filtroVuelo,
    this.filtroEstado,
  });

  PasajerosState copyWith({
    List<Pasajero>? pasajeros,
    bool? cargando,
    String? error,
    int? paginaActual,
    bool? hayMas,
    String? busqueda,
    String? filtroVuelo,
    String? filtroEstado,
    bool limpiarError = false,
    bool limpiarBusqueda = false,
  }) {
    return PasajerosState(
      pasajeros: pasajeros ?? this.pasajeros,
      cargando: cargando ?? this.cargando,
      error: limpiarError ? null : (error ?? this.error),
      paginaActual: paginaActual ?? this.paginaActual,
      hayMas: hayMas ?? this.hayMas,
      busqueda: limpiarBusqueda ? null : (busqueda ?? this.busqueda),
      filtroVuelo: filtroVuelo ?? this.filtroVuelo,
      filtroEstado: filtroEstado ?? this.filtroEstado,
    );
  }
}

class PasajerosNotifier extends StateNotifier<PasajerosState> {
  final PasajeroRepository _repository;

  PasajerosNotifier(this._repository) : super(const PasajerosState()) {
    cargarPasajeros();
  }

  Future<void> cargarPasajeros() async {
    state = state.copyWith(cargando: true, limpiarError: true);
    try {
      final pasajeros = await _repository.obtenerPasajeros(
        busqueda: state.busqueda,
        vueloCodigo: state.filtroVuelo,
        estadoEmbarque: state.filtroEstado,
        pagina: 1,
      );
      state = state.copyWith(
        pasajeros: pasajeros,
        cargando: false,
        paginaActual: 1,
        hayMas: pasajeros.length >= 20,
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
      final nuevosPasajeros = await _repository.obtenerPasajeros(
        busqueda: state.busqueda,
        vueloCodigo: state.filtroVuelo,
        estadoEmbarque: state.filtroEstado,
        pagina: nuevaPagina,
      );
      state = state.copyWith(
        pasajeros: [...state.pasajeros, ...nuevosPasajeros],
        cargando: false,
        paginaActual: nuevaPagina,
        hayMas: nuevosPasajeros.length >= 20,
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
    await cargarPasajeros();
  }

  Future<void> filtrarPorVuelo(String? codigo) async {
    state = state.copyWith(filtroVuelo: codigo);
    await cargarPasajeros();
  }

  Future<void> filtrarPorEstado(String? estado) async {
    state = state.copyWith(filtroEstado: estado);
    await cargarPasajeros();
  }

  void limpiarFiltros() {
    state = state.copyWith(
      limpiarBusqueda: true,
      filtroVuelo: null,
      filtroEstado: null,
    );
    cargarPasajeros();
  }

  Future<void> actualizarEmbarque(String id, String estado) async {
    try {
      final pasajero = await _repository.actualizarEstadoEmbarque(id, estado);
      final index = state.pasajeros.indexWhere((p) => p.id == id);
      if (index != -1) {
        final lista = [...state.pasajeros];
        lista[index] = pasajero;
        state = state.copyWith(pasajeros: lista);
      }
    } catch (e) {
      state = state.copyWith(
        error: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }
}
