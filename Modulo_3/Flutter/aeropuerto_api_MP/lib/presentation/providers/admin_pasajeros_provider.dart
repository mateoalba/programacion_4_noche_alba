import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/pasajero.dart';
import '../../data/remote/api/pasajero_remote_datasource.dart';
import 'pasajeros_provider.dart';

final adminPasajerosProvider =
    StateNotifierProvider<AdminPasajerosNotifier, AdminPasajerosState>((ref) {
  final datasource = ref.watch(pasajeroDatasourceProvider);
  return AdminPasajerosNotifier(datasource);
});

class AdminPasajerosState {
  final List<Pasajero> pasajeros;
  final bool cargando;
  final bool guardando;
  final String? error;
  final String? exito;
  final int paginaActual;
  final bool hayMas;
  final String? busqueda;
  final String? filtroVuelo;

  const AdminPasajerosState({
    this.pasajeros = const [],
    this.cargando = false,
    this.guardando = false,
    this.error,
    this.exito,
    this.paginaActual = 1,
    this.hayMas = true,
    this.busqueda,
    this.filtroVuelo,
  });

  AdminPasajerosState copyWith({
    List<Pasajero>? pasajeros,
    bool? cargando,
    bool? guardando,
    String? error,
    String? exito,
    int? paginaActual,
    bool? hayMas,
    String? busqueda,
    String? filtroVuelo,
    bool limpiarError = false,
    bool limpiarExito = false,
  }) {
    return AdminPasajerosState(
      pasajeros: pasajeros ?? this.pasajeros,
      cargando: cargando ?? this.cargando,
      guardando: guardando ?? this.guardando,
      error: limpiarError ? null : (error ?? this.error),
      exito: limpiarExito ? null : (exito ?? this.exito),
      paginaActual: paginaActual ?? this.paginaActual,
      hayMas: hayMas ?? this.hayMas,
      busqueda: busqueda ?? this.busqueda,
      filtroVuelo: filtroVuelo ?? this.filtroVuelo,
    );
  }
}

class AdminPasajerosNotifier extends StateNotifier<AdminPasajerosState> {
  final PasajeroRemoteDatasource _datasource;

  AdminPasajerosNotifier(this._datasource)
      : super(const AdminPasajerosState()) {
    cargarPasajeros();
  }

  Future<void> cargarPasajeros() async {
    state = state.copyWith(cargando: true, limpiarError: true);
    try {
      final pasajeros = await _datasource.obtenerPasajeros(
        busqueda: state.busqueda,
        vueloCodigo: state.filtroVuelo,
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
      final nuevos = await _datasource.obtenerPasajeros(
        busqueda: state.busqueda,
        vueloCodigo: state.filtroVuelo,
        pagina: nuevaPagina,
      );
      state = state.copyWith(
        pasajeros: [...state.pasajeros, ...nuevos],
        cargando: false,
        paginaActual: nuevaPagina,
        hayMas: nuevos.length >= 20,
      );
    } catch (e) {
      state = state.copyWith(
        cargando: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  Future<bool> crearPasajero(Pasajero pasajero) async {
    state = state.copyWith(guardando: true, limpiarError: true, limpiarExito: true);
    try {
      final nuevo = await _datasource.crearPasajero(pasajero);
      state = state.copyWith(
        pasajeros: [nuevo, ...state.pasajeros],
        guardando: false,
        exito: 'Pasajero ${nuevo.nombreCompleto} registrado',
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        guardando: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }

  Future<bool> actualizarPasajero(String id, Pasajero pasajero) async {
    state = state.copyWith(guardando: true, limpiarError: true, limpiarExito: true);
    try {
      final actualizado = await _datasource.actualizarPasajero(id, pasajero);
      final index = state.pasajeros.indexWhere((p) => p.id == id);
      if (index != -1) {
        final lista = [...state.pasajeros];
        lista[index] = actualizado;
        state = state.copyWith(
          pasajeros: lista,
          guardando: false,
          exito: 'Pasajero ${actualizado.nombreCompleto} actualizado',
        );
      }
      return true;
    } catch (e) {
      state = state.copyWith(
        guardando: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }

  Future<bool> eliminarPasajero(String id) async {
    state = state.copyWith(guardando: true, limpiarError: true, limpiarExito: true);
    try {
      await _datasource.eliminarPasajero(id);
      state = state.copyWith(
        pasajeros: state.pasajeros.where((p) => p.id != id).toList(),
        guardando: false,
        exito: 'Pasajero eliminado exitosamente',
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        guardando: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }

  Future<bool> actualizarEmbarque(String id, String estado) async {
    try {
      final actualizado = await _datasource.actualizarEstadoEmbarque(id, estado);
      final index = state.pasajeros.indexWhere((p) => p.id == id);
      if (index != -1) {
        final lista = [...state.pasajeros];
        lista[index] = actualizado;
        state = state.copyWith(pasajeros: lista);
      }
      return true;
    } catch (e) {
      state = state.copyWith(
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }

  void buscar(String? termino) {
    state = state.copyWith(busqueda: termino);
    cargarPasajeros();
  }

  void filtrarPorVuelo(String? codigo) {
    state = state.copyWith(filtroVuelo: codigo);
    cargarPasajeros();
  }
}
