void main() {

  // =========================================
  // WHILE - CONTROL DE VUELOS
  // =========================================

  // while — verifica la condición antes de ejecutar

  int vuelosProcesados = 0;

  int pasajerosPendientes = 950;

  while (pasajerosPendientes > 0) {

    final pasajerosAbordados =
        pasajerosPendientes > 200
            ? 200
            : pasajerosPendientes;

    vuelosProcesados++;

    pasajerosPendientes -= pasajerosAbordados;

    print(
      'Vuelo $vuelosProcesados: '
      '$pasajerosAbordados pasajeros abordados '
      '(restantes: $pasajerosPendientes)'
    );
  }

  // =========================================
  // DO-WHILE
  // =========================================

  int intentosRadar = 0;

  bool radarActivo = false;

  do {

    intentosRadar++;

    print(
      'Intentando conectar radar '
      '#$intentosRadar...'
    );

    // Simular conexión en el tercer intento
    if (intentosRadar == 3) {

      radarActivo = true;
    }

  } while (
      !radarActivo &&
      intentosRadar < 5
  );

  print(

    radarActivo
        ? 'Radar conectado tras '
          '$intentosRadar intentos'

        : 'No se pudo conectar el radar'
  );
}