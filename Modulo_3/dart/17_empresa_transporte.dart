import 'dart:io';

void main() {
  double kilometros;
  double totalKilometros = 0;

  print("Registro de viajes");

  for (int viaje = 1; viaje <= 5; viaje++) {
    print("Ingrese los kilómetros del viaje $viaje:");

    kilometros = double.parse(stdin.readLineSync()!);

    totalKilometros += kilometros;

    if (kilometros < 50) {
      print("Ruta corta");
    } 
    else if (kilometros <= 150) {
      print("Ruta media");
    } 
    else {
      print("Ruta larga");
    }
  }

  double combustible = totalKilometros / 12;
  double promedio = totalKilometros / 5;

  print("\n===== RESULTADOS =====");
  print("Total de kilómetros recorridos: $totalKilometros km");
  print("Total de combustible estimado: $combustible litros");
  print("Promedio de kilómetros por viaje: $promedio km");
}