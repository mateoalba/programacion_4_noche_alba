import 'dart:io';

void main() {
  int muebles = 1;
  int totalMuebles = 0;
  int trabajadores = 0;

  while (muebles > 0) {
    print("Ingrese la cantidad de muebles fabricados (0 para finalizar):");

    muebles = int.parse(stdin.readLineSync()!);

    if (muebles > 0) {
      trabajadores++;
      totalMuebles += muebles;

      if (muebles < 3) {
        print("Producción baja");
      } 
      else if (muebles <= 7) {
        print("Producción normal");
      } 
      else {
        print("Producción alta");
      }
    }
  }

  double promedio = 0;

  if (trabajadores > 0) {
    promedio = totalMuebles / trabajadores;
  }

  print("\n===== RESULTADOS =====");
  print("Total de muebles fabricados: $totalMuebles");
  print("Cantidad de trabajadores registrados: $trabajadores");
  print("Promedio de muebles por trabajador: $promedio");
}