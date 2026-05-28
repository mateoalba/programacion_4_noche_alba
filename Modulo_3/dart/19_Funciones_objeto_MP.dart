// Funciones del sistema de control aéreo

int duplicarPasajeros(int pasajeros) =>
    pasajeros * 2;

int triplicarPasajeros(int pasajeros) =>
    pasajeros * 3;

void main() {

  // La variable 'operacion'
  // tiene tipo: int Function(int)

  int Function(int) operacion;

  // =========================================
  // DUPLICAR PASAJEROS
  // =========================================

  operacion = duplicarPasajeros;

  print(
    operacion(120)
  ); // 240

  // =========================================
  // TRIPLICAR PASAJEROS
  // =========================================

  operacion = triplicarPasajeros;

  print(
    operacion(120)
  ); // 360

  // =========================================
  // LISTA DE FUNCIONES
  // =========================================

  final transformaciones =

      <int Function(int)>[

        duplicarPasajeros,

        triplicarPasajeros
      ];

  for (final fn in transformaciones) {

    print(
      fn(150)
    );
  }
}