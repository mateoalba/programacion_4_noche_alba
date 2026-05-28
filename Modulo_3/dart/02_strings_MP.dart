void main() {

  final codigoVuelo = 'AV203';
  final pasajeros = 180;

  // Interpolación con $
  print('Bienvenido al vuelo $codigoVuelo');

  // Expresión con ${ }
  print(
    'El vuelo ${codigoVuelo.toUpperCase()} '
    'transportará ${pasajeros + 20} pasajeros luego del abordaje'
  );

  // String multilinea
  final reporte = '''
===== REPORTE DE VUELO =====

Código: $codigoVuelo
Pasajeros: $pasajeros
Vuelo lleno: ${pasajeros >= 180 ? 'Sí' : 'No'}

=============================
''';

  print(reporte);

  // Raw string
  final rutaSistema =
      r'C:\Aeropuerto\ControlVuelos\Reportes';

  print(rutaSistema);

  // Concatenación
  final mensaje =
      'Vuelo ' + codigoVuelo + ' autorizado para despegar';

  print(mensaje);

  // Métodos útiles de String

  print('aeropuerto'.toUpperCase());

  print('  Torre de Control  '.trim());

  print('Aeropuerto'.contains('puerto'));

  print(
    'Vuelo retrasado'.replaceAll('a', 'A')
  );

  print(
    'AV203,IB450,LA500'.split(',')
  );

  print(
    'Aeropuerto'.substring(0, 5)
  );

  print(
    'Control'.startsWith('Con')
  );

  print(
    '203'.padLeft(6, '0')
  );
}