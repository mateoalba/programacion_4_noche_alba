void main() {

  // =========================================
  // MAP
  // =========================================

  final pasajeros = [

    120,
    180,
    90,
    250
  ];

  // Incrementar pasajeros en 10%
  final pasajerosActualizados =

      pasajeros.map(
        (p) => p * 1.10
      );

  print(
    pasajerosActualizados.toList()
  );

  // =========================================
  // MAP SOBRE STRINGS
  // =========================================

  final vuelos = [

    'AV203',
    'IB450',
    'LA500'
  ];

  final rutas = vuelos.map(

    (v) =>
      'https://aeropuerto.com/vuelo/$v'
  );

  print(
    rutas.toList()
  );

  // =========================================
  // WHERE
  // =========================================

  final retrasos = [

    10.5,
    45.0,
    5.0,
    60.0,
    20.0,
    0.0
  ];

  final vuelosRetrasados =

      retrasos.where(
        (r) => r > 30
      );

  print(
    vuelosRetrasados.toList()
  );

  final vuelosPuntuales =

      retrasos.where(
        (r) => r <= 30
      );

  print(
    vuelosPuntuales.toList()
  );

  // =========================================
  // REDUCE Y FOLD
  // =========================================

  final equipaje = [

    1500.0,
    2300.0,
    980.0,
    3100.0,
    750.0
  ];

  // reduce
  final totalEquipaje =

      equipaje.reduce(
        (acum, peso) => acum + peso
      );

  print(
    'Peso total: '
    '${totalEquipaje.toStringAsFixed(2)} kg'
  );

  // fold
  final totalFold =

      equipaje.fold(
        0.0,
        (acum, peso) => acum + peso
      );

  print(
    'Peso total (fold): '
    '${totalFold.toStringAsFixed(2)} kg'
  );

  // Encontrar el máximo
  final mayorPeso =

      equipaje.reduce(
        (a, b) => a > b ? a : b
      );

  print(
    'Mayor carga de equipaje: '
    '$mayorPeso kg'
  );
}