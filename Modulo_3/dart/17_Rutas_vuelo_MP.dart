import 'dart:io';

void main() {

  double distanciaVuelo;

  double totalKilometros = 0;

  print(
    "Registro de rutas de vuelos"
  );

  // Registro de 5 vuelos
  for (int vuelo = 1; vuelo <= 5; vuelo++) {

    print(
      "Ingrese la distancia del vuelo "
      "$vuelo en kilómetros:"
    );

    distanciaVuelo =
        double.parse(
          stdin.readLineSync()!
        );

    totalKilometros += distanciaVuelo;

    // Clasificación de la ruta
    if (distanciaVuelo < 500) {

      print(
        "Ruta aérea corta"
      );

    } else if (distanciaVuelo <= 1500) {

      print(
        "Ruta aérea media"
      );

    } else {

      print(
        "Ruta aérea larga"
      );
    }
  }

  // Consumo estimado de combustible
  double combustible =
      totalKilometros / 12;

  double promedio =
      totalKilometros / 5;

  print("\n===== RESULTADOS =====");

  print(
    "Total de kilómetros recorridos: "
    "$totalKilometros km"
  );

  print(
    "Combustible estimado consumido: "
    "$combustible litros"
  );

  print(
    "Promedio de kilómetros por vuelo: "
    "$promedio km"
  );
}