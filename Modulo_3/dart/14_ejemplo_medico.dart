import 'dart:io';

void main() {
  double horas = 1;
  int pacientes = 0;

  int totalPacientes = 0;
  int doctores = 0;

  while (horas > 0) {
    print("Ingrese las horas trabajadas (0 para finalizar):");
    horas = double.parse(stdin.readLineSync()!);

    if (horas > 0) {
      print("Ingrese la cantidad de pacientes atendidos:");
      pacientes = int.parse(stdin.readLineSync()!);

      doctores++;
      totalPacientes += pacientes;

      double pacientesHora = pacientes / horas;

      if (pacientesHora < 3) {
        print("Atención lenta");
      } 
      else if (pacientesHora <= 6) {
        print("Atención normal");
      } 
      else {
        print("Atención rápida");
      }
    }
  }

  double promedio = 0;

  if (doctores > 0) {
    promedio = totalPacientes / doctores;
  }

  print("\n===== RESULTADOS =====");
  print("Total de pacientes atendidos: $totalPacientes");
  print("Cantidad de doctores registrados: $doctores");
  print("Promedio de pacientes por doctor: $promedio");
}