import '../model/pasajero.dart';

abstract class PasajeroRepository {
  Future<List<Pasajero>> obtenerPasajeros({
    String? busqueda,
    String? vueloCodigo,
    String? estadoEmbarque,
    int pagina = 1,
    int limite = 20,
  });

  Future<Pasajero> obtenerPasajeroPorId(String id);

  Future<Pasajero> crearPasajero(Pasajero pasajero);

  Future<Pasajero> actualizarPasajero(String id, Pasajero pasajero);

  Future<void> eliminarPasajero(String id);

  Future<Pasajero> actualizarEstadoEmbarque(String id, String estado);

  Future<List<Pasajero>> obtenerPasajerosPorVuelo(String codigoVuelo);

  Future<Map<String, dynamic>> obtenerEstadisticasEmbarque();
}
