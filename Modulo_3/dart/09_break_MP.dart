void main() {

  // =========================================
  // BREAK Y CONTINUE
  // CONTROL DE VUELOS
  // =========================================

  final vuelos = [

    180,
    220,
    -1,
    150,
    300,
    -1,
    90
  ];

  // ==============================
  // continue
  // ==============================

  print('=== Procesando vuelos con continue ===');

  for (final pasajeros in vuelos) {

    if (pasajeros < 0) {

      print(
        'Vuelo con datos inválidos ignorado'
      );

      continue;
    }

    print(
      'Procesando vuelo con '
      '$pasajeros pasajeros'
    );
  }

  // ==============================
  // break
  // ==============================

  print('\n=== Procesando vuelos con break ===');

  for (final pasajeros in vuelos) {

    if (pasajeros < 0) {

      print(
        'Error crítico en datos del vuelo '
        '- deteniendo sistema'
      );

      break;
    }

    print(
      'Procesando vuelo con '
      '$pasajeros pasajeros'
    );
  }
}