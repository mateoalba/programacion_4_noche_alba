import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/vuelo.dart';
import '../../data/remote/api/vuelo_remote_datasource.dart';
import 'vuelos_provider.dart';

final adminVuelosProvider =
    StateNotifierProvider<AdminVuelosNotifier, AdminVuelosState>((ref) {
  final datasource = ref.watch(vueloDatasourceProvider);
  return AdminVuelosNotifier(datasource);
});

class AdminVuelosState {
  final List<Vuelo> vuelos;
  final bool cargando;
  final bool guardando;
  final String? error;
  final String? exito;
  final int paginaActual;
  final bool hayMas;
  final String? busqueda;

  const AdminVuelosState({
    this.vuelos = const [],
    this.cargando = false,
    this.guardando = false,
    this.error,
    this.exito,
    this.paginaActual = 1,
    this.hayMas = true,
    this.busqueda,
  });

  AdminVuelosState copyWith({
    List<Vuelo>? vuelos,
    bool? cargando,
    bool? guardando,
    String? error,
    String? exito,
    int? paginaActual,
    bool? hayMas,
    String? busqueda,
    bool limpiarError = false,
    bool limpiarExito = false,
  }) {
    return AdminVuelosState(
      vuelos: vuelos ?? this.vuelos,
      cargando: cargando ?? this.cargando,
      guardando: guardando ?? this.guardando,
      error: limpiarError ? null : (error ?? this.error),
      exito: limpiarExito ? null : (exito ?? this.exito),
      paginaActual: paginaActual ?? this.paginaActual,
      hayMas: hayMas ?? this.hayMas,
      busqueda: busqueda ?? this.busqueda,
    );
  }
}

class AdminVuelosNotifier extends StateNotifier<AdminVuelosState> {
  final VueloRemoteDatasource _datasource;

  AdminVuelosNotifier(this._datasource) : super(const AdminVuelosState()) {
    cargarVuelos();
  }

  Future<void> cargarVuelos() async {
    state = state.copyWith(cargando: true, limpiarError: true);
    try {
      final vuelos = await _datasource.obtenerVuelos(
        busqueda: state.busqueda,
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
      final nuevos = await _datasource.obtenerVuelos(
        busqueda: state.busqueda,
        pagina: nuevaPagina,
      );
      state = state.copyWith(
        vuelos: [...state.vuelos, ...nuevos],
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

  Future<bool> crearVuelo(Vuelo vuelo) async {
    state = state.copyWith(guardando: true, limpiarError: true, limpiarExito: true);
    try {
      final nuevo = await _datasource.crearVuelo(vuelo);
      state = state.copyWith(
        vuelos: [nuevo, ...state.vuelos],
        guardando: false,
        exito: 'Vuelo ${nuevo.codigoVuelo} creado exitosamente',
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

  Future<bool> actualizarVuelo(String id, Vuelo vuelo) async {
    state = state.copyWith(guardando: true, limpiarError: true, limpiarExito: true);
    try {
      final actualizado = await _datasource.actualizarVuelo(id, vuelo);
      final index = state.vuelos.indexWhere((v) => v.id == id);
      if (index != -1) {
        final lista = [...state.vuelos];
        lista[index] = actualizado;
        state = state.copyWith(
          vuelos: lista,
          guardando: false,
          exito: 'Vuelo ${actualizado.codigoVuelo} actualizado',
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

  Future<bool> eliminarVuelo(String id) async {
    state = state.copyWith(guardando: true, limpiarError: true, limpiarExito: true);
    try {
      await _datasource.eliminarVuelo(id);
      state = state.copyWith(
        vuelos: state.vuelos.where((v) => v.id != id).toList(),
        guardando: false,
        exito: 'Vuelo eliminado exitosamente',
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

  Future<bool> actualizarEstado(String id, String estado) async {
    try {
      final actualizado = await _datasource.cambiarEstado(id, estado);
      final index = state.vuelos.indexWhere((v) => v.id == id);
      if (index != -1) {
        final lista = [...state.vuelos];
        lista[index] = actualizado;
        state = state.copyWith(vuelos: lista);
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
    cargarVuelos();
  }
}
