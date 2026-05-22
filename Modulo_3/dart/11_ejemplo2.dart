import 'dart:io';

void main() {
  int minutos = 1;
  int totalMinutos = 0;
  int clientes = 0;

  while (minutos > 0) {
    print("Ingrese los minutos de entrenamiento (0 para finalizar):");

    minutos = int.parse(stdin.readLineSync()!);

    if (minutos > 0) {
      clientes++;
      totalMinutos += minutos;

    
      if (minutos < 30) {
        print("Entrenamiento insuficiente");
      } 
      else if (minutos <= 90) {
        print("Entrenamiento adecuado");
      } 
      else {
        print("Entrenamiento intenso");
      }
    }
  }

  double promedio = 0;

  if (clientes > 0) {
    promedio = totalMinutos / clientes;
  }

  print("\n===== RESULTADOS =====");
  print("Total de minutos entrenados: $totalMinutos");
  print("Cantidad de clientes registrados: $clientes");
  print("Promedio de minutos por cliente: $promedio");
}