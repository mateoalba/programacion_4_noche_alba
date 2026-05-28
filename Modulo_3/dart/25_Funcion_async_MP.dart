import 'dart:io';

// async → la función retorna Future<String>
Future<String> obtenerEstadoVuelo() async {

  // Simula tiempo de consulta
  await Future.delayed(
    Duration(seconds: 2)
  );

  return 'Vuelo AV203 autorizado para despegar';
}

// main también puede ser async
void main() async {

  print(
    'Consultando estado del vuelo...'
  );

  final estado =
      await obtenerEstadoVuelo();

  print(
    'Estado: $estado'
  );

  print(
    'Consulta completada'
  );
}