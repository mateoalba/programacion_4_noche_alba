// =========================================
// MODELO ORIENTADO A OBJETOS
// SISTEMA DE CONTROL DE VUELOS
// =========================================

class Vuelo {

  // 1. Propiedades
  final String codigo;
  final String aerolinea;
  String       ruta;
  bool         _activo = false;

  // 2. Constructor nombrado
  Vuelo({
    required this.codigo,
    required this.aerolinea,
    required this.ruta,
  });

  // 3. Getters (solo lectura)
  bool get activo => _activo;

  String get estado =>
      _activo ? 'en vuelo' : 'en tierra';

  // 4. Setter controlado
  set estadoVuelo(bool valor) {
    _activo = valor;
    print(
      '$codigo: ${valor ? "despegó" : "aterrizó"}'
    );
  }

  // 5. Métodos
  void despegar() {
    _activo = true;
    print(
      '$codigo de $aerolinea despegando en ruta $ruta'
    );
  }

  void aterrizar() {
    _activo = false;
    print(
      '$codigo aterrizó correctamente'
    );
  }

  String resumen() =>
      'Vuelo: $codigo | Aerolínea: $aerolinea | Ruta: $ruta | Estado: $estado';

  // 6. toString
  @override
  String toString() =>
      'Vuelo($codigo, $aerolinea, $estado)';
}

void main() {

  final vuelo1 = Vuelo(
    codigo: 'AV203',
    aerolinea: 'Avianca',
    ruta: 'Quito - Bogotá',
  );

  final vuelo2 = Vuelo(
    codigo: 'LA450',
    aerolinea: 'LATAM',
    ruta: 'Quito - Lima',
  );

  // Operaciones
  vuelo1.despegar();
  print(vuelo1.estado);
  print(vuelo1.resumen());
  print(vuelo1);

  vuelo1.estadoVuelo = false;

  print(vuelo1.activo);

  vuelo2.despegar();
  vuelo2.aterrizar();
  print(vuelo2.resumen());
}