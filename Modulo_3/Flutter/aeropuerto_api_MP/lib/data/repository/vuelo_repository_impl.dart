import '../../domain/model/vuelo.dart';
import '../../domain/repository/vuelo_repository.dart';
import '../remote/api/vuelo_remote_datasource.dart';

class VueloRepositoryImpl implements VueloRepository {
  final VueloRemoteDatasource _datasource;

  VueloRepositoryImpl(this._datasource);

  @override
  Future<List<Vuelo>> obtenerVuelos({
    String? busqueda,
    String? estado,
    String? aerolinea,
    bool? internacional,
    int pagina = 1,
    int limite = 20,
  }) {
    return _datasource.obtenerVuelos(
      busqueda: busqueda,
      estado: estado,
      aerolinea: aerolinea,
      internacional: internacional,
      pagina: pagina,
      limite: limite,
    );
  }

  @override
  Future<Vuelo> obtenerVueloPorId(String id) {
    return _datasource.obtenerVueloPorId(id);
  }

  @override
  Future<Vuelo> crearVuelo(Vuelo vuelo) {
    return _datasource.crearVuelo(vuelo);
  }

  @override
  Future<Vuelo> actualizarVuelo(String id, Vuelo vuelo) {
    return _datasource.actualizarVuelo(id, vuelo);
  }

  @override
  Future<void> eliminarVuelo(String id) {
    return _datasource.eliminarVuelo(id);
  }

  @override
  Future<Vuelo> cambiarEstado(String id, String estado) {
    return _datasource.cambiarEstado(id, estado);
  }

  @override
  Future<List<Vuelo>> obtenerVuelosPorRuta({
    required String origen,
    required String destino,
  }) {
    return _datasource.obtenerVuelosPorRuta(origen: origen, destino: destino);
  }
}
