void main() {

  // =========================================
  // SISTEMA DE CONTROL DE VUELOS - VARIABLES
  // =========================================

  // var — tipo inferido
  var codigoVuelo = 'AV203';
  var pasajeros = 180;
  var altitud = 10500.5;
  var vueloActivo = true;

  // Tipo explícito
  String destino = 'Madrid';
  int puertasEmbarque = 12;
  double velocidad = 850.75;
  bool climaFavorable = false;

  // final
  final aeropuerto = 'Aeropuerto Internacional Mariscal Sucre';

  // const
  const gravedad = 9.8;
  const altitudMaxima = 12000;

  // final vs const
  final fechaActual = DateTime.now();

  print(
    'Vuelo $codigoVuelo con destino a '
    '$destino transporta $pasajeros pasajeros '
    'desde $aeropuerto'
  );

  // ==============================
  // Mutabilidad
  // ==============================

  var vuelosActivos = 0;

  vuelosActivos = 1;

  print('Vuelos activos: $vuelosActivos');

  final listaVuelos = ['AV203', 'IB450', 'LA500'];

  listaVuelos.add('CM300');

  print('Lista de vuelos: $listaVuelos');

  const pistas = ['Pista Norte', 'Pista Sur'];

  // ==============================
  // Null Safety
  // ==============================

  String piloto = 'Carlos';

  String? copiloto = null;

  copiloto = 'Luis';

  String? terminal;

  // Safe call
  print(terminal?.length);

  // Operador ??
  String terminalAsignada =
      terminal ?? 'Sin terminal asignada';

  print(terminalAsignada);

  // Antes de usar !
  terminal = 'Terminal A';

  String terminalSegura = terminal!;

  print(terminalSegura);

  // Null check
  if (copiloto != null) {
    print(copiloto.length);
  }

  // late
  late String codigoRadar;

  codigoRadar = 'RDR-2026';

  print(codigoRadar);

  // ==============================
  // Variables usadas para evitar warnings
  // ==============================

  print(altitud);
  print(vueloActivo);
  print(puertasEmbarque);
  print(velocidad);
  print(climaFavorable);
  print(gravedad);
  print(altitudMaxima);
  print(fechaActual);
  print(piloto);
}