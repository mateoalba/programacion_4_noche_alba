 // Función sin parámetros y sin retorno
void iniciarSistema() {

  print('Sistema de control de vuelos iniciado');
}

// Función con parámetros y sin retorno
void registrarVuelo(String codigoVuelo) {

  print('Vuelo registrado: $codigoVuelo');
}

// Función sin parámetros y con retorno
int obtenerPuertasDisponibles() {

  return 12;
}

// Función con parámetros y con retorno
int sumarPasajeros(
    int pasajerosVuelo1,
    int pasajerosVuelo2
) {

  return pasajerosVuelo1 + pasajerosVuelo2;
}

// Función flecha
int calcularEquipaje(
    int maletas,
    int pesoPromedio
) => maletas * pesoPromedio;

// Función con parámetros opcionales
void mostrarPiloto(
    String nombre,
    [String? apellido]
) {

  if (apellido != null) {

    print(
      'Piloto: $nombre $apellido'
    );

  } else {

    print(
      'Piloto: $nombre'
    );
  }
}

// Función con parámetros nombrados
void mostrarDestino(
    String vuelo,
    {String? destino}
) {

  if (destino != null) {

    print(
      'Vuelo $vuelo con destino a $destino'
    );

  } else {

    print(
      'Vuelo $vuelo sin destino asignado'
    );
  }
}

void main() {

  iniciarSistema();

  registrarVuelo('AV203');

  int puertas =
      obtenerPuertasDisponibles();

  print(puertas);

  print(
    'Puertas disponibles: '
    '${obtenerPuertasDisponibles()}'
  );

  print(
    'Total pasajeros: '
    '${sumarPasajeros(180, 220)}'
  );

  print(
    'Peso total equipaje: '
    '${calcularEquipaje(30, 25)} kg'
  );

  mostrarPiloto('Carlos');

  mostrarPiloto(
    'Carlos',
    'Mendoza'
  );

  mostrarDestino('AV203');

  mostrarDestino(
    'AV203',
    destino: 'Madrid'
  );
}