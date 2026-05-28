// Tipo explícito del parámetro función
// bool Function(int)

List<int> filtrarVuelos(
    List<int> lista,
    bool Function(int) criterio
) {

  return lista
      .where(criterio)
      .toList();
}

// Verifica vuelos con número par
bool vuelosPares(int n) =>
    n % 2 == 0;

// Verifica vuelos con alta cantidad de pasajeros
bool vuelosGrandes(int n) =>
    n > 200;

void main() {

  final pasajerosPorVuelo = [

    120,
    75,
    300,
    180,
    250,
    95,
    400,
    60
  ];

  // =========================================
  // FILTRAR VUELOS PARES
  // =========================================

  print(
    filtrarVuelos(
      pasajerosPorVuelo,
      vuelosPares
    )
  );

  // Resultado:
  // [120, 300, 180, 250, 400, 60]

  // =========================================
  // FILTRAR VUELOS GRANDES
  // =========================================

  print(
    filtrarVuelos(
      pasajerosPorVuelo,
      vuelosGrandes
    )
  );

  // Resultado:
  // [300, 250, 400]

  // =========================================
  // LAMBDA EN LÍNEA
  // =========================================

  print(
    filtrarVuelos(

      pasajerosPorVuelo,

      (n) => n > 100 && n < 300
    )
  );

  // Resultado:
  // [120, 180, 250]
}