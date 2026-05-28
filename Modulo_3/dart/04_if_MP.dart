void main() {

  // =========================================
  // CONDICIONALES - CONTROL DE VUELOS
  // =========================================

  // Forma básica
  int pasajeros = 220;

  if (pasajeros > 200) {

    print('Vuelo con alta ocupación');

  } else if (pasajeros > 100) {

    print('Vuelo con ocupación normal');

  } else {

    print('Vuelo con baja ocupación');
  }

  // Operador ternario
  String estadoVuelo =
      pasajeros > 200
          ? 'Vuelo lleno'
          : 'Vuelo disponible';

  print(estadoVuelo);

  // null-aware con ternario
  String? terminal;

  String display =
      terminal != null
          ? terminal.toUpperCase()
          : 'Sin terminal asignada';

  print(display);

  // Forma más corta con ??
  String display2 =
      terminal?.toUpperCase()
          ?? 'Sin terminal asignada';

  print(display2);

  // =========================================
  // NULL SAFETY
  // =========================================

  String? piloto;

  // Forma 1 — verificación explícita
  if (piloto != null) {

    print(piloto.length);
  }

  // Forma 2 — operador ?.
  print(piloto?.length);

  // Forma 3 — valor por defecto
  int longitud =
      piloto?.length ?? 0;

  print(longitud);
}