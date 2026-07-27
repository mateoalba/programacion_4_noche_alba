class Vuelo {
  final String id;
  final String codigoVuelo;
  final String aerolineaCodigo;
  final String aerolineaNombre;
  final String origenCodigo;
  final String origenNombre;
  final String destinoCodigo;
  final String destinoNombre;
  final String puertaCodigo;
  final String estado;
  final String? fechaSalida;
  final String? fechaLlegada;
  final int pasajerosAbordados;
  final int capacidad;
  final bool internacional;
  final bool favorito;

  const Vuelo({
    required this.id,
    required this.codigoVuelo,
    required this.aerolineaCodigo,
    required this.aerolineaNombre,
    required this.origenCodigo,
    required this.origenNombre,
    required this.destinoCodigo,
    required this.destinoNombre,
    required this.puertaCodigo,
    required this.estado,
    this.fechaSalida,
    this.fechaLlegada,
    required this.pasajerosAbordados,
    required this.capacidad,
    required this.internacional,
    this.favorito = false,
  });

  factory Vuelo.fromJson(Map<String, dynamic> json) {
    return Vuelo(
      id: json['id']?.toString() ?? '',
      codigoVuelo: json['codigo_vuelo']?.toString() ?? '',
      aerolineaCodigo: json['aerolinea_codigo']?.toString() ?? '',
      aerolineaNombre: json['aerolinea_nombre']?.toString() ?? '',
      origenCodigo: json['origen_codigo']?.toString() ?? '',
      origenNombre: json['origen_nombre']?.toString() ?? '',
      destinoCodigo: json['destino_codigo']?.toString() ?? '',
      destinoNombre: json['destino_nombre']?.toString() ?? '',
      puertaCodigo: json['puerta_codigo']?.toString() ?? '',
      estado: json['estado']?.toString() ?? '',
      fechaSalida: json['fecha_salida']?.toString(),
      fechaLlegada: json['fecha_llegada']?.toString(),
      pasajerosAbordados: json['pasajeros_abordados'] ?? 0,
      capacidad: json['capacidad'] ?? 0,
      internacional: json['internacional'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo_vuelo': codigoVuelo,
      'aerolinea_codigo': aerolineaCodigo,
      'aerolinea_nombre': aerolineaNombre,
      'origen_codigo': origenCodigo,
      'origen_nombre': origenNombre,
      'destino_codigo': destinoCodigo,
      'destino_nombre': destinoNombre,
      'puerta_codigo': puertaCodigo,
      'estado': estado,
      'fecha_salida': fechaSalida,
      'fecha_llegada': fechaLlegada,
      'pasajeros_abordados': pasajerosAbordados,
      'capacidad': capacidad,
      'internacional': internacional,
    };
  }

  Vuelo copyWith({
    String? id,
    String? codigoVuelo,
    String? aerolineaCodigo,
    String? aerolineaNombre,
    String? origenCodigo,
    String? origenNombre,
    String? destinoCodigo,
    String? destinoNombre,
    String? puertaCodigo,
    String? estado,
    String? fechaSalida,
    String? fechaLlegada,
    int? pasajerosAbordados,
    int? capacidad,
    bool? internacional,
    bool? favorito,
  }) {
    return Vuelo(
      id: id ?? this.id,
      codigoVuelo: codigoVuelo ?? this.codigoVuelo,
      aerolineaCodigo: aerolineaCodigo ?? this.aerolineaCodigo,
      aerolineaNombre: aerolineaNombre ?? this.aerolineaNombre,
      origenCodigo: origenCodigo ?? this.origenCodigo,
      origenNombre: origenNombre ?? this.origenNombre,
      destinoCodigo: destinoCodigo ?? this.destinoCodigo,
      destinoNombre: destinoNombre ?? this.destinoNombre,
      puertaCodigo: puertaCodigo ?? this.puertaCodigo,
      estado: estado ?? this.estado,
      fechaSalida: fechaSalida ?? this.fechaSalida,
      fechaLlegada: fechaLlegada ?? this.fechaLlegada,
      pasajerosAbordados: pasajerosAbordados ?? this.pasajerosAbordados,
      capacidad: capacidad ?? this.capacidad,
      internacional: internacional ?? this.internacional,
      favorito: favorito ?? this.favorito,
    );
  }
}
