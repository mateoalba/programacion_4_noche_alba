import 'dart:io';

void main() {
  int tablas, total = 0, operarios = 0;

  stdout.write("Tablas cortadas (0 para salir): ");
  tablas = int.parse(stdin.readLineSync()!);

  while (tablas > 0) {

    if (tablas < 15) {
      print("Trabajo lento");
    } else if (tablas <= 40) {
      print("Trabajo eficiente");
    } else {
      print("Trabajo sobresaliente");
    }

    total += tablas;
    operarios++;

    stdout.write("Tablas cortadas (0 para salir): ");
    tablas = int.parse(stdin.readLineSync()!);
  }

  print("\nTotal de tablas: $total");
  print("Operarios registrados: $operarios");

  if (operarios > 0) {
    print("Promedio: ${total / operarios}");
  }
}