// =========================================
// FÁBRICA DE MULTIPLICADORES
// CONTROL DE VUELOS
// =========================================

// Devuelve una función configurada
// para calcular pasajeros

int Function(int)
crearMultiplicadorPasajeros(
    int factor
) {

  return (int pasajeros) =>
      pasajeros * factor;
}

void main() {

  final duplicar =
      crearMultiplicadorPasajeros(2);

  final triplicar =
      crearMultiplicadorPasajeros(3);

  final quintuplicar =
      crearMultiplicadorPasajeros(5);

  print(
    duplicar(120)
  ); // 240

  print(
    triplicar(120)
  ); // 360

  print(
    quintuplicar(120)
  ); // 600

  // =========================================
  // VALIDADORES DE VUELOS
  // =========================================

  bool Function(double)
  crearValidadorAltitud(
      double min,
      double max
  ) {

    return (altitud) =>
        altitud >= min &&
        altitud <= max;
  }

  final vueloBajo =
      crearValidadorAltitud(
        0,
        5000
      );

  final vueloCrucero =
      crearValidadorAltitud(
        10000,
        double.infinity
      );

  print(
    vueloBajo(3500)
  ); // true

  print(
    vueloCrucero(12000)
  ); // true

  print(
    vueloCrucero(4500)
  ); // false
}