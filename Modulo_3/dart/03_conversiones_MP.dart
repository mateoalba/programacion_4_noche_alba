void main() {

  // =========================================
  // CONVERSIONES - CONTROL DE VUELOS
  // =========================================

  // Conversiones numéricas
  int pasajeros = 180;

  double pasajerosDouble =
      pasajeros.toDouble();

  String pasajerosTexto =
      pasajeros.toString();

  print(pasajerosDouble);
  print(pasajerosTexto);

  // String → número
  int pista = int.parse('12');

  double altitud =
      double.parse('10500.5');

  print(pista);
  print(altitud);

  // Conversión segura
  int? puerta =
      int.tryParse('A12');

  double? velocidad =
      double.tryParse('850');

  print(puerta);      // null
  print(velocidad);   // 850.0

  // Verificar tipo con is
  Object vuelo = 'AV203';

  if (vuelo is String) {

    print(
      'Código del vuelo: ${vuelo.length} caracteres'
    );
  }

  // Cast explícito con as
  Object destino = 'Madrid';

  String ciudad = destino as String;

  print(ciudad);

  // Comprobar nulabilidad
  String? terminal = null;

  int longitud =
      terminal?.length ?? 0;

  print(longitud);

  // Números especiales
  print(double.infinity);

  print(double.nan);

  print(double.maxFinite);
}