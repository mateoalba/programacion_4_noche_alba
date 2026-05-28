import 'dart:io';

void main() {

  // =========================================
  // ENTRADA DE DATOS - CONTROL DE VUELOS
  // =========================================

  print('Ingrese el código del vuelo:');

  String? codigoVuelo = stdin.readLineSync();

  print('Vuelo registrado: $codigoVuelo');


  // Ingreso de pasajeros en varios vuelos
  for (int i = 0; i < 3; i++) {

    print(
      'Ingrese cantidad de pasajeros '
      'del vuelo ${i + 1}:'
    );

    int pasajeros =
        int.parse(
          stdin.readLineSync()!
        );

    print(
      'Pasajeros registrados: $pasajeros'
    );
  }

  // Ingreso de puerta de embarque
  print('Ingrese el número de puerta:');

  int puerta =
      int.parse(
        stdin.readLineSync()!
      );

  print('Puerta asignada: $puerta');


  // Ingreso de altitud
  print('Ingrese la altitud del vuelo:');

  double altitud =
      double.parse(
        stdin.readLineSync()!
      );

  print(
    'Altitud registrada: $altitud metros'
  );
}