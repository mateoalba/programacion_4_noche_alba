import 'dart:io';

void main() {
  int vuelos = 1;
  int pasajeros = 0;
  int retrasos = 0;

  int totalPasajeros = 0;
  int totalRetrasos = 0;
  int totalVuelos = 0;
  int agentes = 0;

  while (vuelos > 0) {
    print("Ingrese la cantidad de vuelos atendidos (0 para finalizar):");
    vuelos = int.parse(stdin.readLineSync()!);

    if (vuelos > 0) {
      print("Ingrese la cantidad de pasajeros procesados:");
      pasajeros = int.parse(stdin.readLineSync()!);

      print("Ingrese los minutos totales de retraso:");
      retrasos = int.parse(stdin.readLineSync()!);

      agentes++;

      totalPasajeros += pasajeros;
      totalRetrasos += retrasos;
      totalVuelos += vuelos;

      double pasajerosPorVuelo = pasajeros / vuelos;
      double retrasoPorVuelo = retrasos / vuelos;

      print("Pasajeros por vuelo: $pasajerosPorVuelo");
      print("Retraso por vuelo: $retrasoPorVuelo");

      if (pasajerosPorVuelo < 50) {
        print("Baja eficiencia");
      } 
      else if (pasajerosPorVuelo <= 120) {
        print("Eficiencia normal");
      } 
      else {
        print("Alta eficiencia");
      }
    }
  }

  double promedioPasajeros = 0;
  double promedioRetrasoGeneral = 0;

  if (agentes > 0) {
    promedioPasajeros = totalPasajeros / agentes;
  }

  if (totalVuelos > 0) {
    promedioRetrasoGeneral = totalRetrasos / totalVuelos;
  }

  print("\n===== RESULTADOS =====");
  print("Total de pasajeros procesados: $totalPasajeros");
  print("Total de minutos de retraso acumulados: $totalRetrasos");
  print("Cantidad de agentes registrados: $agentes");
  print("Promedio de pasajeros por agente: $promedioPasajeros");
  print("Promedio general de retraso por vuelo: $promedioRetrasoGeneral");
}