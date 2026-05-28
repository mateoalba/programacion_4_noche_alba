import 'dart:io';

void main() {

  int totalVuelos = 0;

  int vuelosDia;

  print(
    "Registro semanal de vuelos del aeropuerto"
  );

  // Registro de vuelos durante 7 días
  for (int dia = 1; dia <= 7; dia++) {

    print(
      "Ingrese la cantidad de vuelos "
      "del día $dia:"
    );

    vuelosDia =
        int.parse(
          stdin.readLineSync()!
        );

    totalVuelos += vuelosDia;
  }

  double promedio =
      totalVuelos / 7;

  String rendimiento;

  // Clasificación del tráfico aéreo
  if (promedio < 10) {

    rendimiento =
        "Bajo tráfico aéreo";

  } else if (promedio <= 25) {

    rendimiento =
        "Tráfico aéreo normal";

  } else {

    rendimiento =
        "Alto tráfico aéreo";
  }

  print("\n===== RESULTADOS =====");

  print(
    "Total de vuelos registrados: "
    "$totalVuelos"
  );

  print(
    "Promedio diario de vuelos: "
    "$promedio"
  );

  print(
    "Clasificación operativa: "
    "$rendimiento"
  );
}