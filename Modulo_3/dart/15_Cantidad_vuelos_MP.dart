import 'dart:io';

void main() {

  int vuelos = 1;

  int pasajeros = 0;

  int retrasos = 0;

  int totalPasajeros = 0;

  int totalRetrasos = 0;

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

      print(
        "Ingrese la cantidad de pasajeros procesados:"
      );

      pasajeros =
          int.parse(
            stdin.readLineSync()!
          );

      print(
        "Ingrese los minutos totales de retraso:"
      );

      retrasos =
          int.parse(
            stdin.readLineSync()!
          );

      controladores++;

      totalPasajeros += pasajeros;

      totalRetrasos += retrasos;

      totalVuelos += vuelos;

      double pasajerosPorVuelo =
          pasajeros / vuelos;

      double retrasoPorVuelo =
          retrasos / vuelos;

      print(
        "Pasajeros por vuelo: "
        "$pasajerosPorVuelo"
      );

      print(
        "Retraso promedio por vuelo: "
        "$retrasoPorVuelo minutos"
      );

      // Clasificación de eficiencia
      if (pasajerosPorVuelo < 50) {

        print(
          "Baja eficiencia operativa"
        );

      } else if (pasajerosPorVuelo <= 120) {

        print(
          "Eficiencia operativa normal"
        );

      } else {

        print(
          "Alta eficiencia operativa"
        );
      }
    }
  }

  double promedioPasajeros = 0;

  double promedioRetrasoGeneral = 0;

  if (controladores > 0) {

    promedioPasajeros =
        totalPasajeros /
        controladores;
  }

  if (totalVuelos > 0) {

    promedioRetrasoGeneral =
        totalRetrasos /
        totalVuelos;
  }

  print("\n===== RESULTADOS =====");

  print(
    "Total de pasajeros procesados: "
    "$totalPasajeros"
  );

  print(
    "Total de minutos de retraso acumulados: "
    "$totalRetrasos"
  );

  print(
    "Cantidad de controladores registrados: "
    "$controladores"
  );

  print(
    "Promedio de pasajeros por controlador: "
    "$promedioPasajeros"
  );

  print(
    "Promedio general de retraso por vuelo: "
    "$promedioRetrasoGeneral"
  );
}