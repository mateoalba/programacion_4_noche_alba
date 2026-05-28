import 'dart:io';

void main() {

  // =========================================
  // SISTEMA DE CONTROL DE VUELOS
  // =========================================

  int pasajeros = 1;

  int totalPasajeros = 0;

  int vuelosRegistrados = 0;

  while (pasajeros > 0) {

    print(
      "Ingrese la cantidad de pasajeros "
      "(0 para finalizar):"
    );

    pasajeros =
        int.parse(
          stdin.readLineSync()!
        );

    if (pasajeros > 0) {

      vuelosRegistrados++;

      totalPasajeros += pasajeros;

      // Clasificación del vuelo
      if (pasajeros < 100) {

        print(
          "Vuelo con baja ocupación"
        );

      } else if (pasajeros <= 200) {

        print(
          "Vuelo con ocupación normal"
        );

      } else {

        print(
          "Vuelo completamente lleno"
        );
      }
    }
  }

  double promedio = 0;

  if (vuelosRegistrados > 0) {

    promedio =
        totalPasajeros /
        vuelosRegistrados;
  }

  print("\n===== RESULTADOS =====");

  print(
    "Total de pasajeros registrados: "
    "$totalPasajeros"
  );

  print(
    "Cantidad de vuelos registrados: "
    "$vuelosRegistrados"
  );

  print(
    "Promedio de pasajeros por vuelo: "
    "$promedio"
  );
}