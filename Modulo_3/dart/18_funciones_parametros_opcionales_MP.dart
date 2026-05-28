// El tercer parámetro es opcional
String construirRutaVuelo(
    String aeropuerto,
    String vuelo,
    [int? puerta]
) {

  if (puerta != null) {

    return
        'Aeropuerto: $aeropuerto '
        '| Vuelo: $vuelo '
        '| Puerta: $puerta';
  }

  return
      'Aeropuerto: $aeropuerto '
      '| Vuelo: $vuelo';
}

// Con valor por defecto
String construirRutaVueloV2(
    String aeropuerto,
    String vuelo,
    [int puerta = 1]
) {

  return
      'Aeropuerto: $aeropuerto '
      '| Vuelo: $vuelo '
      '| Puerta: $puerta';
}

// Parámetros nombrados
void configurarVuelo({

  required String codigoVuelo,

  required String destino,

  bool internacional = false,

  int pasajeros = 0,
}) {

  final tipoVuelo =
      internacional
          ? 'Internacional'
          : 'Nacional';

  print(
    'Vuelo $codigoVuelo '
    'hacia $destino '
    '| Tipo: $tipoVuelo '
    '| Pasajeros: $pasajeros'
  );
}

void main() {

  print(
    construirRutaVuelo(
      'Aeropuerto Mariscal Sucre',
      'AV203'
    )
  );

  print(
    construirRutaVuelo(
      'Aeropuerto Mariscal Sucre',
      'IB450',
      12
    )
  );

  print(
    construirRutaVueloV2(
      'Aeropuerto JFK',
      'AA700'
    )
  );

  // Parámetros nombrados
  configurarVuelo(

    codigoVuelo: 'LA500',

    destino: 'Madrid',

    internacional: true,

    pasajeros: 220,
  );

  // Solo obligatorios
  configurarVuelo(

    codigoVuelo: 'AV203',

    destino: 'Guayaquil',
  );
}