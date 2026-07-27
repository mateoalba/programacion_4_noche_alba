class LoggedUser {
  final int id;
  final String username;
  final String email;
  final bool esStaff;
  final bool esOperador;

  const LoggedUser({
    required this.id,
    required this.username,
    required this.email,
    this.esStaff = false,
    this.esOperador = false,
  });

  String get nombre => username;
  String get rol => esStaff ? 'admin' : (esOperador ? 'operador' : 'usuario');

  factory LoggedUser.fromJson(Map<String, dynamic> json) {
    return LoggedUser(
      id: json['id'] as int? ?? 0,
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      esStaff: json['es_staff'] as bool? ?? false,
      esOperador: json['es_operador'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'es_staff': esStaff,
      'es_operador': esOperador,
    };
  }

  LoggedUser copyWith({
    int? id,
    String? username,
    String? email,
    bool? esStaff,
    bool? esOperador,
  }) {
    return LoggedUser(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      esStaff: esStaff ?? this.esStaff,
      esOperador: esOperador ?? this.esOperador,
    );
  }

  bool get esAdmin => esStaff;
  bool get esControlador => esOperador;

  String get iniciales {
    final parts = username.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return username.isNotEmpty ? username[0].toUpperCase() : '?';
  }
}
