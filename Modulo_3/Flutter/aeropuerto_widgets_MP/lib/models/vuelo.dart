class Vuelo {
  final String id;
  final String codigoVuelo;
  final String aerolineaCodigo;
  final String aerolineaNombre;
  final String origenCodigo;
  final String destinoCodigo;
  final String puertaCodigo;
  final String estado;
  final int pasajerosAbordados;
  final int capacidad;
  final bool internacional;

  const Vuelo({
    required this.id,
    required this.codigoVuelo,
    required this.aerolineaCodigo,
    required this.aerolineaNombre,
    required this.origenCodigo,
    required this.destinoCodigo,
    required this.puertaCodigo,
    required this.estado,
    required this.pasajerosAbordados,
    required this.capacidad,
    required this.internacional,
  });

  bool get esCritico => estado == 'retrasado' || estado == 'cancelado';
  bool get enVuelo => estado == 'en_vuelo';
}
