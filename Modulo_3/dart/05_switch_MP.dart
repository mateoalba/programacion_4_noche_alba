void main() {

  // =========================================
  // SWITCH - CONTROL DE VUELOS
  // =========================================

  String estadoVuelo = 'RETRASADO';

  switch (estadoVuelo) {

    case 'DESPEGANDO':
      print('El vuelo está iniciando despegue');

    case 'ATERRIZANDO':
      print('El vuelo está aterrizando');

    case 'ABORDANDO':
      print('Pasajeros en proceso de embarque');

    case 'RETRASADO':
      print('El vuelo presenta retrasos');

    case 'CANCELADO':
      print('El vuelo fue cancelado');

    default:
      print('Estado desconocido');
  }

  // =========================================
  // SWITCH COMO EXPRESIÓN
  // =========================================

  estadoVuelo = 'DESPEGANDO';

  String descripcion = switch (estadoVuelo) {

    'DESPEGANDO' =>
        'Vuelo autorizado para despegar',

    'ATERRIZANDO' =>
        'Vuelo aproximándose a pista',

    'ABORDANDO' =>
        'Pasajeros ingresando al avión',

    'RETRASADO' =>
        'Vuelo con demora operativa',

    'CANCELADO' =>
        'Vuelo suspendido',

    _ =>
        'Estado desconocido',
  };

  print(descripcion);

  // =========================================
  // MÚLTIPLES VALORES
  // =========================================

  int puerta = 5;

  String terminal = switch (puerta) {

    1 || 2 || 3 =>
        'Terminal Nacional',

    4 || 5 || 6 =>
        'Terminal Internacional',

    7 || 8 || 9 =>
        'Terminal VIP',

    _ =>
        'Puerta desconocida',
  };

  print(terminal);

  // =========================================
  // GUARDS — WHEN
  // =========================================

  double velocidadViento = 85.0;

  String alertaClima = switch (velocidadViento) {

    double v when v >= 120 =>
        '🚨 Tormenta extrema - vuelos suspendidos',

    double v when v >= 80 =>
        '🔴 Vientos fuertes - posibles retrasos',

    double v when v >= 40 =>
        '🟡 Precaución por viento moderado',

    double v when v >= 0 =>
        '🟢 Condiciones climáticas normales',

    _ =>
        'Datos inválidos',
  };

  print(alertaClima);

  // =========================================
  // SWITCH POR TIPO
  // =========================================

  Object respuestaSistema = {

    'vuelo': 'AV203',
    'destino': 'Madrid',
    'pasajeros': 180
  };

  String resultado = switch (respuestaSistema) {

    Map<String, dynamic> m
        when m.containsKey('error') =>

        'Error: ${m['error']}',

    Map<String, dynamic> m =>

        'Vuelo: ${m['vuelo']} '
        '- Destino: ${m['destino']} '
        '- Pasajeros: ${m['pasajeros']}',

    List<dynamic> lista =>

        '${lista.length} vuelos registrados',

    String texto =>

        'Mensaje recibido: $texto',

    _ =>

        'Respuesta desconocida',
  };

  print(resultado);
}