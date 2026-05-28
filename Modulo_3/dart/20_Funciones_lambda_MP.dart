void main() {

  // =========================================
  // LAMBDA ASIGNADA A UNA VARIABLE
  // =========================================

  final duplicarPasajeros =
      (int pasajeros) => pasajeros * 2;

  print(
    duplicarPasajeros(180)
  ); // 360

  // =========================================
  // LAMBDA DE CUERPO COMPLETO
  // =========================================

  final calcularCombustible =
      (
        double distancia,
        double consumoPorKm
      ) {

    final combustible =
        distancia * consumoPorKm;

    return combustible;
  };

  print(
    calcularCombustible(
      850.0,
      2.5
    )
  );

  // =========================================
  // LAMBDA EN LÍNEA
  // =========================================

  final vuelos = [

    120,
    350,
    220,
    90,
    410,
    180
  ];

  // Orden descendente
  vuelos.sort(

    (a, b) => b.compareTo(a)
  );

  print(vuelos);

  // Resultado:
  // [410, 350, 220, 180, 120, 90]
}