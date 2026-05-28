import 'dart:io';

void main() {

  // =========================================
  // SISTEMA DE CONTROL DE VUELOS
  // =========================================

  int vuelos = 1;

  int totalVuelos = 0;

  int controladores = 0;

  while (vuelos > 0) {

    print(
      "Ingrese la cantidad de vuelos "
      "gestionados (0 para finalizar):"
    );

    vuelos =
        int.parse(
          stdin.readLineSync()!
        );

    if (vuelos > 0) {

      controladores++;

      totalVuelos += vuelos;

      // Clasificación de gestión
      if (vuelos < 3) {

        print(
          "Tráfico aéreo bajo"
        );

      } else if (vuelos <= 7) {

        print(
          "Tráfico aéreo normal"
        );

      } else {

        print(
          "Tráfico aéreo alto"
        );
      }
    }
  }

  double promedio = 0;

  if (controladores > 0) {

    promedio =
        totalVuelos /
        controladores;
  }

  print("\n===== RESULTADOS =====");

  print(
    "Total de vuelos gestionados: "
    "$totalVuelos"
  );

  print(
    "Cantidad de controladores registrados: "
    "$controladores"
  );

  print(
    "Promedio de vuelos por controlador: "
    "$promedio"
  );
}