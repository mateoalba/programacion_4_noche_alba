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
  final String fechaSalida;
  final String fechaLlegada;
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
    required this.fechaSalida,
    required this.fechaLlegada,
    required this.pasajerosAbordados,
    required this.capacidad,
    required this.internacional,
    this.favorito = false,
  });

  factory Vuelo.fromJson(Map<String, dynamic> json) => Vuelo(
        id: json['id'] as String? ?? '',
        codigoVuelo: json['codigo_vuelo'] as String? ?? '',
        aerolineaCodigo: json['aerolinea_codigo'] as String? ?? '',
        aerolineaNombre: json['aerolinea_nombre'] as String? ?? '',
        origenCodigo: json['origen_codigo'] as String? ?? '',
        origenNombre: json['origen_nombre'] as String? ?? '',
        destinoCodigo: json['destino_codigo'] as String? ?? '',
        destinoNombre: json['destino_nombre'] as String? ?? '',
        puertaCodigo: json['puerta_codigo'] as String? ?? '',
        estado: json['estado'] as String? ?? 'programado',
        fechaSalida: json['fecha_salida'] as String? ?? '',
        fechaLlegada: json['fecha_llegada'] as String? ?? '',
        pasajerosAbordados: json['pasajeros_abordados'] as int? ?? 0,
        capacidad: json['capacidad'] as int? ?? 0,
        internacional: json['internacional'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
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
  }) =>
      Vuelo(
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
