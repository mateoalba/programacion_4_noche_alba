import 'dart:io';

void main() {
  int totalVentas = 0;
  int ventasDia;

  print("Registro de ventas semanales");

  for (int dia = 1; dia <= 7; dia++) {
    print("Ingrese las ventas del día $dia:");

    ventasDia = int.parse(stdin.readLineSync()!);

    totalVentas += ventasDia;
  }

  double promedio = totalVentas / 7;

  String rendimiento;

  if (promedio < 10) {
    rendimiento = "Bajo rendimiento";
  } 
  else if (promedio <= 25) {
    rendimiento = "Rendimiento normal";
  } 
  else {
    rendimiento = "Alto rendimiento";
  }

  print("\n===== RESULTADOS =====");
  print("Total de ventas: $totalVentas");
  print("Promedio de ventas: $promedio");
  print("Clasificación: $rendimiento");
}