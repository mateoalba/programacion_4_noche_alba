import '../../domain/model/pasajero.dart';
import '../../domain/repository/pasajero_repository.dart';
import '../remote/api/pasajero_remote_datasource.dart';

class PasajeroRepositoryImpl implements PasajeroRepository {
  final PasajeroRemoteDatasource _datasource;

  PasajeroRepositoryImpl(this._datasource);

  @override
  Future<List<Pasajero>> obtenerPasajeros({
    String? busqueda,
    String? vueloCodigo,
    String? estadoEmbarque,
    int pagina = 1,
    int limite = 20,
  }) {
    return _datasource.obtenerPasajeros(
      busqueda: busqueda,
      vueloCodigo: vueloCodigo,
      estadoEmbarque: estadoEmbarque,
      pagina: pagina,
      limite: limite,
    );
  }

  @override
  Future<Pasajero> obtenerPasajeroPorId(String id) {
    return _datasource.obtenerPasajeroPorId(id);
  }

  @override
  Future<Pasajero> crearPasajero(Pasajero pasajero) {
    return _datasource.crearPasajero(pasajero);
  }

  @override
  Future<Pasajero> actualizarPasajero(String id, Pasajero pasajero) {
    return _datasource.actualizarPasajero(id, pasajero);
  }

  @override
  Future<void> eliminarPasajero(String id) {
    return _datasource.eliminarPasajero(id);
  }

  @override
  Future<Pasajero> actualizarEstadoEmbarque(String id, String estado) {
    return _datasource.actualizarEstadoEmbarque(id, estado);
  }

  @override
  Future<List<Pasajero>> obtenerPasajerosPorVuelo(String codigoVuelo) {
    return _datasource.obtenerPasajerosPorVuelo(codigoVuelo);
  }

  @override
  Future<Map<String, dynamic>> obtenerEstadisticasEmbarque() {
    return _datasource.obtenerEstadisticasEmbarque();
  }
}
