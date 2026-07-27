import '../model/vuelo.dart';

abstract class VueloRepository {
  Future<List<Vuelo>> obtenerVuelos({
    String? busqueda,
    String? estado,
    String? aerolinea,
    bool? internacional,
    int pagina = 1,
    int limite = 20,
  });

  Future<Vuelo> obtenerVueloPorId(String id);

  Future<Vuelo> crearVuelo(Vuelo vuelo);

  Future<Vuelo> actualizarVuelo(String id, Vuelo vuelo);

  Future<void> eliminarVuelo(String id);

  Future<Vuelo> cambiarEstado(String id, String estado);

  Future<List<Vuelo>> obtenerVuelosPorRuta({
    required String origen,
    required String destino,
  });
}
