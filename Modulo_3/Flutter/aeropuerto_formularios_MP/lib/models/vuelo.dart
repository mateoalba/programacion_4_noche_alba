class Vuelo {
  final String id;
  final String codigoVuelo;
  final String aerolineaCodigo;
  final String aerolineaNombre;
  final String origenCodigo;
  final String destinoCodigo;
  final String puertaCodigo;
  final String estado;
  final String? fechaSalida;
  final String? fechaLlegada;
  final int pasajerosAbordados;
  final int capacidad;
  final bool internacional;
  final bool favorito;

  const Vuelo({
    this.id = '',
    required this.codigoVuelo,
    this.aerolineaCodigo = '',
    this.aerolineaNombre = '',
    this.origenCodigo = '',
    this.destinoCodigo = '',
    this.puertaCodigo = '',
    this.estado = 'programado',
    this.fechaSalida,
    this.fechaLlegada,
    this.pasajerosAbordados = 0,
    this.capacidad = 0,
    this.internacional = false,
    this.favorito = false,
  });

  factory Vuelo.fromJson(Map<String, dynamic> json) {
    return Vuelo(
      id: json['id']?.toString() ?? '',
      codigoVuelo: json['codigo_vuelo']?.toString() ?? '',
      aerolineaCodigo: json['aerolinea_codigo']?.toString() ?? '',
      aerolineaNombre: json['aerolinea_nombre']?.toString() ?? '',
      origenCodigo: json['origen_codigo']?.toString() ?? '',
      destinoCodigo: json['destino_codigo']?.toString() ?? '',
      puertaCodigo: json['puerta_codigo']?.toString() ?? '',
      estado: json['estado']?.toString() ?? 'programado',
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
      'aerolinea': aerolineaCodigo,
      'origen': origenCodigo,
      'destino': destinoCodigo,
      'puerta': puertaCodigo,
      'estado': estado,
      'capacidad': capacidad,
      'internacional': internacional,
      'pasajeros_abordados': pasajerosAbordados,
      if (fechaSalida != null) 'fecha_salida': fechaSalida,
      if (fechaLlegada != null) 'fecha_llegada': fechaLlegada,
    };
  }

  Vuelo copiarCon({
    String? id,
    String? codigoVuelo,
    String? aerolineaCodigo,
    String? aerolineaNombre,
    String? origenCodigo,
    String? destinoCodigo,
    String? puertaCodigo,
    String? estado,
    String? fechaSalida,
    String? fechaLlegada,
    int? pasajerosAbordados,
    int? capacidad,
    bool? internacional,
    bool? favorito,
  }) =>
      Vuelo(
        id: id ?? this.id,
        codigoVuelo: codigoVuelo ?? this.codigoVuelo,
        aerolineaCodigo: aerolineaCodigo ?? this.aerolineaCodigo,
        aerolineaNombre: aerolineaNombre ?? this.aerolineaNombre,
        origenCodigo: origenCodigo ?? this.origenCodigo,
        destinoCodigo: destinoCodigo ?? this.destinoCodigo,
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
