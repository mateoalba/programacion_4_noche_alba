import 'dart:io';

void main() {

  int vuelosGestionados,
      totalVuelos = 0,
      controladores = 0;

  stdout.write(
    "Vuelos gestionados (0 para salir): "
  );

  vuelosGestionados =
      int.parse(
        stdin.readLineSync()!
      );

  while (vuelosGestionados > 0) {

    // Clasificación del tráfico aéreo
    if (vuelosGestionados < 15) {

      print(
        "Tráfico aéreo bajo"
      );

    } else if (vuelosGestionados <= 40) {

      print(
        "Control de vuelos eficiente"
      );

    } else {

      print(
        "Control aéreo sobresaliente"
      );
    }

    totalVuelos += vuelosGestionados;

    controladores++;

    stdout.write(
      "Vuelos gestionados "
      "(0 para salir): "
    );

    vuelosGestionados =
        int.parse(
          stdin.readLineSync()!
        );
  }

  print(
    "\nTotal de vuelos gestionados: "
    "$totalVuelos"
  );

  print(
    "Controladores registrados: "
    "$controladores"
  );

  if (controladores > 0) {

    print(
      "Promedio de vuelos por controlador: "
      "${totalVuelos / controladores}"
    );
  }
}