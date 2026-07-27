class Vuelo {
  final String id;
  final String codigoVuelo;
  final String aerolinea;
  final String aerolineaCodigo;
  final String aerolineaNombre;
  final String origen;
  final String origenCodigo;
  final String origenNombre;
  final String destino;
  final String destinoCodigo;
  final String destinoNombre;
  final String puerta;
  final String puertaCodigo;
  final String estado;
  final DateTime fechaSalida;
  final DateTime? fechaLlegada;
  final String? aeronave;
  final int capacidad;
  final int pasajerosAbordados;
  final bool internacional;

  const Vuelo({
    required this.id,
    required this.codigoVuelo,
    required this.aerolinea,
    this.aerolineaCodigo = '',
    this.aerolineaNombre = '',
    required this.origen,
    this.origenCodigo = '',
    this.origenNombre = '',
    required this.destino,
    this.destinoCodigo = '',
    this.destinoNombre = '',
    required this.puerta,
    this.puertaCodigo = '',
    required this.estado,
    required this.fechaSalida,
    this.fechaLlegada,
    this.aeronave,
    required this.capacidad,
    required this.pasajerosAbordados,
    this.internacional = false,
  });

  String get codigo => codigoVuelo;
  int get pasajeros => pasajerosAbordados;

  factory Vuelo.fromJson(Map<String, dynamic> json) {
    return Vuelo(
      id: json['id']?.toString() ?? '',
      codigoVuelo: json['codigo_vuelo'] as String? ?? '',
      aerolinea: json['aerolinea'] as String? ?? '',
      aerolineaCodigo: json['aerolinea_codigo'] as String? ?? '',
      aerolineaNombre: json['aerolinea_nombre'] as String? ?? '',
      origen: json['origen'] as String? ?? '',
      origenCodigo: json['origen_codigo'] as String? ?? '',
      origenNombre: json['origen_nombre'] as String? ?? '',
      destino: json['destino'] as String? ?? '',
      destinoCodigo: json['destino_codigo'] as String? ?? '',
      destinoNombre: json['destino_nombre'] as String? ?? '',
      puerta: json['puerta'] as String? ?? '',
      puertaCodigo: json['puerta_codigo'] as String? ?? '',
      estado: json['estado'] as String? ?? 'programado',
      fechaSalida: json['fecha_salida'] != null
          ? DateTime.parse(json['fecha_salida'] as String)
          : DateTime.now(),
      fechaLlegada: json['fecha_llegada'] != null
          ? DateTime.parse(json['fecha_llegada'] as String)
          : null,
      aeronave: json['aeronave'] as String?,
      capacidad: json['capacidad'] as int? ?? 0,
      pasajerosAbordados: json['pasajeros_abordados'] as int? ?? 0,
      internacional: json['internacional'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigo_vuelo': codigoVuelo,
      'aerolinea': aerolinea,
      'aerolinea_codigo': aerolineaCodigo,
      'aerolinea_nombre': aerolineaNombre,
      'origen': origen,
      'origen_codigo': origenCodigo,
      'origen_nombre': origenNombre,
      'destino': destino,
      'destino_codigo': destinoCodigo,
      'destino_nombre': destinoNombre,
      'puerta': puerta,
      'puerta_codigo': puertaCodigo,
      'estado': estado,
      'fecha_salida': fechaSalida.toIso8601String(),
      'fecha_llegada': fechaLlegada?.toIso8601String(),
      'aeronave': aeronave,
      'capacidad': capacidad,
      'pasajeros_abordados': pasajerosAbordados,
      'internacional': internacional,
    };
  }

  Map<String, dynamic> toJsonCreate() {
    return {
      'codigo_vuelo': codigoVuelo,
      'aerolinea': aerolinea,
      'origen': origen,
      'destino': destino,
      'puerta': puerta,
      'estado': estado,
      'fecha_salida': fechaSalida.toIso8601String(),
      'fecha_llegada': fechaLlegada?.toIso8601String(),
      'aeronave': aeronave,
      'capacidad': capacidad,
      'internacional': internacional,
    };
  }

  Vuelo copyWith({
    String? id,
    String? codigoVuelo,
    String? aerolinea,
    String? aerolineaCodigo,
    String? aerolineaNombre,
    String? origen,
    String? origenCodigo,
    String? origenNombre,
    String? destino,
    String? destinoCodigo,
    String? destinoNombre,
    String? puerta,
    String? puertaCodigo,
    String? estado,
    DateTime? fechaSalida,
    DateTime? fechaLlegada,
    String? aeronave,
    int? capacidad,
    int? pasajerosAbordados,
    bool? internacional,
  }) {
    return Vuelo(
      id: id ?? this.id,
      codigoVuelo: codigoVuelo ?? this.codigoVuelo,
      aerolinea: aerolinea ?? this.aerolinea,
      aerolineaCodigo: aerolineaCodigo ?? this.aerolineaCodigo,
      aerolineaNombre: aerolineaNombre ?? this.aerolineaNombre,
      origen: origen ?? this.origen,
      origenCodigo: origenCodigo ?? this.origenCodigo,
      origenNombre: origenNombre ?? this.origenNombre,
      destino: destino ?? this.destino,
      destinoCodigo: destinoCodigo ?? this.destinoCodigo,
      destinoNombre: destinoNombre ?? this.destinoNombre,
      puerta: puerta ?? this.puerta,
      puertaCodigo: puertaCodigo ?? this.puertaCodigo,
      estado: estado ?? this.estado,
      fechaSalida: fechaSalida ?? this.fechaSalida,
      fechaLlegada: fechaLlegada ?? this.fechaLlegada,
      aeronave: aeronave ?? this.aeronave,
      capacidad: capacidad ?? this.capacidad,
      pasajerosAbordados: pasajerosAbordados ?? this.pasajerosAbordados,
      internacional: internacional ?? this.internacional,
    );
  }

  bool get esCritico => estado == 'retrasado' || estado == 'cancelado';
  bool get estaEnVuelo => estado == 'en_vuelo';
  bool get estaAbordando => estado == 'abordando';
  bool get estaProgramado => estado == 'programado';
  bool get estaAterrizado => estado == 'aterrizado';
  double get ocupacion => capacidad > 0 ? pasajerosAbordados / capacidad : 0;
  int get asientosDisponibles => capacidad - pasajerosAbordados;
  bool get estaLleno => pasajerosAbordados >= capacidad;
}
