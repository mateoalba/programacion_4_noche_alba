class Pasajero {
  final String id;
  final String nombre;
  final String apellido;
  final String documento;
  final String tipoDocumento;
  final String vueloCodigo;
  final String asiento;
  final String estadoEmbarque;
  final bool vip;

  const Pasajero({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.documento,
    required this.tipoDocumento,
    required this.vueloCodigo,
    required this.asiento,
    required this.estadoEmbarque,
    this.vip = false,
  });

  factory Pasajero.fromJson(Map<String, dynamic> json) {
    return Pasajero(
      id: json['id']?.toString() ?? '',
      nombre: json['nombre'] as String? ?? '',
      apellido: json['apellido'] as String? ?? '',
      documento: json['documento'] as String? ?? '',
      tipoDocumento: json['tipo_documento'] as String? ??
          json['tipoDocumento'] as String? ??
          'CC',
      vueloCodigo: json['vuelo_codigo'] as String? ??
          json['vueloCodigo'] as String? ??
          '',
      asiento: json['asiento'] as String? ?? '',
      estadoEmbarque: json['estado_embarque'] as String? ??
          json['estadoEmbarque'] as String? ??
          'pendiente',
      vip: json['vip'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'documento': documento,
      'tipo_documento': tipoDocumento,
      'vuelo_codigo': vueloCodigo,
      'asiento': asiento,
      'estado_embarque': estadoEmbarque,
      'vip': vip,
    };
  }

  Map<String, dynamic> toJsonCreate() {
    return {
      'nombre': nombre,
      'apellido': apellido,
      'documento': documento,
      'tipo_documento': tipoDocumento,
      'vuelo_codigo': vueloCodigo,
      'asiento': asiento,
      'estado_embarque': estadoEmbarque,
      'vip': vip,
    };
  }

  Pasajero copyWith({
    String? id,
    String? nombre,
    String? apellido,
    String? documento,
    String? tipoDocumento,
    String? vueloCodigo,
    String? asiento,
    String? estadoEmbarque,
    bool? vip,
  }) {
    return Pasajero(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      documento: documento ?? this.documento,
      tipoDocumento: tipoDocumento ?? this.tipoDocumento,
      vueloCodigo: vueloCodigo ?? this.vueloCodigo,
      asiento: asiento ?? this.asiento,
      estadoEmbarque: estadoEmbarque ?? this.estadoEmbarque,
      vip: vip ?? this.vip,
    );
  }

  String get nombreCompleto => '$nombre $apellido';
  bool get estaAbordado => estadoEmbarque == 'abordado';
  bool get estaPendiente => estadoEmbarque == 'pendiente';
  bool get estaAusente => estadoEmbarque == 'ausente';
}
