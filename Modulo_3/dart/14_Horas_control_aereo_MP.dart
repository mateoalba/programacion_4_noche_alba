import 'dart:io';

void main() {

  double horasControl = 1;

  int vuelosAtendidos = 0;

  int totalVuelos = 0;

  int controladores = 0;

  while (horasControl > 0) {

    print(
      "Ingrese las horas de control aéreo "
      "(0 para finalizar):"
    );

    horasControl =
        double.parse(
          stdin.readLineSync()!
        );

    if (horasControl > 0) {

      print(
        "Ingrese la cantidad de vuelos gestionados:"
      );

      vuelosAtendidos =
          int.parse(
            stdin.readLineSync()!
          );

      controladores++;

      totalVuelos += vuelosAtendidos;

      double vuelosPorHora =
          vuelosAtendidos / horasControl;

      // Clasificación del desempeño
      if (vuelosPorHora < 3) {

        print(
          "Control aéreo lento"
        );

      } else if (vuelosPorHora <= 6) {

        print(
          "Control aéreo normal"
        );

      } else {

        print(
          "Control aéreo rápido"
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