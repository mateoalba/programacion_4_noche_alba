import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/remote/api/vuelo_remote_datasource.dart';
import 'vuelos_provider.dart';

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  final vueloDS = ref.watch(vueloDatasourceProvider);
  return DashboardNotifier(vueloDS);
});

class DashboardState {
  final int totalVuelos;
  final int vuelosProgramados;
  final int vuelosEnVuelo;
  final int vuelosRetrasados;
  final int vuelosCancelados;
  final int vuelosAterrizados;
  final int totalPasajeros;
  final int pasajerosAbordados;
  final int pasajerosPendientes;
  final int pasajerosAusentes;
  final double tasaOcupacion;
  final List<Map<String, dynamic>> vuelosPorEstado;
  final List<Map<String, dynamic>> vuelosPorAerolinea;
  final bool cargando;
  final String? error;

  const DashboardState({
    this.totalVuelos = 0,
    this.vuelosProgramados = 0,
    this.vuelosEnVuelo = 0,
    this.vuelosRetrasados = 0,
    this.vuelosCancelados = 0,
    this.vuelosAterrizados = 0,
    this.totalPasajeros = 0,
    this.pasajerosAbordados = 0,
    this.pasajerosPendientes = 0,
    this.pasajerosAusentes = 0,
    this.tasaOcupacion = 0.0,
    this.vuelosPorEstado = const [],
    this.vuelosPorAerolinea = const [],
    this.cargando = false,
    this.error,
  });

  DashboardState copyWith({
    int? totalVuelos,
    int? vuelosProgramados,
    int? vuelosEnVuelo,
    int? vuelosRetrasados,
    int? vuelosCancelados,
    int? vuelosAterrizados,
    int? totalPasajeros,
    int? pasajerosAbordados,
    int? pasajerosPendientes,
    int? pasajerosAusentes,
    double? tasaOcupacion,
    List<Map<String, dynamic>>? vuelosPorEstado,
    List<Map<String, dynamic>>? vuelosPorAerolinea,
    bool? cargando,
    String? error,
  }) {
    return DashboardState(
      totalVuelos: totalVuelos ?? this.totalVuelos,
      vuelosProgramados: vuelosProgramados ?? this.vuelosProgramados,
      vuelosEnVuelo: vuelosEnVuelo ?? this.vuelosEnVuelo,
      vuelosRetrasados: vuelosRetrasados ?? this.vuelosRetrasados,
      vuelosCancelados: vuelosCancelados ?? this.vuelosCancelados,
      vuelosAterrizados: vuelosAterrizados ?? this.vuelosAterrizados,
      totalPasajeros: totalPasajeros ?? this.totalPasajeros,
      pasajerosAbordados: pasajerosAbordados ?? this.pasajerosAbordados,
      pasajerosPendientes: pasajerosPendientes ?? this.pasajerosPendientes,
      pasajerosAusentes: pasajerosAusentes ?? this.pasajerosAusentes,
      tasaOcupacion: tasaOcupacion ?? this.tasaOcupacion,
      vuelosPorEstado: vuelosPorEstado ?? this.vuelosPorEstado,
      vuelosPorAerolinea: vuelosPorAerolinea ?? this.vuelosPorAerolinea,
      cargando: cargando ?? this.cargando,
      error: error,
    );
  }
}

class DashboardNotifier extends StateNotifier<DashboardState> {
  final VueloRemoteDatasource _vueloDS;

  DashboardNotifier(this._vueloDS) : super(const DashboardState()) {
    cargarDashboard();
  }

  Future<void> cargarDashboard() async {
    state = state.copyWith(cargando: true);
    try {
      final vuelos = await _vueloDS.obtenerVuelos(limite: 200);

      final totalVuelos = vuelos.length;
      final programados = vuelos.where((v) => v.estaProgramado).length;
      final enVuelo = vuelos.where((v) => v.estaEnVuelo).length;
      final retrasados = vuelos.where((v) => v.estado == 'retrasado').length;
      final cancelados = vuelos.where((v) => v.estado == 'cancelado').length;
      final aterrizados = vuelos.where((v) => v.estaAterrizado).length;

      int totalCapacidad = 0;
      int totalAbordados = 0;
      for (final v in vuelos) {
        totalCapacidad += v.capacidad;
        totalAbordados += v.pasajerosAbordados;
      }
      final tasaOcupacion =
          totalCapacidad > 0 ? totalAbordados / totalCapacidad : 0.0;

      final Map<String, int> porEstadoMap = {};
      for (final v in vuelos) {
        porEstadoMap[v.estado] = (porEstadoMap[v.estado] ?? 0) + 1;
      }
      final porEstado = porEstadoMap.entries
          .map((e) => {'estado': e.key, 'cantidad': e.value})
          .toList();

      final Map<String, int> porAerolineaMap = {};
      for (final v in vuelos) {
        final nombre = v.aerolineaNombre.isNotEmpty
            ? v.aerolineaNombre
            : v.aerolineaCodigo;
        porAerolineaMap[nombre] = (porAerolineaMap[nombre] ?? 0) + 1;
      }
      final porAerolinea = porAerolineaMap.entries
          .map((e) => {'aerolinea': e.key, 'cantidad': e.value})
          .toList();

      state = state.copyWith(
        totalVuelos: totalVuelos,
        vuelosProgramados: programados,
        vuelosEnVuelo: enVuelo,
        vuelosRetrasados: retrasados,
        vuelosCancelados: cancelados,
        vuelosAterrizados: aterrizados,
        totalPasajeros: totalAbordados,
        pasajerosAbordados: totalAbordados,
        pasajerosPendientes: totalCapacidad - totalAbordados,
        pasajerosAusentes: 0,
        tasaOcupacion: tasaOcupacion,
        vuelosPorEstado: porEstado,
        vuelosPorAerolinea: porAerolinea,
        cargando: false,
      );
    } catch (e) {
      state = state.copyWith(
        cargando: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  Future<void> recargar() async {
    await cargarDashboard();
  }
}
